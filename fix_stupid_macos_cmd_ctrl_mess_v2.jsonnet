local appExclusions = [
  '^com\\.apple\\.Terminal$',
  '^com\\.googlecode\\.iterm2$',
  // Add any additional applications you wish to exclude
];

local makeDualRule(key, mandatory_modifiers, optional_modifiers=[], except_apps=[]) = [
  // Rule to swap Command to Control
  {
    "type": "basic",
    "from": {
      "key_code": key,
      "modifiers": {
        "mandatory": mandatory_modifiers,
        "optional": optional_modifiers,
      },
    },
    "to": [{
      "key_code": key,
      "modifiers": [if m == 'command' then 'control' else m for m in mandatory_modifiers],
    }],
    "conditions": if except_apps != [] then [
      {
        "type": "frontmost_application_unless",
        "bundle_identifiers": except_apps,
      },
    ] else [],
  },
  // Rule to swap Control to Command
  {
    "type": "basic",
    "from": {
      "key_code": key,
      "modifiers": {
        "mandatory": [if m == 'command' then 'control' else m for m in mandatory_modifiers],
        "optional": optional_modifiers,
      },
    },
    "to": [{
      "key_code": key,
      "modifiers": mandatory_modifiers,
    }],
    "conditions": if except_apps != [] then [
      {
        "type": "frontmost_application_unless",
        "bundle_identifiers": except_apps,
      },
    ] else [],
  },
];

{
  title: 'Advanced Key Swaps V2',
  rules: [
    {
      description: 'Swap Command and Control for specified shortcuts, with exceptions for certain applications',
      manipulators:
        makeDualRule('1', ['command']) +
        makeDualRule('2', ['command']) +
        makeDualRule('3', ['command']) +
        makeDualRule('4', ['command']) +
        makeDualRule('5', ['command']) +
        makeDualRule('6', ['command']) +
        makeDualRule('7', ['command']) +
        makeDualRule('8', ['command']) +
        makeDualRule('9', ['command']) +
        makeDualRule('0', ['command']) +
        makeDualRule(',', ['command']) +
        makeDualRule('/', ['command']) +
        makeDualRule('[', ['command']) +
        makeDualRule(']', ['command']) +
        makeDualRule('a', ['command'], ["any"], appExclusions) +
        makeDualRule('b', ['command'], ["any"], appExclusions) +
        makeDualRule('c', ['command'], ["any"], appExclusions) +
        makeDualRule('d', ['command'], ["any"], appExclusions) +
        makeDualRule('e', ['command'], ["any"], appExclusions + ['^com\\.microsoft\\.Outlook$']) +
        makeDualRule('f', ['command'], ["any"], appExclusions) +
        makeDualRule('g', ['command'], ["any"], appExclusions) +
        makeDualRule('h', ['command'], ["any"], appExclusions) +
        makeDualRule('i', ['command']) +
        makeDualRule('j', ['command'], ["any"], appExclusions) +
        makeDualRule('k', ['command'], ["any"], appExclusions) +
        makeDualRule('l', ['command']) +
        makeDualRule('m', ['command']) +
        makeDualRule('n', ['command'], ["any"], appExclusions) +
        makeDualRule('o', ['command']) +
        makeDualRule('p', ['command'], ["any"], appExclusions) +
        makeDualRule('q', ['command']) +
        makeDualRule('r', ['command'], ["any"], appExclusions) +
        makeDualRule('s', ['command'], ["any"], appExclusions) +
        makeDualRule('t', ['command'], ["any"], appExclusions) +
        makeDualRule('t', ['command']) +
        makeDualRule('u', ['command']) +
        makeDualRule('v', ['command']) +
        makeDualRule('w', ['command'], ["any"], appExclusions) +
        makeDualRule('x', ['command']) +
        makeDualRule('y', ['command']) +
        makeDualRule('z', ['command'], ["any"], appExclusions) +
        makeDualRule(';', ['command']) +
        makeDualRule('{', ['command']) +
        makeDualRule('}', ['command']) +
        makeDualRule('1', ['command', 'shift']) +
        makeDualRule('2', ['command', 'shift']) +
        makeDualRule('3', ['command', 'shift']) +
        makeDualRule('4', ['command', 'shift']) +
        makeDualRule('5', ['command', 'shift']) +
        makeDualRule('6', ['command', 'shift']) +
        makeDualRule('7', ['command', 'shift']) +
        makeDualRule('8', ['command', 'shift']) +
        makeDualRule('9', ['command', 'shift']) +
        makeDualRule('0', ['command', 'shift']) +
        makeDualRule(',', ['command', 'shift']) +
        makeDualRule('/', ['command', 'shift']) +
        makeDualRule('[', ['command', 'shift']) +
        makeDualRule(']', ['command', 'shift']) +
        makeDualRule('a', ['command', 'shift']) +
        makeDualRule('b', ['command', 'shift']) +
        makeDualRule('c', ['command', 'shift']) +
        makeDualRule('d', ['command', 'shift']) +
        makeDualRule('e', ['command', 'shift']) +
        makeDualRule('f', ['command', 'shift']) +
        makeDualRule('g', ['command', 'shift']) +
        makeDualRule('h', ['command', 'shift']) +
        makeDualRule('i', ['command', 'shift']) +
        makeDualRule('j', ['command', 'shift']) +
        makeDualRule('k', ['command', 'shift']) +
        makeDualRule('l', ['command', 'shift']) +
        makeDualRule('m', ['command', 'shift']) +
        makeDualRule('n', ['command', 'shift']) +
        makeDualRule('o', ['command', 'shift']) +
        makeDualRule('p', ['command', 'shift']) +
        makeDualRule('q', ['command', 'shift']) +
        makeDualRule('r', ['command', 'shift']) +
        makeDualRule('s', ['command', 'shift']) +
        makeDualRule('t', ['command', 'shift']) +
        makeDualRule('t', ['command', 'shift']) +
        makeDualRule('u', ['command', 'shift']) +
        makeDualRule('v', ['command', 'shift']) +
        makeDualRule('w', ['command', 'shift']) +
        makeDualRule('x', ['command', 'shift']) +
        makeDualRule('y', ['command', 'shift']) +
        makeDualRule('z', ['command', 'shift']) +
        makeDualRule(';', ['command', 'shift']) +
        makeDualRule('{', ['command', 'shift']) +
        makeDualRule('}', ['command', 'shift']) +
        makeDualRule('f', ['command', 'option']),
    },
  ],
}
