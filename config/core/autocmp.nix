{
  vim = {
    autocomplete.blink-cmp = {
      enable = true;

      mappings = {
        close = "<C-e>";
        complete = "<C-Space>";
        confirm = "<CR>"; # Enter for completion confirmation
        next = "<C-j>";
        previous = "<C-k>";
        scrollDocsDown = "<C-f>";
        scrollDocsUp = "<C-d>";
      };

      sourcePlugins = {
        emoji.enable = true;
        ripgrep.enable = true;
        spell.enable = true;
      };

      setupOpts = {

        signature = {
          enabled = true;
          trigger = {
            enabled = true;
          };
        };

        sources = {
          default = [
            "lsp"
            "snippets"
            "spell"
            "path"
            "buffer"
          ];

          providers = {
            lsp = {
              min_keyword_length = 1;
              score_offset = 5;
            };
            snippets = {
              min_keyword_length = 1;
              score_offset = 4;
            };
            spell = {
              min_keyword_length = 2;
              score_offset = 3;
            };
            path = {
              min_keyword_length = 0;
              score_offset = 2;
              # Enable fuzzy matching for paths
              opts = {
                trailing_slash = true;
                label_trailing_slash = true;
              };
            };
            buffer = {
              min_keyword_length = 3;
              score_offset = 1;
            };
          };
        };

        cmdline.keymap.preset = "none";

        completion = {
          documentation.auto_show = true;
          menu = {
            auto_show = true;
            draw = {
              # Position menu below current line to avoid obscuring text
              gap = 1; # Gap between cursor and menu
              padding = 0;
              columns = [
                [
                  "kind_icon"
                  "label"
                  " "
                  "label_description"
                ]
              ];
            };
          };
          # Configure ghost text behavior
          ghost_text = {
            enabled = true;
          };
          # Ensure trigger on character input
          trigger = {
            show_on_insert_on_trigger_character = true;
            show_on_x_blocked_trigger_characters = [
              " "
              "("
              ")"
            ];
          };
        };

        # Configure completion kind icons under appearance
        appearance = {
          kind_icons = {
            File = "📄";
            Folder = "📁";
            Text = "📝";
            Method = "🔧";
            Function = "⚡";
            Constructor = "🏗️";
            Field = "🏷️";
            Variable = "📊";
            Class = "🏛️";
            Interface = "🔌";
            Module = "📦";
            Property = "🔗";
            Unit = "📐";
            Value = "🔢";
            Enum = "📋";
            Keyword = "🔤";
            Snippet = "✂️";
            Color = "🎨";
            Reference = "📖";
            EnumMember = "🏷️";
            Constant = "🔒";
            Struct = "🏗️";
            Event = "⚡";
            Operator = "➕";
            TypeParameter = "🏷️";
          };
        };

      };

    };
  };
}
