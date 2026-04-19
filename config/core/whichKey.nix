{

  vim.binds.whichKey = {
    enable = true;

    register = {
      # Group prefixes only - leaf descriptions come from keymap desc fields
      # Note: <leader>m (Markdown) is buffer-local, only shows in .md files
      "<leader>a" = "󰚩 Assistant";
      "<leader>b" = "󰓩 Buffers";
      "<leader>c" = "󰅩 Code";
      "<leader>d" = "󰃤 Debug";
      "<leader>f" = "󰈞 Files";
      "<leader>g" = "󰊢 Git";
      "<leader>l" = "󰌵 LSP";
      "<leader>n" = "󰑮 Navigate";
      "<leader>N" = "󰈸 Notifications";
      "<leader>o" = " Octo/GitHub";
      "<leader>r" = "󰑕 Refactor";
      "<leader>oi" = " Issues";
      "<leader>op" = " Pull Requests";
      "<leader>or" = " Review";
      "<leader>oc" = " Comments";
      "<leader>oR" = " Repos";
      "<leader>og" = " Gists";
      "<leader>s" = "󰆔 Session";
      "<leader>t" = "󰔡 Toggles";
      "<leader>T" = "󰙨 Test";
      "<leader>x" = "󰖷 Lists";
      "<leader>z" = "󰓆 Spell";
      # gz/gZ groups registered via wk.add() in whichkey_surround_flash for proper icons
    };

    setupOpts = {
      preset = "modern";
      notify = true;
      win = {
        border = "rounded";
        # Allow which-key to expand to show all content
        # Set max high enough to show everything unless screen is too small
        height = {
          min = 4;
          max = 100;
        };
        title = true;
        title_pos = "center";
        footer = true;
        footer_pos = "center";
        padding = [
          1
          2
        ]; # top/bottom, left/right
      };

      # Layout and sorting
      layout = {
        align = "center";
        spacing = 3;
      };

      # Show additional hints
      show_help = true;
      show_keys = true;

      # Icons
      icons = {
        breadcrumb = "»";
        separator = "➜";
        group = "+";
        ellipsis = "…";
        mappings = true;
        rules = [ ];
        colors = true;
        keys = {
          Up = " ";
          Down = " ";
          Left = " ";
          Right = " ";
          C = "󰘴 ";
          M = "󰘵 ";
          D = "󰘳 ";
          S = "󰘶 ";
          CR = "󰌑 ";
          Esc = "󱊷 ";
          ScrollWheelDown = "󱕐 ";
          ScrollWheelUp = "󱕑 ";
          NL = "󰌑 ";
          BS = "󰁮";
          Space = "󱁐 ";
          Tab = "󰌒 ";
          F1 = "󱊫";
          F2 = "󱊬";
          F3 = "󱊭";
          F4 = "󱊮";
          F5 = "󱊯";
          F6 = "󱊰";
          F7 = "󱊱";
          F8 = "󱊲";
          F9 = "󱊳";
          F10 = "󱊴";
          F11 = "󱊵";
          F12 = "󱊶";
        };
      };
    };
  };

  vim.luaConfigRC.whichkey_surround_flash = ''
    -- Register surround and flash keybindings with which-key for visibility
    vim.defer_fn(function()
      local ok, wk = pcall(require, "which-key")
      if not ok then return end

      -- Surround keybindings (remapped to gz prefix to avoid flash conflicts)
      wk.add({
        -- Normal mode surround
        { "gz", group = "Surround", icon = "󰔡" },
        { "gZ", group = "Surround Line", icon = "󰔡" },
        { "gzz", desc = "Surround entire line", icon = "󰔡" },
        { "gZZ", desc = "Surround current line", icon = "󰔡" },
        { "gzd", desc = "Delete surrounding", icon = "󰛌" },
        { "gzr", desc = "Change surrounding", icon = "󰏫" },
        { "gZR", desc = "Change surrounding line", icon = "󰏫" },

        -- Flash keybindings
        { "s", desc = "Flash jump", icon = "󰉁", mode = { "n", "x", "o" } },
        { "S", desc = "Flash Treesitter", icon = "󰐅", mode = { "n", "x", "o" } },
        { "r", desc = "Remote flash", icon = "󰈿", mode = "o" },
        { "R", desc = "Treesitter search", icon = "󰈿", mode = { "o", "x" } },
      })
    end, 150)
  '';

  vim.luaConfigRC.whichkey_toggle_icons = ''
    -- Dynamic toggle icons: gray off icon when disabled, colored on icon when enabled
    -- Toggle state tracking table
    _G.toggle_states = _G.toggle_states or {}

    -- Highlight groups for toggle states
    vim.api.nvim_set_hl(0, "WhichKeyToggleOff", { fg = "#666666" })
    vim.api.nvim_set_hl(0, "WhichKeyToggleOn", { fg = "#89b4fa" })

    -- Helper to update which-key toggle descriptions
    _G.update_toggle_desc = function(key, name, enabled)
      local ok, wk = pcall(require, "which-key")
      if not ok then return end
      local icon = enabled and "󰔡" or "󰨚"
      local hl = enabled and "WhichKeyToggleOn" or "WhichKeyToggleOff"
      local state = enabled and "ON" or "OFF"
      wk.add({
        { key, desc = name .. " [" .. state .. "]", icon = { icon = icon, hl = hl } },
      })
    end

    -- Initialize all toggle descriptions as OFF
    vim.defer_fn(function()
      _G.update_toggle_desc("<leader>tt", "Terminal", false)
      _G.update_toggle_desc("<leader>th", "HardTime", false)
      _G.update_toggle_desc("<leader>tc", "Treesitter Context", false)
      _G.update_toggle_desc("<leader>ti", "Indent Guides", false)
      _G.update_toggle_desc("<leader>to", "Code Outline", false)
      _G.update_toggle_desc("<leader>tw", "CursorHold Diagnostics", false)
      _G.update_toggle_desc("<leader>tv", "Virtual Text Diagnostics", false)
      _G.update_toggle_desc("<leader>tp", "Precognition", false)
      _G.update_toggle_desc("<leader>tg", "Harper Grammar", false)
      _G.update_toggle_desc("<leader>tz", "Spell Autopopup", false)
      _G.update_toggle_desc("<leader>tu", "Undo Tree", false)
      _G.update_toggle_desc("<leader>tT", "Typing Tutor", false)
    end, 100)
  '';

  vim.ui.borders.plugins.which-key = {
    enable = true;
    style = "rounded";
  };
}
