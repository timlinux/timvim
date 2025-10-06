{

  vim.binds.whichKey = {
    enable = true;

    register = {
      "<leader>a" = " Avante"; # Avante
      "<leader>f" = " Files"; # Telescope
      "<leader>s" = " Session"; # Smart-splits + Session Manager
      "<leader>m" = " Minimap"; # Minimap + Bufferline move
      "<leader>b" = " Buffers"; # Bufferline nav
      "<leader>d" = " Debug"; # DAP
      # Custom debug commands
      "<leader>da" = "󰃤 Attach to remote Python (port 9000)";
      "<leader>dl" = "󰐊 Start/Continue local debugging";
      "<leader>ds" = "󰙵 Show debug status";
      # Built-in DAP commands
      "<leader>dc" = "󰐊 Continue";
      "<leader>db" = "󰏃 Toggle Breakpoint";
      "<leader>du" = "󰕮 Toggle DAP UI";
      "<leader>dr" = "󰞷 Toggle REPL";
      "<leader>dh" = "󰋖 Hover";
      "<leader>dq" = "󰓛 Terminate";
      "<leader>dR" = "󰜉 Restart";
      "<leader>d." = "󰑮 Run Last";
      "<leader>dgo" = "󰆹 Step Into";
      "<leader>dgj" = "󰆸 Step Over";
      "<leader>dgk" = "󰆷 Step Back/Run to Cursor";
      "<leader>dvi" = "󰬍 Go Down Stack";
      "<leader>dvo" = "󰬆 Go Up Stack";
      "<leader>g" = " Git"; # Git actions
      "<leader>c" = " Code"; # LSP code actions
      "<leader>t" = " Toggles"; # Telescope actions
      "gz" = " Surround"; # Surround
    };

    setupOpts = {
      preset = "modern";
      notify = true;
      win = {
        border = "rounded";
      };
    };
  };

  vim.ui.borders.plugins.which-key = {
    enable = true;
    style = "rounded";
  };
}
