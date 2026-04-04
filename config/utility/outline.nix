{
  vim.utility = {
    outline = {
      aerial-nvim = {
        enable = true;
        mappings = {
          toggle = "<leader>to";
        };
        setupOpts = {
          lazy_load = true;
          open_automatic = false;
          attach_mode = "global";
          close_on_select = false;
          close_automatic_events = [
            "unfocus"
            "switch_buffer"
          ];
        };
      };
    };
  };
}
