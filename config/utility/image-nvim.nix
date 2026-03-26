{
  vim.utility = {
    images = {
      image-nvim = {
        enable = true;
        setupOpts = {
          backend = "kitty";
          editorOnlyRenderWhenFocused = true;
          integrations = {
            markdown = {
              enabled = true;
              clear_in_insert_mode = false;
              download_remote_images = true;
              only_render_image_at_cursor = true;
              only_render_image_at_cursor_mode = "popup";
              filetypes = [
                "markdown"
                "vimwiki"
              ];
            };
            neorg = {
              enabled = true;
              clear_in_insert_mode = false;
              download_remote_images = true;
              only_render_image_at_cursor = true;
              only_render_image_at_cursor_mode = "popup";
              filetypes = [ "norg" ];
            };
          };
          # Scale down images before rendering
          scale_factor = 0.4;
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
