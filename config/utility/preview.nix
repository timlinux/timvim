{
  vim.utility = {
    preview = {
      glow = {
        enable = true;
        mappings = {
          openPreview = "<leader>pm";
        };
      };
      markdownPreview = {
        enable = true;
        alwaysAllowPreview = true;
        autoClose = true;
        autoStart = false; # Disabled by default, can be toggled with <leader>tm
      };

    };
  };
}
