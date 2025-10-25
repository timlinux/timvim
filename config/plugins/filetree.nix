{ ... }:
{
  vim = {
    filetree = {
      neo-tree = {
        enable = true;
        setupOpts = {
          default_component_configs = {
            file_size = {
              enabled = true;
              required_width = 64;
            };
            type = {
              enabled = true;
              required_width = 122;
            };
            last_modified = {
              enabled = true;
              required_width = 88;
            };
            created = {
              enabled = true;
              required_width = 110;
            };
            symlink_target = {
              enabled = false;
            };
          };
          window = {
            position = "left";
            width = 40;
            mapping_options = {
              noremap = true;
              nowait = true;
            };
            mappings = {
              P = "toggle_preview";
            };
          };
          filesystem = {
            visible = false;
            hide_dotfiles = true;
            hide_gitignored = true;
            hide_hidden = true;
            hide_by_name = [
              "__pycache__"
              ".DS_Store"
              "thumbs.db"
            ];
            never_show = [
              ".DS_Store"
              "thumbs.db"
            ];
          };
        };
      };
    };
  };
}
