{

  vim.binds.whichKey = {
    enable = true;

    register = {
      "<leader>a" = " Avante"; # Avante
      "<leader>f" = " Files"; # Telescope
      "<leader>s" = " Session"; # Smart-splits + Session Manager
      "<leader>m" = " Minimap/buffers"; # Minimap + Bufferline move
      "<leader>b" = " Buffers"; # Bufferline nav
      "<leader>d" = " Debug"; # DAP
      "<leader>g" = " Git"; # Git actions
      "<leader>c" = " Code"; # LSP code actions
      "<leader>t" = " Telescope"; # Telescope actions
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
