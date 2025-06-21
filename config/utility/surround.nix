{
  vim.utility = {

    surround = {
      enable = true;
      useVendoredKeybindings = true;
      setupOpts = {
        keymaps = {
          change = "gzr";
          change_line = "gZR";
          delete = "gzd";
          insert = "<C-g>z";
          insert_line = "<C-g>Z";
          normal = "gz";
          normal_cur = "gZ";
          normal_cur_line = "gZZ";
          normal_line = "gzz";
          visual = "gz";
          visual_line = "gZ";
        };
      };
    };
  };
}
