{
  vim.keymaps = [
    # Completion keybindings (harmonized)
    # C-j/C-k navigate completion menu (configured in autocmp.nix)
    # Tab confirms selection (configured in autocmp.nix)
    # Enter also confirms selection when menu is visible
    {
      key = "<CR>";
      mode = "i";
      silent = true;
      expr = true;
      action = "luaeval('_G.smart_enter()') ? '' : '<CR>'";
      desc = "Smart Enter (confirm completion or newline)";
    }

    {
      key = "H";
      action = "^";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      desc = "Go to start of line";
    }
    {
      key = "L";
      action = "$";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      desc = "Go to end of line";
    }

    {
      key = "<C-l>";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      desc = "Go to Definition";
    }
    {
      key = "<C-h>";
      mode = "n";
      silent = true;
      action = "<C-o>";
      desc = "Return from Definition";
    }

    {
      key = "<leader>bb";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope buffers<CR>";
      desc = "Find Buffers";
    }
    {
      key = "<leader>ff";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files<CR>";
      desc = "Find Files with Names";
    }
    {
      key = "<leader>fp";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files find_command=rg,--files,--glob=*.py,--glob=!**/__pycache__/**,--glob=!**/build/**<CR>";
      desc = "Find Python Files";
    }
    {
      key = "<leader>fn";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files find_command=rg,--files,--glob=*.nix<CR>";
      desc = "Find Nix Files";
    }
    {
      key = "<leader>fs";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope lsp_document_symbols<CR>";
      desc = "Find Symbols in Current File";
    }
    # OIL File Manager keymaps
    {
      key = "<leader>fo";
      mode = "n";
      silent = true;
      action = "<cmd>Oil<CR>";
      desc = "Open Oil File Manager";
    }
    {
      key = "<leader>fO";
      mode = "n";
      silent = true;
      action = "<cmd>Oil --float<CR>";
      desc = "Open Oil File Manager (Floating)";
    }
    {
      key = "-";
      mode = "n";
      silent = true;
      action = "<cmd>Oil<CR>";
      desc = "Open Oil File Manager (Quick Access)";
    }
    {
      key = "K";
      mode = "n";
      silent = true;
      action = "<cmd>vim.lsp.buf.hover<CR>";
      desc = "Hover Documentation";
    }
    {
      key = "<leader>sm";
      mode = "n";
      silent = true;
      action = "<cmd>Session<CR>";
      desc = "Open Session Manager";
    }
    # Claude Code keymaps - handled in claude-code.nix plugin configuration
    # Copilot keymaps for inline completion control
    {
      key = "<leader>ap";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot panel<CR>";
      desc = "Copilot Panel";
    }
    {
      key = "<leader>as";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot status<CR>";
      desc = "Copilot Status";
    }
    {
      key = "<leader>ae";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot enable<CR>";
      desc = "Enable Copilot";
    }
    {
      key = "<leader>ad";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot disable<CR>";
      desc = "Disable Copilot";
    }

    # Toggles
    {
      key = "<leader>tp";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_states['<leader>tp'] = not _G.toggle_states['<leader>tp']; vim.cmd('Precognition toggle'); _G.update_toggle_desc('<leader>tp', 'Precognition', _G.toggle_states['<leader>tp'])<CR>";
      desc = "Toggle Precognition";
    }
    {
      key = "<leader>tt";
      mode = [
        "n"
        "t"
      ];
      silent = true;
      action = "<cmd>ToggleTerm direction=float<CR>";
      desc = "Toggle Floating Terminal";
    }
    {
      key = "<leader>tn";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_states['<leader>tn'] = not _G.toggle_states['<leader>tn']; vim.cmd('Neotree toggle'); _G.update_toggle_desc('<leader>tn', 'Neotree', _G.toggle_states['<leader>tn'])<CR>";
      desc = "Toggle Neotree Filesystem";
    }
    {
      key = "<leader>th";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_states['<leader>th'] = not _G.toggle_states['<leader>th']; vim.cmd('Hardtime toggle'); _G.update_toggle_desc('<leader>th', 'HardTime', _G.toggle_states['<leader>th'])<CR>";
      desc = "Toggle HardTime";
    }
    {
      key = "<leader>tc";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_states['<leader>tc'] = not _G.toggle_states['<leader>tc']; vim.cmd('TSContext toggle'); _G.update_toggle_desc('<leader>tc', 'Treesitter Context', _G.toggle_states['<leader>tc'])<CR>";
      desc = "Toggle Treesitter Context";
    }
    {
      key = "<leader>ti";
      mode = "n";
      silent = true;
      action = "<cmd>lua local ibl = require('ibl'); local config = require('ibl.config'); local enabled = config.get_config(0).enabled; ibl.setup({enabled = not enabled}); _G.toggle_states['<leader>ti'] = not enabled; _G.update_toggle_desc('<leader>ti', 'Indent Guides', not enabled)<CR>";
      desc = "Toggle Indent Guides";
    }
    {
      key = "<leader>to";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_states['<leader>to'] = not _G.toggle_states['<leader>to']; vim.cmd('AerialToggle'); _G.update_toggle_desc('<leader>to', 'Code Outline', _G.toggle_states['<leader>to'])<CR>";
      desc = "Toggle Code Outline Panel";
    }
    {
      key = "<leader>tw";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_cursorhold_diagnostics(); _G.update_toggle_desc('<leader>tw', 'CursorHold Diagnostics', _G.cursorhold_diagnostics_enabled)<CR>";
      desc = "Toggle CursorHold Error Tooltips";
    }
    {
      key = "<leader>tv";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_virtual_text_diagnostics(); _G.update_toggle_desc('<leader>tv', 'Virtual Text Diagnostics', _G.virtual_text_diagnostics_enabled)<CR>";
      desc = "Toggle Virtual Text Diagnostics";
    }
    {
      key = "<leader>tg";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_harper(); _G.toggle_states['<leader>tg'] = not _G.toggle_states['<leader>tg']; _G.update_toggle_desc('<leader>tg', 'Harper Grammar', _G.toggle_states['<leader>tg'])<CR>";
      desc = "Toggle Harper Grammar Checker";
    }
    {
      key = "<leader>tz";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_spell_autopopup(); _G.update_toggle_desc('<leader>tz', 'Spell Autopopup', _G.spell_autopopup_enabled)<CR>";
      desc = "Toggle Spell Suggestion Autopopup";
    }
    {
      key = "<leader>cf";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.format_buffer()<CR>";
      desc = "Format Buffer";
    }
    {
      key = "<leader>cc";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.check_formatters()<CR>";
      desc = "Check Available Formatters";
    }
    {
      key = "<leader>cr";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      desc = "Rename Symbol";
    }
    # LSP navigation keymaps (moved from files menu)
    {
      key = "<leader>cd";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      desc = "Go to Definition";
    }
    {
      key = "<leader>cD";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
      desc = "Go to Declaration";
    }
    {
      key = "<leader>cI";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope lsp_implementations<CR>";
      desc = "Find Implementations";
    }
    {
      key = "<leader>ct";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope lsp_type_definitions<CR>";
      desc = "Find Type Definitions";
    }
    {
      key = "<leader>cR";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope lsp_references<CR>";
      desc = "Find References";
    }
    {
      key = "<leader>cn";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      desc = "Next Diagnostic";
    }
    {
      key = "<leader>cP";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      desc = "Previous Diagnostic";
    }
    {
      key = "<leader>gl";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope git_commits<CR>";
      desc = "Git Log";
    }
    # Git conflict resolution keymaps are defined buffer-locally in git.nix
    # Global Spell Checking keymaps
    {
      key = "<leader>zs";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.opt.spell = not vim.opt.spell:get(); print('Global spell check: ' .. (vim.opt.spell:get() and 'enabled' or 'disabled'))<CR>";
      desc = "Toggle Global Spell Check";
    }
    {
      key = "<leader>z=";
      mode = "n";
      silent = false;
      action = "z=";
      desc = "Show Spell Suggestions";
    }
    {
      key = "<leader>za";
      mode = "n";
      silent = false;
      action = "zg";
      desc = "Add Word to Dictionary";
    }
    {
      key = "<leader>zb";
      mode = "n";
      silent = false;
      action = "zw";
      desc = "Mark Word as Bad";
    }
    {
      key = "<leader>zr";
      mode = "n";
      silent = false;
      action = "zug";
      desc = "Remove Word from Dictionary";
    }
    {
      key = "]s";
      mode = "n";
      silent = true;
      action = "]s";
      desc = "Next Misspelled Word";
    }
    {
      key = "[s";
      mode = "n";
      silent = true;
      action = "[s";
      desc = "Previous Misspelled Word";
    }
    {
      key = "<leader>zf";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.quick_spell_fix()<CR>";
      desc = "Quick Fix with First Suggestion";
    }
    {
      key = "<leader>zt";
      mode = "n";
      silent = true;
      action = "<cmd>lua print('Syntax-based spell check available in Python files')<CR>";
      desc = "Toggle Syntax-based Spell Check";
    }
    {
      key = "<leader>ty";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_states['<leader>ty'] = not _G.toggle_states['<leader>ty']; vim.cmd('Typr'); _G.update_toggle_desc('<leader>ty', 'Typing Tutor', _G.toggle_states['<leader>ty'])<CR>";
      desc = "Typing Tutor";
    }
  ];
}
