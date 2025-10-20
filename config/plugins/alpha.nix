{ pkgs, ... }:

{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.alpha-nvim
      pkgs.vimPlugins.plenary-nvim # required dependency
    ];

    pluginRC.alpha = ''
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

      -- Simple menu buttons
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", ":ene | startinsert<CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  Restore session", ":SessionManager load_last_session<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>")
      }

      -- Simple footer
      dashboard.section.footer.val = {"Welcome to NeoVim"}

      -- Layout without header
      dashboard.config.layout = {
        {type = "padding", val = 8},
        dashboard.section.buttons,
        {type = "padding", val = 2},
        dashboard.section.footer,
      }

      -- Setup alpha
      alpha.setup(dashboard.config)

      -- Auto-show alpha on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
            require("alpha").start()
          end
        end,
      })
    '';
  };
}
