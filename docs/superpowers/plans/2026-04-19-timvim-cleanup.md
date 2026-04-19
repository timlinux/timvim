# Timvim Cleanup & Optimization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix startup errors, simplify Copilot statusline, flatten Octo keybindings, add debug port prompting, fix which-key warnings, suppress direnv messages, fix notification conflicts, and sync keybinding documentation.

**Architecture:** Surgical fixes to existing NVF configuration files. Each task modifies 1-2 files and can be tested with `nix run`.

**Tech Stack:** Nix (NVF framework), Lua (embedded in Nix strings)

---

### Task 1: Fix Node.js version for Copilot

**Files:**
- Modify: `flake.nix:77-99` (add nodejs_22 to runtimeDeps)
- Modify: `config/assistant/copilot.nix:48` (set copilot_node_command to nodejs_22 path)

- [ ] **Step 1: Add nodejs_22 to runtimeDeps in flake.nix**

In `flake.nix`, add `pkgs.nodejs_22` to the `runtimeDeps` list (around line 93):

```nix
# After pkgs.python3Packages.doc8
pkgs.nodejs_22
```

And add it to the `wrapProgram` PATH so the Neovim wrapper has Node 22 available.

- [ ] **Step 2: Set copilot_node_command to use nodejs_22 explicitly**

In `config/assistant/copilot.nix`, change line 48 from:

```nix
copilot_node_command = "node";
```

to:

```nix
copilot_node_command = "node";
```

This stays as `"node"` because the wrapper now has nodejs_22 on PATH. The key fix is step 1.

- [ ] **Step 3: Build and verify**

Run: `nix run`
Expected: No `[Copilot.lua] Node.js version 22 or newer required` error at startup.

- [ ] **Step 4: Commit**

```bash
git add flake.nix
git commit -m "Fix Copilot Node.js version by adding nodejs_22 to runtime deps"
```

---

### Task 2: Suppress direnv startup messages

**Files:**
- Modify: `config/core/options.nix` (add vim.notify filter in luaConfigRC)

- [ ] **Step 1: Add direnv message filter**

In `config/core/options.nix`, add a new luaConfigRC section after `restore_cursor`:

```nix
luaConfigRC.suppress_direnv = ''
  -- Suppress direnv export messages from cluttering startup
  local original_notify = vim.notify
  vim.notify = function(msg, level, opts)
    if type(msg) == "string" then
      -- Filter out direnv/mdirenv export messages
      if msg:match("^%^%[%[@mdirenv") or msg:match("@mdirenv") or msg:match("^direnv:") then
        return
      end
    end
    return original_notify(msg, level, opts)
  end
'';
```

- [ ] **Step 2: Build and verify**

Run: `nix run` in a directory with `.envrc`
Expected: No `@mdirenv: export +AR +AS ...` message at startup.

- [ ] **Step 3: Commit**

```bash
git add config/core/options.nix
git commit -m "Suppress direnv export messages from startup notifications"
```

---

### Task 3: Fix which-key warnings

**Files:**
- Modify: `config/core/whichKey.nix:19-28` (remove unused groups, fix registrations)
- Modify: `config/plugins/notify.nix:60-70` (fix conflicting keybindings)
- Modify: `config/core/whichKey.nix:133-147` (remove empty autocmd)

- [ ] **Step 1: Remove unused `<leader>x` group from whichKey.nix**

The `<leader>x` group is registered in whichKey.nix but the actual keymaps come from trouble.nix via NVF mappings. The group registration is fine — trouble.nix provides the bindings. Keep it.

Actually, check: the `<leader>x` "Lists" group IS used by trouble.nix (`xq`, `xl`, `xs`). Keep it.

Instead, focus on:
1. Remove the Octo subgroups (they'll be removed when we flatten in Task 5)
2. Remove the empty `whichkey_navigation_hint` autocmd that does nothing

In `config/core/whichKey.nix`, remove lines 133-147 (the empty `whichkey_navigation_hint` section):

```nix
# DELETE this entire section:
vim.luaConfigRC.whichkey_navigation_hint = ''
  -- Add navigation hint to whichkey footer
  vim.api.nvim_create_autocmd("User", {
    pattern = "WhichKeyShow",
    callback = function()
      vim.defer_fn(function()
        local ok, wk = pcall(require, "which-key")
        if ok then
          -- The footer is automatically shown with modern preset
          -- It displays navigation hints automatically
        end
      end, 10)
    end,
  })
'';
```

- [ ] **Step 2: Fix notification keybinding conflicts**

In `config/plugins/notify.nix`, change `<leader>nd` and `<leader>nh` to use `<leader>N` prefix to avoid conflicts with Navigate group:

```nix
vim.luaConfigRC.notify-keybinds = ''
  -- Dismiss all visible notifications
  vim.keymap.set("n", "<leader>Nd", function()
    require("notify").dismiss({ silent = true, pending = true })
  end, { desc = "Dismiss All Notifications" })

  -- Show notification history
  vim.keymap.set("n", "<leader>Nh", function()
    require("telescope").extensions.notify.notify()
  end, { desc = "Notification History" })
'';
```

And add the `<leader>N` group to whichKey.nix register:

```nix
"<leader>N" = "󰈸 Notifications";
```

- [ ] **Step 3: Build and verify**

Run: `nix run`
Expected: No "There were issues reported with your which-key mappings" warning.

- [ ] **Step 4: Commit**

```bash
git add config/core/whichKey.nix config/plugins/notify.nix
git commit -m "Fix which-key warnings: remove empty autocmd, fix notification key conflicts"
```

---

### Task 4: Simplify Copilot statusline

**Files:**
- Modify: `config/plugins/lualine.nix:99-132` (replace copilot indicator)

- [ ] **Step 1: Replace the Copilot statusline component**

In `config/plugins/lualine.nix`, replace lines 99-132 (the copilot status indicator) with:

```lua
-- Copilot status indicator
{
  function()
    local client_ok, copilot_client = pcall(require, 'copilot.client')
    if client_ok and copilot_client then
      if copilot_client.is_disabled() then
        return "●"
      else
        return "● Ctl-Y"
      end
    end
    return ""
  end,
  color = function()
    local client_ok, copilot_client = pcall(require, 'copilot.client')
    if client_ok and copilot_client and not copilot_client.is_disabled() then
      return { fg = '#8ad384' }
    else
      return { fg = '#666666' }
    end
  end,
},
```

- [ ] **Step 2: Build and verify**

Run: `nix run`
Expected: Statusline shows green `● Ctl-Y` when Copilot is enabled, gray `●` when disabled.

- [ ] **Step 3: Commit**

```bash
git add config/plugins/lualine.nix
git commit -m "Simplify Copilot statusline to minimal green/gray circle indicator"
```

---

### Task 5: Flatten Octo keybindings

**Files:**
- Modify: `config/plugins/octo.nix:26-197` (flatten all keymaps to 2-deep)
- Modify: `config/core/whichKey.nix:19-24` (remove Octo subgroups)

- [ ] **Step 1: Remove Octo subgroup registrations from whichKey.nix**

In `config/core/whichKey.nix`, remove these lines:

```nix
"<leader>oi" = " Issues";
"<leader>op" = " Pull Requests";
"<leader>or" = " Review";
"<leader>oc" = " Comments";
"<leader>oR" = " Repos";
"<leader>og" = " Gists";
```

- [ ] **Step 2: Replace all Octo keymaps in octo.nix**

Replace the entire `keymaps` list in `config/plugins/octo.nix` with the flattened version:

```nix
keymaps = [
  # Issues
  { key = "<leader>oi"; action = "<cmd>Octo issue list<cr>"; mode = "n"; silent = true; desc = " List Issues"; }
  { key = "<leader>oI"; action = "<cmd>Octo issue search<cr>"; mode = "n"; silent = true; desc = " Search Issues"; }
  { key = "<leader>on"; action = "<cmd>Octo issue create<cr>"; mode = "n"; silent = true; desc = " New Issue"; }
  { key = "<leader>oO"; action = "<cmd>Octo issue browser<cr>"; mode = "n"; silent = true; desc = " Open in Browser"; }

  # Pull Requests
  { key = "<leader>op"; action = "<cmd>Octo pr list<cr>"; mode = "n"; silent = true; desc = " List PRs"; }
  { key = "<leader>oP"; action = "<cmd>Octo pr search<cr>"; mode = "n"; silent = true; desc = " Search PRs"; }
  { key = "<leader>oc"; action = "<cmd>Octo pr create<cr>"; mode = "n"; silent = true; desc = " Create PR"; }
  { key = "<leader>od"; action = "<cmd>Octo pr diff<cr>"; mode = "n"; silent = true; desc = " View Diff"; }
  { key = "<leader>of"; action = "<cmd>Octo pr changes<cr>"; mode = "n"; silent = true; desc = " Changed Files"; }
  { key = "<leader>om"; action = "<cmd>Octo pr merge<cr>"; mode = "n"; silent = true; desc = " Merge PR"; }
  { key = "<leader>ok"; action = "<cmd>Octo pr checkout<cr>"; mode = "n"; silent = true; desc = " Checkout PR"; }
  { key = "<leader>ob"; action = "<cmd>Octo pr browser<cr>"; mode = "n"; silent = true; desc = " Open PR in Browser"; }

  # Review
  { key = "<leader>os"; action = "<cmd>Octo review start<cr>"; mode = "n"; silent = true; desc = " Start Review"; }
  { key = "<leader>or"; action = "<cmd>Octo review resume<cr>"; mode = "n"; silent = true; desc = " Resume Review"; }
  { key = "<leader>oa"; action = "<cmd>Octo review submit approve<cr>"; mode = "n"; silent = true; desc = " Approve"; }
  { key = "<leader>ox"; action = "<cmd>Octo review submit request_changes<cr>"; mode = "n"; silent = true; desc = " Request Changes"; }
  { key = "<leader>ou"; action = "<cmd>Octo review submit comment<cr>"; mode = "n"; silent = true; desc = " Submit Comment"; }
  { key = "<leader>oX"; action = "<cmd>Octo review discard<cr>"; mode = "n"; silent = true; desc = " Discard Review"; }

  # Comments
  { key = "<leader>oA"; action = "<cmd>Octo comment add<cr>"; mode = "n"; silent = true; desc = " Add Comment"; }
  { key = "<leader>oD"; action = "<cmd>Octo comment delete<cr>"; mode = "n"; silent = true; desc = " Delete Comment"; }

  # Repo & Gist
  { key = "<leader>ol"; action = "<cmd>Octo repo list<cr>"; mode = "n"; silent = true; desc = " List Repos"; }
  { key = "<leader>oe"; action = "<cmd>Octo repo browser<cr>"; mode = "n"; silent = true; desc = " Open Repo in Browser"; }
  { key = "<leader>og"; action = "<cmd>Octo gist list<cr>"; mode = "n"; silent = true; desc = " List Gists"; }
];
```

- [ ] **Step 3: Build and verify**

Run: `nix run`
Press `<leader>o` — should show flat list of all GitHub actions, no submenus.

- [ ] **Step 4: Commit**

```bash
git add config/plugins/octo.nix config/core/whichKey.nix
git commit -m "Flatten Octo keybindings from 3-deep to 2-deep max"
```

---

### Task 6: Add debug port prompting

**Files:**
- Modify: `config/plugins/debugger.nix:33-303` (replace hardcoded ports with prompts)

- [ ] **Step 1: Replace hardcoded Python debug port with prompt**

In `config/plugins/debugger.nix`, replace the `setup_python_adapter` function's `python_direct` adapter and all references to port 9000 with dynamic port input. Replace the entire `vim.luaConfigRC.dap-remote` content:

Key changes:
1. Remove hardcoded `port = 9000` from `dap.adapters.python_direct` — make it a function adapter
2. Replace `attach_remote_debugger()` to prompt for port
3. Replace hardcoded Go port `38697` with prompt
4. Update `kill_debug_processes` to use stored port
5. Update all `test_debug_connection` to use dynamic port

The `python_direct` adapter becomes a function:
```lua
dap.adapters.python_direct = function(cb, config)
  cb({
    type = 'server',
    host = '127.0.0.1',
    port = config.port or 9000,
  })
end
```

The `attach_remote_debugger` function prompts:
```lua
local function attach_remote_debugger()
  local ok, dap = pcall(require, 'dap')
  if not ok then
    vim.notify('DAP not available', vim.log.levels.ERROR)
    return
  end

  local default_port = vim.g.dap_python_port or "9000"
  vim.ui.input({ prompt = "Python debug port: ", default = default_port }, function(input)
    if not input or input == "" then return end
    local port = tonumber(input)
    if not port then
      vim.notify('Invalid port number', vim.log.levels.ERROR)
      return
    end
    vim.g.dap_python_port = input

    vim.notify('Connecting to port ' .. port .. '...', vim.log.levels.INFO)
    dap.run({
      type = 'python_direct',
      request = 'attach',
      name = 'Remote Attach (' .. port .. ')',
      port = port,
      pathMappings = {
        {
          localRoot = vim.fn.getcwd(),
          remoteRoot = vim.fn.getcwd()
        }
      },
      justMyCode = false,
    })
  end)
end
```

The Go adapter becomes dynamic:
```lua
local delve_cmd = vim.fn.exepath('dlv')
if delve_cmd ~= "" then
  dap.adapters.go = function(cb, config)
    local port = config.port or tonumber(vim.g.dap_go_port) or 38697
    cb({
      type = 'server',
      port = port,
      executable = {
        command = delve_cmd,
        args = { 'dap', '-l', '127.0.0.1:' .. port },
        detached = vim.fn.has("win32") == 0,
      },
    })
  end
end
```

Also update the DAP configurations to remove hardcoded port references in names:
```lua
-- Direct server connection
table.insert(dap.configurations.python, {
  type = 'python_direct',
  request = 'attach',
  name = 'Attach to Debug Server',
  port = function()
    return tonumber(vim.g.dap_python_port) or 9000
  end,
  pathMappings = { ... },
  justMyCode = false,
})
```

Update `kill_debug_processes`:
```lua
local function kill_debug_processes()
  vim.fn.system('pkill -f "debugpy.adapter"')
  local port = vim.g.dap_python_port or "9000"
  vim.fn.system('pkill -f "debugpy.*' .. port .. '"')
  vim.notify('Killed debug processes', vim.log.levels.INFO)
end
```

Update keymap descriptions to remove port references:
```lua
vim.keymap.set('n', '<leader>da', attach_remote_debugger, { desc = 'Attach to Python Debugger' })
```

- [ ] **Step 2: Build and verify**

Run: `nix run`
Press `<leader>da` — should prompt for port with 9000 as default.

- [ ] **Step 3: Commit**

```bash
git add config/plugins/debugger.nix
git commit -m "Replace hardcoded debug ports with interactive prompts"
```

---

### Task 7: Update KEYBINDINGS.md

**Files:**
- Modify: `KEYBINDINGS.md` (full rewrite to match current state)

- [ ] **Step 1: Rewrite KEYBINDINGS.md**

Update the entire file to reflect all changes made in tasks 1-6:
- Add `<leader>N` Notifications group (moved from `<leader>n`)
- Flatten Octo bindings under `<leader>o` (no subgroups)
- Update debug descriptions (remove hardcoded port references)
- Update Copilot statusline description
- Remove "Known Issues" section items that have been fixed
- Update the "Last Updated" date
- Remove the `<leader>tD` placeholder toggle (or mark as removed)

- [ ] **Step 2: Commit**

```bash
git add KEYBINDINGS.md
git commit -m "Sync keybinding documentation with current configuration"
```
