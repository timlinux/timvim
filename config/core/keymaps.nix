{
  vim.keymaps = [
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
      # Fast press space and m,
      # if you press space with a pause then m, you
      # will get the whichkey menu
      key = "<leader>m";
      action = "<cmd>normal! zz<CR>";
      mode = "n";
      silent = true;
      desc = "Center current line on screen";
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
      key = "<leader>fb";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope buffers<CR>";
      desc = "Find buffers";
    }
    {
      key = "<leader>ff";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files<CR>";
      desc = "Find files with names";
    }
    {
      key = "<leader>fm";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope media_files<CR>";
      desc = "Find Media Files";
    }
    {
      key = "<leader>fg";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope live_grep<CR>";
      desc = "Find files with Contents FZF";
    }
    {
      key = "<leader>fp";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files find_command=rg,--files,--glob=*.py,--glob=!**/__pycache__/**,--glob=!**/build/**<CR>";
      desc = "Find Python files";
    }
    {
      key = "<leader>fn";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files find_command=rg,--files,--glob=*.nix<CR>";
      desc = "Find Nix files";
    }
    {
      key = "<leader>fs";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope lsp_document_symbols<CR>";
      desc = "Find Symbols in current file";
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
    # GitHub Copilot keymaps
    {
      key = "<leader>acp";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot panel<CR>";
      desc = "Open Copilot Panel";
    }
    {
      key = "<leader>acs";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot status<CR>";
      desc = "Copilot Status";
    }
    {
      key = "<leader>ace";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot enable<CR>";
      desc = "Enable Copilot";
    }
    {
      key = "<leader>acd";
      mode = "n";
      silent = true;
      action = "<cmd>Copilot disable<CR>";
      desc = "Disable Copilot";
    }
    # Copilot Chat keymaps
    {
      key = "<leader>ac";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>CopilotChat<CR>";
      desc = "Copilot Chat";
    }
    {
      key = "<leader>ai";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>CopilotChatExplain<CR>";
      desc = "Ask Copilot to explain";
    }
    {
      key = "<leader>ar";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>CopilotChatReview<CR>";
      desc = "Ask Copilot to review";
    }
    {
      key = "<leader>af";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>CopilotChatFix<CR>";
      desc = "Ask Copilot to fix";
    }
    {
      key = "<leader>ao";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>CopilotChatOptimize<CR>";
      desc = "Ask Copilot to optimize";
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
      desc = "Toggle Neotree filesystem show";
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
      desc = "Toggle the Treesitter context";
    }
    {
      key = "<leader>ti";
      mode = "n";
      silent = true;
      action = "<cmd>lua local ibl = require('ibl'); local config = require('ibl.config'); local enabled = config.get_config(0).enabled; ibl.setup({enabled = not enabled}); print('IBL ' .. (enabled and 'disabled' or 'enabled'))<CR>";
      desc = "Toggle indent guides";
    }
    {
      key = "<leader>to";
      mode = "n";
      silent = true;
      action = "<cmd>AerialToggle<CR>";
      desc = "Toggle Code Outline panel";
    }
    {
      key = "<leader>tw";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.toggle_cursorhold_diagnostics()<CR>";
      desc = "Toggle CursorHold error tooltips";
    }
    {
      key = "<leader>lf";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.format_buffer()<CR>";
      desc = "Format current buffer";
    }
    {
      key = "<leader>lc";
      mode = "n";
      silent = true;
      action = "<cmd>lua _G.check_formatters()<CR>";
      desc = "Check available formatters";
    }
  ];
}
