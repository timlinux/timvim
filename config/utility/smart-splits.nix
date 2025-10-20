{
  vim.utility = {

    smart-splits = {
      enable = true;

      keymaps = {
        move_cursor_down = "<C-j>";
        move_cursor_left = "<C-h>";
        move_cursor_right = "<C-l>";
        move_cursor_up = "<C-k>";
        move_cursor_previous = "<C-\\>";

        resize_down = "<A-j>";
        resize_left = "<A-h>";
        resize_right = "<A-l>";
        resize_up = "<A-k>";

        swap_buf_down = "<leader>bj";
        swap_buf_left = "<leader>bs";
        swap_buf_right = "<leader>bd";
        swap_buf_up = "<leader>bk";
      };

      # Optional extra options passed to smart-splits.setup()
      setupOpts = { };
    };
  };
}
