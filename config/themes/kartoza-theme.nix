{
  vim.theme = {
    enable = false;
  };
  vim.luaConfigRC = {
    kartoza = ''
      transparent_background = true
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
        kartozablue = "#569FC6",    -- Kartoza blue (highlight2)
        kartozaorange = "#DF9E2F",    -- Kartoza yellow/orange (highlight1)
        kartozagray = "#8A8B8B",    -- Kartoza grey (highlight3)
        base03 = "#1e2020",    -- dark background
        red = "#CC0403",       -- Kartoza alert red
        green = "#06969A",     -- Kartoza teal (highlight4)
        yellow = "#DF9E2F",    -- Kartoza yellow/orange (highlight1)
        blue = "#f8faf6",      -- light foreground
        magenta = "#569FC6",   -- Kartoza blue (highlight2)
        cyan = "#569FC6",      -- Kartoza blue (highlight2)
        base2 = "#f1f1f1",     -- light foreground - text on lualine, vim editor main text and splash
        base02 = "#2b2e2e",    -- secondary dark background - also used as lualine background and popup
        orange = "#DF9E2F",    -- Kartoza yellow/orange (highlight1)
        base01 = "#569FC6",    -- Kartoza blue (highlight2) - popup panel arrows
        base00 = "#ff65ff",    -- base00
        base0 = "#00c8ad",     -- base0
        violet = "#56f341",    -- violet
        base1 = "#f23abb",     -- base1
        base3 = "#c8856e",      -- light background
        darktext = "#569FC6"  -- for line numbers (Kartoza blue)
      }

      -- Apply highlights using proper Lua syntax
      local highlights = {
        Normal = { fg = colors.base2, bg = colors.base03 },
        NormalFloat = { fg = colors.base2, bg = colors.base02 },
        Comment = { fg = colors.kartozagray, italic = true },
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
        LineNr = { fg = colors.darktext, bg = colors.base03 },
        CursorLineNr = { fg = colors.yellow, bg = colors.base02, bold = true },
        StatusLine = { fg = colors.base2, bg = colors.base02 },
        Visual = { fg = colors.violet, bg = colors.base03 },

        -- UI frames/borders in Kartoza orange
        FloatBorder = { fg = colors.kartozaorange, bg = colors.base02 },
        WinSeparator = { fg = colors.kartozaorange },
        VertSplit = { fg = colors.kartozaorange },
        TelescopeBorder = { fg = colors.kartozaorange },
        TelescopePromptBorder = { fg = colors.kartozaorange },
        TelescopeResultsBorder = { fg = colors.kartozaorange },
        TelescopePreviewBorder = { fg = colors.kartozaorange },
        FzfLuaBorder = { fg = colors.kartozaorange },
        NotifyBorder = { fg = colors.kartozaorange },
        WhichKeyBorder = { fg = colors.kartozaorange },
        LspInfoBorder = { fg = colors.kartozaorange },
        DiagnosticInfo = { fg = colors.kartozaorange },

        -- Noice / cmdline borders
        NoiceCmdlinePopupBorder = { fg = colors.kartozaorange },
        NoiceCmdlinePopupBorderSearch = { fg = colors.kartozaorange },
        NoicePopupBorder = { fg = colors.kartozaorange },
        NoiceConfirmBorder = { fg = colors.kartozaorange },

        -- Completion / misc popup borders
        CmpBorder = { fg = colors.kartozaorange },
        SagaBorder = { fg = colors.kartozaorange },
        TroubleNormal = { fg = colors.base2, bg = colors.base03 },
        LazyNormal = { fg = colors.base2, bg = colors.base03 },
        MasonNormal = { fg = colors.base2, bg = colors.base03 },
      }

      -- Set all highlights
      for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
      end
    '';
  };
}
