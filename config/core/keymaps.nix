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
      action = "<cmd>Precognition toggle<CR>";
      desc = "Toggle Precognition";
    }
    {
      key = "<leader>tt";
      mode = [
        "n"
        "t"
      ];
      silent = true;
      action = "<cmd>FloatermToggle<CR>";
      desc = "Toggle Floaterm";
    }
    {
      key = "<leader>tn";
      mode = "n";
      silent = true;
      action = "<cmd>Neotree toggle<CR>";
      desc = "Toggle Neotree Filesystem";
    }
    {
      key = "<leader>tf";
      mode = "n";
      silent = true;
      action = "<cmd>Oil<CR>";
      desc = "Toggle Oil File Manager";
    }
    {
      key = "<leader>th";
      mode = "n";
      silent = true;
      action = "<cmd>Hardtime toggle<CR>";
      desc = "Toggle HardTime";
    }
    {
      key = "<leader>tc";
      mode = "n";
      silent = true;
      action = "<cmd>TSContext toggle<CR>";
      desc = "Toggle Treesitter Context";
    }
    {
      key = "<leader>ti";
      mode = "n";
      silent = true;
      action = "<cmd>lua local ibl = require('ibl'); local config = require('ibl.config'); local enabled = config.get_config(0).enabled; ibl.setup({enabled = not enabled}); print('IBL ' .. (enabled and 'disabled' or 'enabled'))<CR>";
      desc = "Toggle Indent Guides";
    }
    {
      key = "<leader>to";
      mode = "n";
      silent = true;
      action = "<cmd>AerialToggle<CR>";
      desc = "Toggle Code Outline Panel";
    }
    {
      key = "<leader>tw";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_cursorhold_diagnostics()<CR>";
      desc = "Toggle CursorHold Error Tooltips";
    }
    {
      key = "<leader>tv";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_virtual_text_diagnostics()<CR>";
      desc = "Toggle Virtual Text Diagnostics";
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
    {
      key = "<leader>co";
      mode = "n";
      silent = true;
      action = "<cmd>AerialToggle<CR>";
      desc = "Toggle Code Outline";
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
    # Git conflict resolution keymaps
    {
      key = "<leader>gn";
      mode = "n";
      silent = true;
      action = "<cmd>GitConflictChooseNone<CR>";
      desc = "Git Choose None";
    }
    {
      key = "<leader>gt";
      mode = "n";
      silent = true;
      action = "<cmd>GitConflictChooseTheirs<CR>";
      desc = "Git Choose Theirs";
    }
    {
      key = "<leader>gc";
      mode = "n";
      silent = true;
      action = "<cmd>GitConflictChooseOurs<CR>";
      desc = "Git Choose Ours";
    }
    {
      key = "<leader>ga";
      mode = "n";
      silent = true;
      action = "<cmd>GitConflictChooseBoth<CR>";
      desc = "Git Choose Both";
    }
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
      action = "<cmd>Typr<CR>";
      desc = "Open Typing Tutor";
    }
  ];
}
