{
  vim.visuals = {
    indent-blankline = {
      enable = true; # Enable the plugin so toggle works

      setupOpts = {
        enabled = false; # Start disabled by default
        exclude = {
          buftypes = [ "terminal" ];
          filetypes = [
            "ts_context"
            "dashboard"
            "nvimtree"
          ];
        };
      };
    };
  };
}
