local terminal_app_exclusions = [
  '^com\\.apple\\.Terminal$',
  '^com\\.googlecode\\.iterm2$',
  // Add any additional applications you wish to exclude
];

local letter_exceptions = ['e'];
local lowercase_letters = [
  if !std.member(letter_exceptions, std.char(i)) then std.char(i) for i in std.range(97, 122) // 'a' to 'z' in ASCII
];

local numbers = [
  std.toString(i) for i in std.range(1, 9)
];

local punctuation = [',', 'slash', '[', ']', '{', ';', '}', '`'];
local all_characters = numbers + lowercase_letters + punctuation;
local bash_shortcut_letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'n', 'p', 'q', 'r', 's', 't', 'u', 'w', 'y', 'z'];

local makeSimpleRule(key_code_from, key_code_to, except_apps=[]) = [
  {
    'type': 'basic',
    'from': {
      'key_code': key_code_from,
      'modifiers': {
        'optional': [],
      },
    },
    'to': [
      {
        'key_code': key_code_to,
      }
    ],
    [if std.length(except_apps) > 0 then 'conditions']: [
      {
        'type': 'frontmost_application_unless',
        'bundle_identifiers': except_apps,
      }
    ],
  },
];

local makeDualRule(mandatory_modifiers, key='', optional_modifiers=[], except_apps=[], pointing_button='') = [
  // Rule to swap Command to Control
  {
    'type': 'basic',
    'from': {
      [if key != '' then 'key_code']: key,
      'modifiers': {
        'mandatory': mandatory_modifiers,
        'optional': optional_modifiers,
      },
      [if pointing_button != '' then 'pointing_button']: pointing_button,
    },
    'to': [{
      [if key != '' then 'key_code']: key,
      'modifiers': [if m == 'command' then 'control' else m for m in mandatory_modifiers],
      [if pointing_button != '' then 'pointing_button']: pointing_button,
    }],
    'conditions': if except_apps != [] then [
      {
        'type': 'frontmost_application_unless',
        'bundle_identifiers': except_apps,
      },
    ] else [],
  },
  // Rule to swap Control to Command
  {
    'type': 'basic',
    'from': {
      [if key != '' then 'key_code']: key,
      'modifiers': {
        'mandatory': [if m == 'command' then 'control' else m for m in mandatory_modifiers],
        'optional': optional_modifiers,
      },
      [if pointing_button != '' then 'pointing_button']: pointing_button,
    },
    'to': [{
      [if key != '' then 'key_code']: key,
      'modifiers': mandatory_modifiers,
      [if pointing_button != '' then 'pointing_button']: pointing_button,
    }],
    'conditions': if except_apps != [] then [
      {
        'type': 'frontmost_application_unless',
        'bundle_identifiers': except_apps,
      },
    ] else [],
  },
];

local commandRules = [
  rules
  for subarray in [
    if std.member(bash_shortcut_letters, i) then makeDualRule(['command'], i, [], terminal_app_exclusions) else makeDualRule(['command'], i) 
    for i in all_characters
  ]
  for rules in subarray
];

local commandShiftRules = [
  rules
  for subarray in [
    if std.member(bash_shortcut_letters, i) then makeDualRule(['command', 'shift'], i, [], terminal_app_exclusions) else makeDualRule(['command', 'shift'], i) 
    for i in all_characters
  ]
  for rules in subarray
];

{
  title: 'Advanced Key Swaps V2',
  rules: [
    {
      description: 'Swap Command and Control for specified shortcuts, with exceptions for certain applications',
      manipulators:
        commandRules +
        makeDualRule(['command'], 'e', [], terminal_app_exclusions + ['^com\\.microsoft\\.Outlook$']) +
        makeDualRule(['command'], '', [], [], 'button1') +
        commandShiftRules +
        makeDualRule(['command', 'option'], 'f'),
    },
  ],
}
