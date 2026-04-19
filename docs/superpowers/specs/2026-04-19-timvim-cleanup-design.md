# Timvim Cleanup & Optimization Design

**Date:** 2026-04-19
**Status:** Approved

## Overview

Address startup errors, inconsistent WhichKey menus, verbose Copilot statusline, hardcoded debug ports, and stale documentation in the timvim Neovim configuration.

## Fix 1: Node.js Version for Copilot

**Problem:** Copilot.lua requires Node.js 22+ but finds 20.20.0 at runtime. The flake specifies `nodejs_22` in devShells and homeModules but the Neovim package itself doesn't have it on PATH.

**Fix:** Ensure `copilot.nix` sets `copilot_node_command` to the nix store path of `nodejs_22`, or add nodejs_22 to the Neovim wrapper's PATH so Copilot finds it at runtime.

**Files:** `config/assistant/copilot.nix`, possibly `flake.nix`

## Fix 2: Suppress direnv Startup Messages

**Problem:** `@mdirenv` export messages clutter the startup screen with environment variable dumps when opening Neovim in a directory with `.envrc`.

**Fix:** Add a `vim.notify` filter in luaConfigRC that silently drops messages matching direnv export patterns (lines starting with `@mdirenv` or containing `export +`).

**Files:** `config/core/options.nix` or new filter in luaConfigRC

## Fix 3: Which-key Warning Fixes

**Problem:** Startup shows "There were issues reported with your which-key mappings."

**Fixes:**
- Remove unused `<leader>x` ("Lists") group registration
- Ensure debug keymaps defined in Lua are properly registered with which-key
- Fix any orphaned or conflicting key registrations
- Audit all groups for consistency

**Files:** `config/core/whichKey.nix`, `config/plugins/debugger.nix`

## Fix 4: Copilot Statusline Simplification

**Problem:** Current statusline shows verbose text like "Copilot OFF", "Ctrl-y for hint", "Ctrl-y accept" with colored backgrounds taking too much space.

**New behavior:**
- **Enabled (suggestion available or not):** `● Ctl-Y` in green text (#8ad384)
- **Disabled:** `●` in gray text (#666666), no label

**Files:** `config/plugins/lualine.nix`

## Fix 5: Debug Port Prompting

**Problem:** Python debug port hardcoded to 9000, Go debug port hardcoded to 38697.

**Fix:** Replace hardcoded ports with `vim.fn.input()` prompts:
- Python: `vim.fn.input("Debug port: ", vim.g.dap_python_port or "9000")` — stores last-used in `vim.g.dap_python_port`
- Go: `vim.fn.input("Debug port: ", vim.g.dap_go_port or "38697")` — stores last-used in `vim.g.dap_go_port`

**Files:** `config/plugins/debugger.nix`

## Fix 6: Octo WhichKey Flattening

**Problem:** Octo/GitHub bindings are 3 keystrokes deep (`<leader>oil`, `<leader>ops`, etc.), violating the 2-deep max rule.

**New mapping (all under `<leader>o` + 1 key):**

| Key | Action | Mnemonic |
|-----|--------|----------|
| `<leader>oi` | Issue list | **i**ssues |
| `<leader>oI` | Issue search | **I**ssue search |
| `<leader>on` | New issue | **n**ew |
| `<leader>oO` | Open issue by # | **O**pen |
| `<leader>op` | PR list | **p**ull requests |
| `<leader>oP` | PR search | **P**R search |
| `<leader>oc` | Create PR | **c**reate |
| `<leader>od` | PR diff | **d**iff |
| `<leader>of` | PR files | **f**iles |
| `<leader>om` | PR merge | **m**erge |
| `<leader>ok` | PR checkout | chec**k**out |
| `<leader>os` | Review start | **s**tart |
| `<leader>or` | Review resume | **r**esume |
| `<leader>oa` | Add review comment | **a**dd |
| `<leader>ox` | Discard review | e**x**it |
| `<leader>ou` | Submit review | s**u**bmit |
| `<leader>oA` | Add line comment | **A**dd line comment |
| `<leader>oD` | Delete comment | **D**elete |
| `<leader>ol` | Repo list | **l**ist repos |
| `<leader>oe` | Repo open | r**e**po open |
| `<leader>og` | Gist list | **g**ist |

Remove all subgroup registrations (`oi`, `op`, `or`, `oc`, `oR`, `og`).

**Files:** `config/plugins/octo.nix`, `config/core/whichKey.nix`

## Fix 7: Documentation Sync

**Problem:** Keybinding documentation is incomplete and partially stale.

**Fix:** Regenerate all keybinding tables in KEYBINDINGS.md to match the actual current configuration after all other fixes are applied.

**Files:** `KEYBINDINGS.md`
