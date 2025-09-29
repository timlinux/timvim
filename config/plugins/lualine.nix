{ pkgs, ... }:
{
  vim = {

    statusline = {
      lualine = {
        enable = true;
        theme = "auto";
        icons.enable = true;
        disabledFiletypes = [
          "alpha"
        ];
      };
    };
    luaConfigRC = {
      lualine_kartoza = ''
        -- Kartoza lualine theme
        local colors = {
          bg       = "#1e2020",
          fg       = "#f1f1f1",
          yellow   = "#ecb44b",
          cyan     = "#85b0c8",
          darkblue = "#57a0c7",
          green    = "#8ad384",
          orange   = "#eb8444",
          violet   = "#56f341",
          magenta  = "#57a0c7",
          blue     = "#f8faf6",
          red      = "#c13022"
        }
        local kartoza = {
          normal = {
            a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          insert = {
            a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          visual = {
            a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          replace = {
            a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          command = {
            a = { fg = colors.bg, bg = colors.orange, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          inactive = {
            a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
          },
        }
        require('lualine').setup {
          options = { theme = kartoza }
        }
      '';
    };
  };
}
