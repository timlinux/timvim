{ pkgs, lib, ... }:

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

      # Buttons
      {
        type = "button";
        val = "  New file";
        on_press.__raw = "function() vim.cmd('ene') end";
        opts = {
          shortcut = "n";
          keymap = [
            "n"
            "n"
            ":ene<CR>"
          ];
          position = "center";
          width = 30;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      {
        type = "group";
        val = [
          {
            type = "button";
            val = "  Find file";
            on_press = ":Telescope find_files<CR>";
            opts = {
              shortcut = "f";
              keymap = [
                "n"
                "f"
                ":Telescope find_files<CR>"
              ];
              position = "center";
              width = 30;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Live grep";
            on_press = ":Telescope live_grep<CR>";
            opts = {
              shortcut = "g";
              keymap = [
                "n"
                "g"
                ":Telescope live_grep<CR>"
              ];
              position = "center";
              width = 30;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Recent files";
            on_press = ":Telescope oldfiles<CR>";
            opts = {
              shortcut = "r";
              keymap = [
                "n"
                "r"
                ":Telescope oldfiles<CR>"
              ];
              position = "center";
              width = 30;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Bookmarks";
            on_press = ":Telescope marks<CR>";
            opts = {
              shortcut = "m";
              keymap = [
                "n"
                "m"
                ":Telescope marks<CR>"
              ];
              position = "center";
              width = 30;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Config";
            on_press = ":edit ~/.config/nvim/init.lua<CR>";
            opts = {
              shortcut = "c";
              keymap = [
                "n"
                "c"
                ":edit ~/.config/nvim/init.lua<CR>"
              ];
              position = "center";
              width = 30;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Quit";
            on_press = ":qa<CR>";
            opts = {
              shortcut = "q";
              keymap = [
                "n"
                "q"
                ":qa<CR>"
              ];
              position = "center";
              width = 30;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
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
