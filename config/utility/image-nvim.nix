{
  vim.utility = {
    images = {
      image-nvim = {
        enable = true;
        setupOpts = {
          backend = "kitty";
          editorOnlyRenderWhenFocused = false;
          integrations = {
            markdown = {
              enabled = true;
              clear_in_insert_mode = false;
              download_remote_images = true;
              only_render_image_at_cursor = false;
              filetypes = [
                "markdown"
                "vimwiki"
              ];
            };
            neorg = {
              enabled = true;
              clear_in_insert_mode = false;
              download_remote_images = true;
              only_render_image_at_cursor = false;
              filetypes = [ "norg" ];
            };
          };
          max_width = null;
          max_height = null;
          max_width_window_percentage = null;
          max_height_window_percentage = 50;
          window_overlap_clear_enabled = true;
          window_overlap_clear_ft_ignore = [
            "cmp_menu"
            "cmp_docs"
            "which-key"
            "notify"
            "cmdline"
            "popup"
            ""
          ];
          editor_only_render_when_focused = false;
          tmux_show_only_in_active_window = false;
        };
      };
      img-clip.enable = true;
    };
  };
}
