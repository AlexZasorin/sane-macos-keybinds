# Sane MacOS Karabiner Elements Rules

Swaps Ctrl/Command and attempts to keep common keybinds as close to default Windows/Linux keybinds as possible for my personal setup.

<br />

## Included Rules
### 1. Swap Command and Control Globally excluding Terminal and iTerm2

### 2. Swap Ctrl/Cmd + x/c/v for Terminal and iTerm2 
For VSCode's integrated terminal add this to `keybindings.json`:
```
  {
    "key": "cmd+c",
    "command": "workbench.action.terminal.copySelection",
    "when": "terminalFocus && terminalTextSelected"
  },
  {
    "key": "cmd+c",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "\u0003" },
    "when": "terminalFocus && !terminalTextSelected"
  }
```

### 3. Swap Command + Tab with Ctrl + Tab excluding Terminal and iTerm2

### 4. Preserve Ctrl+E for Outlook

### 5. Change Caps Lock to Escape (optional)

