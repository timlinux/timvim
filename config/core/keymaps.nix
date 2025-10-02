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
      key = "<K>";
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
    # Ctrl+I equivalent for inline editing (using Avante with copilot)
    {
      key = "<C-i>";
      mode = [
        "i"
      ];
      silent = true;
      action = "<cmd>AvanteEdit<CR>";
      desc = "Edit with Avante/Copilot";
    }
    {
      key = "<leader>ai";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>AvanteAsk<CR>";
      desc = "Ask with Avante/Copilot";
    }
    {
      key = "<leader>ac";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>AvanteChat<CR>";
      desc = "Copilot";
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

  ];
}
