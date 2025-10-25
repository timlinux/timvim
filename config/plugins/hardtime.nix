{
  vim = {
    binds.hardtime-nvim = {
      enable = true;

      setupOpts = {
        enabled = false; # Disabled by default, can be toggled with <leader>th
        max_count = 5;
        restriction_mode = "hint_and_block";
        disable_mouse = true;
      };
    };
  };
}
