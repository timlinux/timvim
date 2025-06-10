{ pkgs, ... }:
{
  vim.ui.noice = {
    enable = true;

    # Optional: Set up Noice with custom options
    setupOpts = {
      presets = {
        bottom_search = false;
        command_palette = true;
        inc_rename = false;
        long_message_to_split = true;
        lsp_doc_border = true;
      };

      views = {
        cmdline_popup = {
          position = {
            row = "50%";
            col = "50%";
          };
          size = {
            width = 60;
            height = "auto";
          };
        };
      };

      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
        progress = {
          enabled = true;
        };
        hover = {
          enabled = true;
        };
        signature = {
          enabled = true;
        };
      };
    };
  };
}
