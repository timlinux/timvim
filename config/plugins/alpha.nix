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

      dashboard.section.header.val = {
        "                                                                     ",
        "       ████ ██████          █████      ██                     ",
        "      ███████████             █████                             ",
        "      █████████ ███████████████████ ███   ███████████   ",
        "     █████████  ███    █████████████ █████ ██████████████   ",
        "    █████████ ██████████ ████████ █████ █████ ████ █████   ",
        "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
        " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", ":ene | startinsert<CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("g", "  Live grep", ":Telescope live_grep<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("m", "  Bookmarks", ":Telescope marks<CR>"),
        dashboard.button("c", "  Config", ":edit ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>")
      }

      dashboard.section.footer.val = { "🧠 NVF dashboard ready." }

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    '';
  };
}
