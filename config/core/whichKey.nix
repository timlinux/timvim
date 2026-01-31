{

  vim.binds.whichKey = {
    enable = true;

    register = {
      # Group prefixes only - leaf descriptions come from keymap desc fields
      "<leader>a" = "󰆔 Assistant";
      "<leader>s" = "󰆔 Session";
      "<leader>b" = "󰓩 Buffers";
      "<leader>c" = "󰅩 Code";
      "<leader>d" = "󰃤 Debug";
      "<leader>f" = "󰈞 Files";
      "<leader>g" = "󰊢 Git";
      "<leader>t" = "󰔡 Toggles";
      "<leader>p" = "󰸶 Preview";
      "<leader>z" = "󰓆 Spell Check";
      "gz" = "󰔡 Surround";
    };

    setupOpts = {
      preset = "modern";
      notify = true;
      win = {
        border = "rounded";
      };
    };
  };

  vim.luaConfigRC.whichkey_height = ''
    -- Allow which-key panel to use up to half the screen height
    -- We set a large static max so which-key never artificially truncates
    local wk_ok, wk = pcall(require, "which-key")
    if wk_ok then
      wk.setup({ win = { height = { min = 4, max = 50 } } })
    end
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
      _G.update_toggle_desc("<leader>tt", "Floaterm", false)
      _G.update_toggle_desc("<leader>tn", "Neotree", false)
      _G.update_toggle_desc("<leader>tf", "Oil File Manager", false)
      _G.update_toggle_desc("<leader>th", "HardTime", false)
      _G.update_toggle_desc("<leader>tc", "Treesitter Context", false)
      _G.update_toggle_desc("<leader>ti", "Indent Guides", false)
      _G.update_toggle_desc("<leader>to", "Code Outline", false)
      _G.update_toggle_desc("<leader>tw", "CursorHold Diagnostics", false)
      _G.update_toggle_desc("<leader>tv", "Virtual Text Diagnostics", false)
      _G.update_toggle_desc("<leader>tp", "Precognition", false)
      _G.update_toggle_desc("<leader>tm", "Markdown Preview", false)
      _G.update_toggle_desc("<leader>tg", "Harper Grammar", false)
      _G.update_toggle_desc("<leader>tz", "Spell Autopopup", false)
      _G.update_toggle_desc("<leader>tu", "Undo Tree", false)
      _G.update_toggle_desc("<leader>td", "Deleted [Gitsigns]", false)
      _G.update_toggle_desc("<leader>ty", "Typing Tutor", false)
    end, 100)
  '';

  vim.ui.borders.plugins.which-key = {
    enable = true;
    style = "rounded";
  };
}
