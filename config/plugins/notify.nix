{ pkgs, ... }:
{
  vim.notify = {
    nvim-notify = {
      enable = true;
    };
  };

  # Enhanced notify configuration
  vim.extraPlugins.notify-config = {
    package = pkgs.vimPlugins.nvim-notify;
    setup = ''
      require("notify").setup({
        -- Animation style
        stages = "fade_in_slide_out", -- Beautiful fade in, slide out animation

        -- Timeout for notifications (in ms)
        timeout = 5000, -- 5 seconds (default is 5000, but let's be explicit)

        -- Position on screen
        top_down = false, -- Notifications appear from bottom right corner

        -- Minimum width for notification windows
        minimum_width = 50,

        -- Maximum width (percentage of editor width or absolute value)
        max_width = 60,

        -- Maximum height
        max_height = 20,

        -- Icons for each level
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },

        -- Background transparency
        background_colour = "#000000",

        -- Render function for notification content
        render = "wrapped-compact", -- Compact style with word wrapping

        -- FPS for animations
        fps = 60,

        -- Level to show (vim.log.levels)
        level = vim.log.levels.INFO,
      })

      -- Set notify as the default notification handler
      vim.notify = require("notify")
    '';
  };

  # Keybindings for notification management
  vim.luaConfigRC.notify-keybinds = ''
    -- Dismiss all visible notifications
    vim.keymap.set("n", "<leader>nd", function()
      require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss All Notifications" })

    -- Show notification history
    vim.keymap.set("n", "<leader>nh", function()
      require("telescope").extensions.notify.notify()
    end, { desc = "Notification History" })
  '';
}
