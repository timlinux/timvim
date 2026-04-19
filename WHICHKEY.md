# Timvim Which-Key Menu Reference

Complete reference for all which-key menus and their items in timvim.
Leader key is `Space`.

_Last Updated: 2026-04-19_

---

## Top-Level Groups

| Key | Group | Description |
|-----|-------|-------------|
| `Space a` | 󰚩 Assistant | AI assistant tools (Claude Code, Copilot) |
| `Space b` | 󰓩 Buffers | Buffer management and window swapping |
| `Space c` | 󰅩 Code | Code formatting, renaming, and color tools |
| `Space d` | 󰃤 Debug | DAP debugger controls and breakpoints |
| `Space f` | 󰈞 Files | File finding, grepping, and Yazi file manager |
| `Space g` | 󰊢 Git | Git operations, hunks, diffs, and conflict resolution |
| `Space h` | 󰊢 Gitsigns | Gitsigns group (registered, shares `g` operations) |
| `Space i` | 󰋩 Image | Image preview controls |
| `Space l` | 󰌵 LSP | LSP diagnostics and Trouble lists |
| `Space m` | 󰍔 Markdown | Markdown editing tools (buffer-local, `.md` files only) |
| `Space n` | 󰑮 Navigate | LSP navigation (definitions, references, symbols) |
| `Space N` | 󰈸 Notifications | Notification history and dismissal |
| `Space o` |  GitHub | Octo GitHub integration (issues, PRs, reviews) |
| `Space r` | 󰑕 Refactor | Code refactoring via refactoring.nvim |
| `Space s` | 󰆔 Session | Session management |
| `Space t` | 󰔡 Toggles | Feature toggles (terminal, UI aids, diagnostics) |
| `Space T` | 󰙨 Test | Neotest test runner |
| `Space x` | 󰖷 Lists | Trouble/quickfix/loclist windows |
| `Space z` | 󰓆 Spell | Spell checking operations |

> **Note on toggle icons:** All items in `Space t` have dynamic icons. The icon is rendered in gray when the feature is OFF and in blue when ON. The description updates to show `[ON]` or `[OFF]` state.

---

## Space a - Assistant

AI assistant tools including Claude Code chat and GitHub Copilot inline completion.

| Key | Description | Mode |
|-----|-------------|------|
| `Space a c` | 󰚩 Toggle Claude Code terminal | Normal |
| `Space a f` | 󰚩 Focus Claude Code terminal | Normal |
| `Space a m` | 󰚩 Select Claude Model | Normal |
| `Space a s` | 󰚩 Send Selection to Claude | Visual |
| `Space a p` | 󰄛 Copilot Panel | Normal |
| `Space a i` |  Copilot Info/Status | Normal |
| `Space a e` | 󰄬 Enable Copilot | Normal |
| `Space a d` | 󰄮 Disable Copilot | Normal |

---

## Space b - Buffers

Buffer management and window swapping via smart-splits.nvim.

| Key | Description | Mode |
|-----|-------------|------|
| `Space b b` | 󰈔 Find Buffers (Telescope) | Normal |
| `Space b j` | Swap buffer down | Normal |
| `Space b k` | Swap buffer up | Normal |
| `Space b s` | Swap buffer left | Normal |
| `Space b d` | Swap buffer right | Normal |

---

## Space c - Code

Code actions, formatting, and color utilities.

| Key | Description | Mode |
|-----|-------------|------|
| `Space c f` | 󰉿 Format Buffer | Normal |
| `Space c c` | 󰉿 Check Available Formatters | Normal |
| `Space c r` | 󰏫 Rename Symbol (LSP) | Normal |
| `Space c p` | 󰏘 Pick Color (mini.colors) | Normal |

---

## Space d - Debug

Full DAP debugger controls. All leader mappings have matching F-key shortcuts where noted.

| Key | Description | Mode | F-key |
|-----|-------------|------|-------|
| `Space d c` | 󰐊 Continue | Normal | `F5` |
| `Space d v` | 󰆹 Step Over | Normal | `F9` |
| `Space d n` | 󰆸 Step Into | Normal | `F10` |
| `Space d o` | Step Back | Normal | — |
| `Space d t` | 󰆾 Run to Cursor | Normal | `F12` |
| `Space d b` | 󰃤 Toggle Breakpoint (persistent) | Normal | `F8` |
| `Space d B` | 󰃤 Set Conditional Breakpoint | Normal | — |
| `Space d L` | 󰃤 Set Log Point | Normal | — |
| `Space d u` | 󰕮 Toggle DAP UI | Normal | `Shift+F9` |
| `Space d r` | Toggle REPL | Normal | — |
| `Space d h` | Hover (DAP) | Normal | — |
| `Space d j` | Go Down (DAP REPL) | Normal | — |
| `Space d k` | Go Up (DAP REPL) | Normal | — |
| `Space d R` | Restart | Normal | — |
| `Space d .` | Run Last | Normal | — |
| `Space d q` | 󰅗 Terminate | Normal | `Shift+F5` |
| `Space d a` | 󰌠 Attach to Python Debugger (remote) | Normal | — |
| `Space d l` | 󰐊 Start/Continue local debugging | Normal | — |
| `Space d s` | 󰋼 Show debug status | Normal | — |
| `Space d i` | 󰏗 Check debugpy installation | Normal | — |
| `Space d k` | 󰅗 Kill hanging debug processes | Normal | — |

---

## Space f - Files

File finding, grepping, and file manager access.

| Key | Description | Mode |
|-----|-------------|------|
| `Space f f` | 󰈞 Find Files (FZF, includes hidden) | Normal |
| `Space f p` | 󰈬 Find Python Files | Normal |
| `Space f n` | 󰈬 Find Nix Files | Normal |
| `Space f g` | 󰑑 Live Grep Files (Fixed Strings) | Normal |
| `Space f G` | 󰑑 Live Grep Files (Regex) | Normal |
| `Space f m` | 󰋩 Find Media Files with Preview | Normal |
| `Space f o` | 󰉋 Open Yazi at Current File | Normal |
| `Space f O` | 󰉋 Open Yazi in Working Directory | Normal |
| `Space f y` | 󰉋 Toggle/Resume Last Yazi Session | Normal |

> **Tip:** Press `-` (dash) in normal mode as a quick shortcut to open Yazi at the current file, without using the leader key.

---

## Space g - Git

Full git workflow: blame, hunks, diffs, conflict resolution, and history. Most bindings are **buffer-local** (registered via gitsigns `on_attach`).

| Key | Description | Mode |
|-----|-------------|------|
| `Space g b` | 󰋚 Toggle Git Blame Line | Normal |
| `Space g x` | Toggle Blame (gitsigns NVF mapping) | Normal |
| `Space g s` | 󰐕 Stage Hunk | Normal / Visual (selected lines) |
| `Space g r` | 󰕌 Reset Hunk | Normal / Visual (selected lines) |
| `Space g S` | 󰐕 Stage Buffer | Normal |
| `Space g R` | 󰕌 Reset Buffer | Normal |
| `Space g u` | 󰕍 Undo Stage Hunk | Normal |
| `Space g p` | 󰋽 Preview Hunk | Normal |
| `Space g d` |  Diff This | Normal |
| `Space g D` |  Diff Project | Normal |
| `Space g v` |  Open Diff View (diffview.nvim) | Normal |
| `Space g V` | 󰅖 Close Diff View | Normal |
| `Space g f` | 󰋚 File Git History | Normal |
| `Space g F` | 󰋚 Project Git History | Normal |
| `Space g l` | 󰋚 Git Log (Telescope) | Normal |
| `Space g g` | Open Lazygit | Normal |
| `Space g n` | 󰜺 Git Choose None (conflict) | Normal (buffer-local) |
| `Space g t` | 󰁔 Git Choose Theirs (conflict) | Normal (buffer-local) |
| `Space g c` | 󰁕 Git Choose Ours (conflict) | Normal (buffer-local) |
| `Space g a` | 󰐙 Git Choose Both (conflict) | Normal (buffer-local) |

---

## Space i - Image

Image preview controls using image.nvim and the Kitty graphics protocol.

| Key | Description | Mode |
|-----|-------------|------|
| `Space i c` | 󰹍 Clear Images in Buffer | Normal |

> **Note:** `Space t I` (in the Toggles group) is used to enable/disable image preview globally. In markdown files, `Esc` also clears images and search highlight.

---

## Space l - LSP

LSP diagnostics navigation and Trouble list windows.

| Key | Description | Mode |
|-----|-------------|------|
| `Space l n` | 󰒕 Next Diagnostic | Normal |
| `Space l p` | 󰒖 Previous Diagnostic | Normal |
| `Space l w` | 󰋽 Workspace Diagnostics (Trouble) | Normal |
| `Space l d` | 󰋽 Document Diagnostics (Trouble) | Normal |
| `Space l r` | 󰈇 LSP References (Trouble) | Normal |

---

## Space m - Markdown

Markdown editing helpers. **Buffer-local — only available in `.md` files.**

| Key | Description |
|-----|-------------|
| `Space m f` | 󰉿 Format Markdown |
| `Space m w` | 󰖶 Toggle Word Wrap |
| `Space m d` | 󰃰 Insert Date (YYYY-MM-DD) |
| `Space m l` | 󰌹 Insert Link Template `[text](url)` |
| `Space m i` | 󰋩 Insert Image Template `![alt text](image_path)` |
| `Space m p` | 󰋽 Toggle Markdown Preview |

> Spell checking keybindings (`Space z *`) are also active buffer-locally in markdown files with markdown-specific behavior (toggles buffer-local spell, not global).

---

## Space n - Navigate

LSP-powered navigation using Telescope pickers.

| Key | Description | Mode |
|-----|-------------|------|
| `Space n d` | 󰈞 Go to Definition | Normal |
| `Space n D` | 󰈝 Go to Declaration | Normal |
| `Space n i` | 󰡱 Find Implementations | Normal |
| `Space n t` |  Find Type Definitions | Normal |
| `Space n r` | 󰈇 Find References | Normal |
| `Space n h` | 󰋽 Hover Documentation | Normal |
| `Space n s` | 󰊕 Find Document Symbols | Normal |

---

## Space N - Notifications

Notification management via nvim-notify + Telescope.

| Key | Description | Mode |
|-----|-------------|------|
| `Space N d` | 󰅖 Dismiss All Notifications | Normal |
| `Space N h` | 󰋚 Notification History (Telescope) | Normal |

---

## Space o - GitHub

GitHub integration via Octo.nvim (requires active GitHub authentication).

### Issues

| Key | Description |
|-----|-------------|
| `Space o i` |  List Issues |
| `Space o I` |  Search Issues |
| `Space o n` |  New Issue |
| `Space o O` |  Open in Browser |

### Pull Requests

| Key | Description |
|-----|-------------|
| `Space o p` |  List PRs |
| `Space o P` |  Search PRs |
| `Space o c` |  Create PR |
| `Space o d` |  View Diff |
| `Space o f` |  Changed Files |
| `Space o m` |  Merge PR |
| `Space o k` |  Checkout PR |
| `Space o b` |  Open PR in Browser |

### Reviews

| Key | Description |
|-----|-------------|
| `Space o s` |  Start Review |
| `Space o r` |  Resume Review |
| `Space o a` |  Approve |
| `Space o x` |  Request Changes |
| `Space o u` |  Submit Comment |
| `Space o X` |  Discard Review |

### Comments

| Key | Description |
|-----|-------------|
| `Space o A` |  Add Comment |
| `Space o D` |  Delete Comment |

### Repo & Gists

| Key | Description |
|-----|-------------|
| `Space o l` |  List Repos |
| `Space o e` |  Open Repo in Browser |
| `Space o g` |  List Gists |

---

## Space r - Refactor

Code refactoring operations via refactoring.nvim. Supported languages: Go, Python, JavaScript/TypeScript, Lua, C/C++, Java, Ruby, PHP.

| Key | Description | Mode |
|-----|-------------|------|
| `Space r e` | 󰆧 Extract Function | Visual |
| `Space r f` | 󰈙 Extract to File | Visual |
| `Space r v` |  Extract Variable | Visual |
| `Space r i` | 󰗈 Inline Variable | Normal / Visual |
| `Space r I` | 󰗈 Inline Function | Normal |
| `Space r b` | 󰆧 Extract Block | Normal |
| `Space r B` | 󰈙 Extract Block to File | Normal |
| `Space r r` | 󰑕 Select Refactor (menu) | Normal / Visual |

---

## Space s - Session

Session management.

| Key | Description | Mode |
|-----|-------------|------|
| `Space s m` | 󰆔 Open Session Manager | Normal |

---

## Space t - Toggles

Feature toggles. Each item's icon changes color: gray = OFF, blue = ON. The description updates dynamically to show `[ON]` or `[OFF]`.

| Key | Icon | Description | Mode |
|-----|------|-------------|------|
| `Space t t` |  | Toggle Floating Terminal | Normal / Terminal |
| `Space t h` | 󰥔 | Toggle HardTime (vim discipline) | Normal |
| `Space t c` | 󰐅 | Toggle Treesitter Context | Normal |
| `Space t i` | 󰌒 | Toggle Indent Guides | Normal |
| `Space t o` | 󰊕 | Toggle Code Outline Panel (Aerial) | Normal |
| `Space t w` | 󰀪 | Toggle CursorHold Error Tooltips | Normal |
| `Space t v` | 󰝤 | Toggle Virtual Text Diagnostics | Normal |
| `Space t p` | 󰈈 | Toggle Precognition | Normal |
| `Space t g` | 󰗊 | Toggle Harper Grammar Checker | Normal |
| `Space t z` | 󰓆 | Toggle Spell Suggestion Autopopup | Normal |
| `Space t u` | 󰕌 | Toggle Undo Tree | Normal |
| `Space t T` | 󰌌 | Typing Tutor (Typr) | Normal |
| `Space t I` | 󰋩 | Toggle Image Preview (Kitty) | Normal |

---

## Space T - Test

Test runner via Neotest (supports Python/pytest, Go, Rust).

| Key | Description | Mode |
|-----|-------------|------|
| `Space T r` | 󰐊 Run Nearest Test | Normal |
| `Space T f` | 󰈙 Run Tests in File | Normal |
| `Space T d` | 󰃤 Debug Nearest Test (via DAP) | Normal |
| `Space T x` | 󰅗 Stop Test Run | Normal |
| `Space T o` | 󰋽 Show Test Output | Normal |
| `Space T p` | 󰕮 Toggle Test Output Panel | Normal |
| `Space T s` | 󰊕 Toggle Test Summary | Normal |

---

## Space x - Lists

Trouble.nvim quickfix and location list windows.

| Key | Description | Mode |
|-----|-------------|------|
| `Space x q` | 󰁨 Quickfix List (Trouble) | Normal |
| `Space x l` | 󰌵 Location List (Trouble) | Normal |
| `Space x s` | 󰊕 LSP Document Symbols (Trouble) | Normal |

---

## Space z - Spell

Spell checking operations. These bindings are also available buffer-locally in `.md` and `.py` files with file-type-specific behavior.

| Key | Description | Mode |
|-----|-------------|------|
| `Space z s` | 󰓆 Toggle Global Spell Check | Normal |
| `Space z =` | 󰁨 Show Spell Suggestions | Normal |
| `Space z a` | 󰐕 Add Word to Dictionary | Normal |
| `Space z b` | 󰃤 Mark Word as Bad | Normal |
| `Space z r` | 󰐖 Remove Word from Dictionary | Normal |
| `Space z f` | 󰁨 Quick Fix with First Suggestion | Normal |
| `Space z t` | 󰗊 Toggle Syntax-based Spell Check (Python info) | Normal |

---

## Non-Leader Keybindings

### `g` Prefix — Goto Preview

Floating popup previews without jumping from the current buffer.

| Key | Description | Mode |
|-----|-------------|------|
| `g p d` | 󰈞 Preview Definition | Normal |
| `g p t` |  Preview Type Definition | Normal |
| `g p i` | 󰡱 Preview Implementation | Normal |
| `g p r` | 󰈇 Preview References | Normal |
| `g P` | 󰅖 Close All Previews | Normal |

### `gz` / `gZ` Prefix — Surround

Text surround operations (mini.surround remapped to `gz` to avoid Flash conflicts).

| Key | Description | Mode |
|-----|-------------|------|
| `g z` | 󰔡 Surround (group) | Normal / Visual |
| `g Z` | 󰔡 Surround Line (group) | Normal / Visual |
| `g z z` | 󰔡 Surround entire line | Normal |
| `g Z Z` | 󰔡 Surround current line | Normal |
| `g z d` | 󰛌 Delete surrounding | Normal |
| `g z r` | 󰏫 Change surrounding | Normal |
| `g Z R` | 󰏫 Change surrounding line | Normal |
| `g z` (visual) | Surround selection | Visual |
| `g Z` (visual) | Surround selection (line mode) | Visual |

> **Insert mode surround:** `Ctrl+g z` adds surround at cursor; `Ctrl+g Z` adds surround on current line.

### `s` / `S` — Flash Navigation

Fast motion via Flash.nvim. Active in normal, visual, and operator-pending modes.

| Key | Description | Mode |
|-----|-------------|------|
| `s` | 󰉁 Flash jump (label-based hop) | Normal / Visual / Operator-pending |
| `S` | 󰐅 Flash Treesitter (select node) | Normal / Visual / Operator-pending |
| `r` | 󰈿 Remote flash (operator-pending) | Operator-pending |
| `R` | 󰈿 Treesitter search | Operator-pending / Visual |

### Function Keys — Debug Shortcuts

Single-keypress debug shortcuts that mirror the `Space d` leader mappings.

| Key | Description |
|-----|-------------|
| `F5` | 󰐊 Debug: Continue |
| `F8` | 󰃤 Debug: Toggle Breakpoint (persistent) |
| `F9` | 󰆹 Debug: Step Over |
| `F10` | 󰆸 Debug: Step Into |
| `F11` | 󰆺 Debug: Step Out |
| `F12` | 󰆾 Debug: Run to Cursor |
| `Shift+F5` | 󰅗 Debug: Terminate |
| `Shift+F8` | 󰹍 Debug: Clear All Breakpoints |
| `Shift+F9` | 󰕮 Debug: Toggle DAP UI |

### Window / Split Navigation (smart-splits.nvim)

| Key | Description | Mode |
|-----|-------------|------|
| `Ctrl+h` | Move cursor to left split | Normal |
| `Ctrl+j` | Move cursor to lower split | Normal |
| `Ctrl+k` | Move cursor to upper split | Normal |
| `Ctrl+l` | Move cursor to right split | Normal |
| `Ctrl+\` | Move cursor to previous split | Normal |
| `Alt+h` | Resize split left | Normal |
| `Alt+j` | Resize split down | Normal |
| `Alt+k` | Resize split up | Normal |
| `Alt+l` | Resize split right | Normal |

> **Note:** `Ctrl+l` is also mapped globally to `LSP: Go to Definition`. The smart-splits binding takes precedence when on a split boundary; the LSP mapping is available via `Space n d` or `Space l` as well.

### Line Navigation

| Key | Description | Mode |
|-----|-------------|------|
| `H` | 󰁔 Go to start of line (`^`) | Normal / Visual |
| `L` | 󰁔 Go to end of line (`$`) | Normal / Visual |
| `Ctrl+h` | 󰌍 Return from Definition (`Ctrl+o`) | Normal |

### Spell Navigation (bracket keys)

| Key | Description | Mode |
|-----|-------------|------|
| `]s` | 󰒕 Next Misspelled Word | Normal |
| `[s` | 󰒖 Previous Misspelled Word | Normal |

### Terminal

| Key | Description | Mode |
|-----|-------------|------|
| `Ctrl+t` | Open/toggle terminal (horizontal split) | Normal |
| `Space t t` |  Open/toggle floating terminal | Normal / Terminal |

### Copilot Ghost Text (Insert Mode)

| Key | Description |
|-----|-------------|
| `Ctrl+y` | Trigger next suggestion or accept visible suggestion |
| `Alt+w` | Accept next word from ghost text |
| `Alt+e` | Accept current line from ghost text |
| `Alt+]` | Next Copilot suggestion |
| `Alt+[` | Previous Copilot suggestion |
| `Ctrl+]` | Dismiss current suggestion |
| `Alt+\` | Toggle Copilot suggestions on/off |
| `Alt+Enter` | Open Copilot panel |

### Copilot Panel Navigation (in panel buffer)

| Key | Description |
|-----|-------------|
| `[[` | Jump to previous suggestion |
| `]]` | Jump to next suggestion |
| `Enter` | Accept suggestion |
| `g r` | Refresh suggestions |

### Completion Menu (blink-cmp, Insert Mode)

| Key | Description |
|-----|-------------|
| `Ctrl+j` | Move to next item in completion menu |
| `Ctrl+k` | Move to previous item in completion menu |
| `Tab` | Accept selected completion |
| `Enter` | Smart Enter — accept completion if menu open, else newline |
| `Ctrl+e` | Close completion menu |
| `Ctrl+Space` | Manually trigger completion |

### Clipboard (Insert / Command / Normal)

| Key | Description | Mode |
|-----|-------------|------|
| `Ctrl+Shift+V` | 󰅌 Paste from system clipboard | Insert / Command |
| `Middle Mouse` | 󰅌 Paste from primary selection (highlighted text) | Insert / Normal |

### Yazi Internal Keymaps (inside the Yazi window)

| Key | Description |
|-----|-------------|
| `F1` | Show help |
| `Ctrl+v` | Open file in vertical split |
| `Ctrl+x` | Open file in horizontal split |
| `Ctrl+t` | Open file in new tab |
| `Ctrl+s` | Grep in directory |
| `Ctrl+g` | Replace in directory |
| `Tab` | Cycle open buffers |
| `Ctrl+y` | Copy relative path of selected files |

---

## Buffer-Local Groups Summary

The following which-key groups only appear when editing specific file types:

| Group | Trigger | File Type |
|-------|---------|-----------|
| `Space m` — Markdown |  Markdown | `.md` files |
| `Space z` spell overrides | Python spell | `.py` files (spell sub-keys have Python-specific behavior) |

---

_Generated from source at `/home/timlinux/dev/nix/timvim/config/`_
