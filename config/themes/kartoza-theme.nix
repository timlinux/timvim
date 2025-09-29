{
  vim.theme = {
    enable = false;
  };
  vim.luaConfigRC = {
    kartoza = ''
      -- Kartoza Custom Theme
      vim.cmd([[ 
        highlight clear
        if exists("syntax_on")
          syntax reset
        endif
        set background=dark
        let g:colors_name = "kartoza"
      ]])

      -- Base colors from Kartoza palette
      local colors = {
        kartozablue = "#57a0c7",    -- secondary dark background - also used as lualine background and popup
        kartozaorange = "#eb8444",    -- kartoza-kartoza-orange
        kartozagray = "#878B8D",    -- kartoza-gray
        base03 = "#1e2020",    -- dark background
        red = "#c13022",       -- orange-red tone
        green = "#0e9002",     -- yellow-greenish
        yellow = "#ecb44b",    -- yellow
        blue = "#f8faf6",      -- blue
        magenta = "#57a0c7",   -- magenta - writing on splash right and keyboard shortcut panel
        cyan = "#85b0c8",      -- cyan
        base2 = "#f1f1f1",     -- light foreground - text on lualine, vim editor main text and splash
        base02 = "#2b2e2e",    -- secondary dark background - also used as lualine background and popup
        orange = "#eb8444",    -- orange
        base01 = "#57a0c7",    -- base01 little arrows on popup panels for keymap
        base00 = "#ff65ff",    -- base00
        base0 = "#00c8ad",     -- base0
        violet = "#56f341",    -- violet
        base1 = "#f23abb",     -- base1
        base3 = "#c8856e"      -- light background
      }

      -- Apply highlights using proper Lua syntax
      local highlights = {
        Normal = { fg = colors.base2, bg = colors.base03 },
        NormalFloat = { fg = colors.base2, bg = colors.base02 },
        Comment = { fg = colors.base01, italic = true },
        Constant = { fg = colors.yellow },
        String = { fg = colors.green },
        Character = { fg = colors.green },
        Number = { fg = colors.orange },
        Boolean = { fg = colors.magenta },
        Function = { fg = colors.blue, bold = true },
        Statement = { fg = colors.magenta, bold = true },
        Operator = { fg = colors.red },
        Type = { fg = colors.yellow, bold = true },
        Special = { fg = colors.cyan },
        Error = { fg = colors.red, bg = colors.base03, bold = true },
        Search = { fg = colors.base03, bg = colors.yellow },
        CursorLine = { bg = colors.base02 },
        LineNr = { fg = colors.base01, bg = colors.base03 },
        CursorLineNr = { fg = colors.yellow, bg = colors.base02, bold = true },
        StatusLine = { fg = colors.base2, bg = colors.base02 },
        Visual = { bg = colors.base02, bg = colors.base03  }
      }

      -- Set all highlights
      for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
      end
    '';
  };
}
