# Claude Tips

A guide for installing Claude IDE plugins and setting up the Context Bar script.

## Plugin Installation

Add plugins in Claude IDE using these commands:

```
/plugin marketplace add obra/superpowers-marketplace
/plugin marketplace add anthropics/skills
/plugin marketplace add ykdojo/claude-code-tips
```

**See also:** [claude-code-tips](https://github.com/ykdojo/claude-code-tips)

## Context Bar Setup

The `context-bar.sh` script displays the model name and current working directory in the Claude IDE status bar.

### Installation

1. **Copy the script**

   ```bash
   mkdir -p ~/.claude/scripts
   cp context-bar.sh ~/.claude/scripts/
   chmod +x ~/.claude/scripts/context-bar.sh
   ```

2. **Update settings**

   Add the following to your `~/.claude/settings.json`:

   ```json
   {
     "statusLine": {
       "type": "command",
       "command": "~/.claude/scripts/context-bar.sh"
     }
   }
   ```

### Theme Colors

Change the `COLOR` variable at the top of `context-bar.sh` to customize the appearance:
`gray`, `orange`, `blue`, `teal`, `green`, `lavender`, `rose`, `gold`, `slate`, `cyan`
