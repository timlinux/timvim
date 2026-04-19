# Timvim Keybindings Reference

Complete and accurate reference for all keybindings in timvim.

## Table of Contents

- [General Keybindings](#general-keybindings)
- [Leader Key Groups](#leader-key-groups)
  - [Assistant (`<leader>a`)](#assistant-leadera)
  - [Buffers (`<leader>b`)](#buffers-leaderb)
  - [Code (`<leader>c`)](#code-leaderc)
  - [Debug (`<leader>d`)](#debug-leaderd)
  - [Files (`<leader>f`)](#files-leaderf)
  - [Git (`<leader>g`)](#git-leaderg)
  - [LSP (`<leader>l`)](#lsp-leaderl)
  - [Markdown (`<leader>m`)](#markdown-leaderm)
  - [Navigate (`<leader>n`)](#navigate-leadern)
  - [Notifications (`<leader>N`)](#notifications-leaderN)
  - [GitHub (`<leader>o`)](#github-leadero)
  - [Refactor (`<leader>r`)](#refactor-leaderr)
  - [Session (`<leader>s`)](#session-leaders)
  - [Test (`<leader>T`)](#test-leaderT)
  - [Toggles (`<leader>t`)](#toggles-leadert)
  - [Lists (`<leader>x`)](#lists-leaderx)
  - [Spell Check (`<leader>z`)](#spell-check-leaderz)
- [F-Keys (Debug Shortcuts)](#f-keys-debug-shortcuts)
- [Insert Mode](#insert-mode)
- [Yazi File Manager](#yazi-file-manager)
- [Flash Navigation](#flash-navigation)
- [Vim Surround](#vim-surround)

---

## General Keybindings

### Navigation
| Key | Mode | Description |
|-----|------|-------------|
| `H` | n, v | Go to start of line (^) |
| `L` | n, v | Go to end of line ($) |
| `Ctrl+l` | n | Go to LSP definition |
| `Ctrl+h` | n | Return from definition (Ctrl+o) |
| `K` | n | LSP hover documentation |
| `-` | n | Open Yazi file manager at current file |

### Clipboard
| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl+Shift+v` | i, c | Paste from system clipboard |
| `MiddleMouse` | i, n | Paste from primary selection (highlighted text) |

### Terminal
| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl+t` | n | Toggle terminal |

---

## Leader Key Groups

### Assistant (`<leader>a`)

**AI assistant tools (Claude Code, Copilot)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ac` | n | Toggle Claude Code terminal |
| `<leader>af` | n | Focus Claude Code terminal |
| `<leader>am` | n | Select Claude model |
| `<leader>as` | v | Send selection to Claude |
| `<leader>ap` | n | Copilot panel |
| `<leader>ai` | n | Copilot info/status |
| `<leader>ae` | n | Enable Copilot |
| `<leader>ad` | n | Disable Copilot |

### Buffers (`<leader>b`)

**Buffer management**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>bb` | n | Find buffers (Telescope) |

### Code (`<leader>c`)

**Code actions and formatting**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>cf` | n | Format buffer |
| `<leader>cc` | n | Check available formatters |
| `<leader>cr` | n | Rename symbol (LSP) |
| `<leader>cp` | n | Pick color (MiniColors) |

**Note:** LSP navigation (definitions, references, etc.) is under the Navigate group (`<leader>n`)

### Debug (`<leader>d`)

**Debugging tools (DAP)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>da` | n | Attach to Python Debugger |
| `<leader>dl` | n | Start/continue local debugging |
| `<leader>ds` | n | Show debug status |
| `<leader>di` | n | Check debugpy installation |
| `<leader>dk` | n | Kill hanging debug processes |
| `<leader>dc` | n | Continue (F5) |
| `<leader>db` | n | Toggle breakpoint (F8) |
| `<leader>dv` | n | Step over (F9) |
| `<leader>dn` | n | Step into (F10) |
| `<leader>do` | n | Step back |
| `<leader>dt` | n | Run to cursor (F12) |
| `<leader>dq` | n | Terminate (Shift+F5) |
| `<leader>dR` | n | Restart |
| `<leader>d.` | n | Run last |
| `<leader>dh` | n | Hover |
| `<leader>dj` | n | Go down |
| `<leader>du` | n | Toggle DAP UI (Shift+F9) |
| `<leader>dr` | n | Toggle REPL |

**Note:** `<leader>da` prompts for a port number at runtime (defaults to last used or 9000).

### Files (`<leader>f`)

**File navigation and search**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | n | Find files (Telescope with FZF) |
| `<leader>fg` | n | Live grep files (fixed strings, excludes .git & __pycache__) |
| `<leader>fG` | n | Live grep files (regex patterns) |
| `<leader>fm` | n | Find media files with preview (images, videos, PDFs) |
| `<leader>fp` | n | Find Python files |
| `<leader>fn` | n | Find Nix files |
| `<leader>fo` | n | Open Yazi at current file |
| `<leader>fO` | n | Open Yazi in working directory |
| `<leader>fy` | n | Toggle/resume last Yazi session |

### Git (`<leader>g`)

**Git operations (Gitsigns, Lazygit, Diffview, conflict resolution)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | n | Open Lazygit |
| `<leader>gl` | n | Git log (Telescope) |
| `<leader>gb` | n | Toggle git blame line |
| `<leader>gx` | n | Toggle blame (alternative) |
| `<leader>gs` | n, v | Stage hunk / Stage selected hunk |
| `<leader>gr` | n, v | Reset hunk / Reset selected hunk |
| `<leader>gS` | n | Stage buffer |
| `<leader>gR` | n | Reset buffer |
| `<leader>gu` | n | Undo stage hunk |
| `<leader>gp` | n | Preview hunk |
| `<leader>gd` | n | Diff this |
| `<leader>gD` | n | Diff project (~) |
| `<leader>gv` | n | Open Diff View |
| `<leader>gV` | n | Close Diff View |
| `<leader>gf` | n | File git history (Diffview) |
| `<leader>gF` | n | Project git history (Diffview) |
| `<leader>gn` | n | Git conflict: choose none |
| `<leader>gt` | n | Git conflict: choose theirs |
| `<leader>gc` | n | Git conflict: choose ours |
| `<leader>ga` | n | Git conflict: choose both |

### LSP (`<leader>l`)

**LSP diagnostics and trouble lists**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lw` | n | Workspace diagnostics (Trouble) |
| `<leader>ld` | n | Document diagnostics (Trouble) |
| `<leader>lr` | n | LSP references (Trouble) |
| `<leader>ln` | n | Next diagnostic |
| `<leader>lp` | n | Previous diagnostic |

### Markdown (`<leader>m`)

**Markdown-specific keybindings (only available in .md files)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mf` | n | Format markdown |
| `<leader>mw` | n | Toggle word wrap |
| `<leader>md` | n | Insert current date |
| `<leader>ml` | n | Insert link template |
| `<leader>mi` | n | Insert image template |
| `<leader>mp` | n | Toggle markdown preview |

**Note:** Spell check keybindings (`<leader>z`) are also available in markdown files with buffer-local overrides.

### Navigate (`<leader>n`)

**LSP navigation (definitions, references, symbols)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>nd` | n | Go to definition (LSP) |
| `<leader>nD` | n | Go to declaration (LSP) |
| `<leader>ni` | n | Find implementations (Telescope) |
| `<leader>nt` | n | Find type definitions (Telescope) |
| `<leader>nr` | n | Find references (Telescope) |
| `<leader>nh` | n | Hover documentation (LSP) |
| `<leader>ns` | n | Find document symbols (Telescope) |

### Notifications (`<leader>N`)

**Notification management**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>Nd` | n | Dismiss all notifications |
| `<leader>Nh` | n | Notification history (Telescope) |

### GitHub (`<leader>o`)

**GitHub integration via Octo (issues, PRs, reviews, comments, repos)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>oi` | n | List issues |
| `<leader>oI` | n | Search issues |
| `<leader>on` | n | New issue |
| `<leader>oO` | n | Open issue in browser |
| `<leader>op` | n | List PRs |
| `<leader>oP` | n | Search PRs |
| `<leader>oc` | n | Create PR |
| `<leader>od` | n | View PR diff |
| `<leader>of` | n | View changed files |
| `<leader>om` | n | Merge PR |
| `<leader>ok` | n | Checkout PR |
| `<leader>ob` | n | Open PR in browser |
| `<leader>os` | n | Start review |
| `<leader>or` | n | Resume review |
| `<leader>oa` | n | Approve review |
| `<leader>ox` | n | Request changes |
| `<leader>ou` | n | Submit comment |
| `<leader>oX` | n | Discard review |
| `<leader>oA` | n | Add comment |
| `<leader>oD` | n | Delete comment |
| `<leader>ol` | n | List repos |
| `<leader>oe` | n | Open repo in browser |
| `<leader>og` | n | List gists |

### Refactor (`<leader>r`)

**Code refactoring (ThePrimeagen's refactoring.nvim)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>re` | v | Extract function |
| `<leader>rf` | v | Extract to file |
| `<leader>rv` | v | Extract variable |
| `<leader>ri` | n, v | Inline variable |
| `<leader>rI` | n | Inline function |
| `<leader>rb` | n | Extract block |
| `<leader>rB` | n | Extract block to file |
| `<leader>rr` | n, v | Select refactor (show all options) |

**Supported languages:** Go, Python, JavaScript/TypeScript, Lua, C/C++, Java, Ruby, PHP

### Session (`<leader>s`)

**Session management**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sm` | n | Open session manager |

### Test (`<leader>T`)

**Test runner (Neotest — Python, Go, Rust)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>Tr` | n | Run nearest test |
| `<leader>Tf` | n | Run tests in file |
| `<leader>Td` | n | Debug nearest test (via DAP) |
| `<leader>Tx` | n | Stop test run |
| `<leader>To` | n | Show test output |
| `<leader>Tp` | n | Toggle test output panel |
| `<leader>Ts` | n | Toggle test summary |

### Toggles (`<leader>t`)

**Toggle various features on/off**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tt` | n, t | Toggle floating terminal |
| `<leader>th` | n | Toggle HardTime |
| `<leader>tc` | n | Toggle Treesitter context |
| `<leader>ti` | n | Toggle indent guides |
| `<leader>to` | n | Toggle code outline panel (Aerial) |
| `<leader>tw` | n | Toggle CursorHold error tooltips |
| `<leader>tv` | n | Toggle virtual text diagnostics |
| `<leader>tp` | n | Toggle Precognition |
| `<leader>tg` | n | Toggle Harper grammar checker |
| `<leader>tz` | n | Toggle spell autopopup |
| `<leader>tu` | n | Toggle undo tree |
| `<leader>tI` | n | Toggle image preview |
| `<leader>tT` | n | Toggle typing tutor |

### Lists (`<leader>x`)

**Quickfix, location list, and symbols (Trouble)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xq` | n | Quickfix (Trouble) |
| `<leader>xl` | n | Location list (Trouble) |
| `<leader>xs` | n | Symbols (Trouble) |

### Spell Check (`<leader>z`)

**Spell checking (global and markdown-specific)**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>zs` | n | Toggle global/markdown spell check |
| `<leader>z=` | n | Show spell suggestions |
| `<leader>za` | n | Add word to dictionary |
| `<leader>zb` | n | Mark word as bad |
| `<leader>zr` | n | Remove word from dictionary |
| `<leader>zf` | n | Quick fix with first suggestion |
| `<leader>zt` | n | Toggle syntax-based spell check (Python only) |
| `]s` | n | Next misspelled word |
| `[s` | n | Previous misspelled word |

---

## F-Keys (Debug Shortcuts)

**Single-keypress debug shortcuts**

| Key | Mode | Description |
|-----|------|-------------|
| `F5` | n | Debug: Continue |
| `F8` | n | Debug: Toggle breakpoint |
| `F9` | n | Debug: Step over |
| `F10` | n | Debug: Step into |
| `F11` | n | Debug: Step out |
| `F12` | n | Debug: Run to cursor |
| `Shift+F5` | n | Debug: Terminate |
| `Shift+F8` | n | Debug: Clear all breakpoints |
| `Shift+F9` | n | Debug: Toggle DAP UI |

---

## Insert Mode

### Completion (Blink-CMP)

**Harmonized popup navigation**

| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl+j` | i | Move to next item in completion menu |
| `Ctrl+k` | i | Move to previous item in completion menu |
| `Tab` | i | Accept selected completion |
| `Enter` | i | Accept selected completion (smart) |
| `Ctrl+e` | i | Close completion menu |
| `Ctrl+Space` | i | Manually trigger completion |

### Copilot Ghost Text

**Manual trigger mode (Ctrl+y to activate)**

| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl+y` | i | Trigger or accept Copilot suggestion |
| `Alt+w` | i | Accept next word from ghost text |
| `Alt+e` | i | Accept current line from ghost text |
| `Alt+]` | i | Next Copilot suggestion |
| `Alt+[` | i | Previous Copilot suggestion |
| `Ctrl+]` | i | Dismiss Copilot suggestion |
| `Alt+\` | i | Toggle Copilot suggestions |
| `Alt+Enter` | i | Open Copilot panel |

**Statusline indicator:** Green circle + "Ctl-Y" when Copilot is enabled and active; gray circle when disabled.

---

## Yazi File Manager

**Keybindings within Yazi window**

| Key | Description |
|-----|-------------|
| `F1` | Show help |
| `Ctrl+v` | Open file in vertical split |
| `Ctrl+x` | Open file in horizontal split |
| `Ctrl+t` | Open file in tab |
| `Ctrl+s` | Grep in directory |
| `Ctrl+g` | Replace in directory |
| `Tab` | Cycle open buffers |
| `Ctrl+y` | Copy relative path to selected files |

**Configuration:**
- Yazi automatically opens for directory buffers (replaces netrw)
- Floating window with 90% screen scaling
- Rounded borders

---

## Flash Navigation

**Quick motion/jumping with flash.nvim**

| Key | Mode | Description |
|-----|------|-------------|
| `s` | n, x, o | Flash jump - type characters to jump to location |
| `S` | n, x, o | Flash Treesitter - jump to treesitter nodes |
| `r` | o | Remote flash - jump to remote location for operator |
| `R` | o, x | Treesitter search - search with treesitter |
| `Ctrl+s` | c | Toggle flash search in command line |

**Usage:**
1. Press `s` to activate flash
2. Type characters you want to jump to
3. Labels appear - press the label key to jump
4. For `S` (Treesitter), labels appear on AST nodes

**WhichKey Integration:** Flash bindings (`s`, `S`) appear in the root whichKey menu with icons.

---

## Vim Surround

**Text manipulation with nvim-surround (remapped to avoid flash conflicts)**

### Normal Mode

| Key | Mode | Description |
|-----|------|-------------|
| `gz{motion}{char}` | n | Add surround around motion (e.g., `gziw"` surrounds word with quotes) |
| `gzz{char}` | n | Add surround around entire line |
| `gZ{char}` | n | Add surround around current cursor position |
| `gZZ{char}` | n | Add surround around current line (alternative) |
| `gzd{char}` | n | Delete surrounding character (e.g., `gzd"` removes quotes) |
| `gzr{old}{new}` | n | Replace surrounding (e.g., `gzr"'` changes quotes to single quotes) |
| `gZR{old}{new}` | n | Replace surrounding on line |

### Visual Mode

| Key | Mode | Description |
|-----|------|-------------|
| `gz{char}` | v | Surround visual selection with character |
| `gZ{char}` | v | Surround visual selection with character on new lines |

### Insert Mode

| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl+g z{char}` | i | Insert surround |
| `Ctrl+g Z{char}` | i | Insert surround on new lines |

**Examples:**
- `gziw"` - Surround inner word with double quotes
- `gza}"` - Surround around `}` with double quotes
- `gzd'` - Delete surrounding single quotes
- `gzr"'` - Change surrounding double quotes to single quotes
- Visual select + `gz)` - Wrap selection in parentheses

**Note:** Default vim-surround uses `s`/`S` which conflicts with flash.nvim. These keybindings have been remapped to use `gz`/`gZ` prefix.

**WhichKey Integration:** Press `g` then wait for whichKey to see the `gz` Surround group. Press `gz` to see all surround actions.

---

_Last Updated: 2026-04-19_
_Reflects current state after notification group reorganization (leader-N), Octo keybinding flattening, debug port prompting, and Copilot statusline simplification_
