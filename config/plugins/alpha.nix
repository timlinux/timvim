{ pkgs, lib, ... }:

let
  # mkButton helper to create a button with Lua on_press feeding keys
  mkButton =
    {
      val,
      shortcut,
      cmd,
    }:
    {
      type = "button";
      val = val;
      on_press.__raw = ''
        function()
          local keys = vim.api.nvim_replace_termcodes("<leader>' .. shortcut .. '", true, false, true)
          vim.api.nvim_feedkeys(keys, "m", false)
        end
      '';
      opts = {
        shortcut = shortcut;
        keymap = [
          "n"
          shortcut
          cmd
          # {}
          {
            noremap = true;
            silent = true;
            nowait = true;
            desc = val;
          }
        ];
        position = "center";
        width = 30;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    };
in
{
  vim.dashboard.alpha = {
    enable = true;
    theme = null;

    layout = [
      # ASCII Art Header
      {
        type = "text";
        val = [
          "                                                                     "
          "       ████ ██████           █████      ██                     "
          "      ███████████             █████                             "
          "      █████████ ███████████████████ ███   ███████████   "
          "     █████████  ███    █████████████ █████ ██████████████   "
          "    █████████ ██████████ █████████ █████ █████ ████ █████   "
          "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
          " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
        ];
        opts = {
          position = "center";
          hl = "Type";
        };
      }

      {
        type = "padding";
        val = 2;
      }

      {
        type = "text";
        val = [ "Welcome to Neovim!" ];
        opts = {
          position = "center";
          hl = "Keyword";
        };
      }

      {
        type = "padding";
        val = 1;
      }

      # Buttons group using mkButton helper
      {
        type = "group";
        val = [
          (mkButton {
            val = "  New file";
            shortcut = "fn";
            cmd = ":ene <CR>";
          })
          (mkButton {
            val = "  Find file";
            shortcut = "ff";
            cmd = ":Telescope find_files<CR>";
          })
          (mkButton {
            val = "  Recent files";
            shortcut = "fr";
            cmd = ":Telescope oldfiles<CR>";
          })
          (mkButton {
            val = "  Live grep";
            shortcut = "fg";
            cmd = ":Telescope live_grep<CR>";
          })
          (mkButton {
            val = "  Bookmarks";
            shortcut = "fm";
            cmd = ":Telescope marks<CR>";
          })
          (mkButton {
            val = "  Config";
            shortcut = "fc";
            cmd = ":edit ~/.config/nvim/init.lua<CR>";
          })
          (mkButton {
            val = "  Quit";
            shortcut = "fq";
            cmd = ":qa<CR>";
          })
        ];
      }

      {
        type = "padding";
        val = 1;
      }

      # Footer
      {
        type = "text";
        val = [ "🧠 NVF dashboard ready." ];
        opts = {
          position = "center";
          hl = "Comment";
        };
      }
    ];
  };
}
