{ pkgs, ... }:
{
  config.vim = {
    viAlias = true;
    vimAlias = true;
    debugMode = {
      enable = false;
      level = 16;
      logFile = "tmp/nvim.log";
    };

    spellcheck = {
      enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;

      # This drops all the letters into a pile of letter heap, just for fun
      cellular-automaton.enable = true;
    };

    # Status line at the bottom of the nvim editor
    statusline = {
      lualine = {
        enable = true;
      };
    };

    # Auto Pairing of Brackets and Braces
    autopairs.nvim-autopairs.enable = true;

    # Auto complete
    autocomplete = {
      nvim-cmp.enable = true;
      blink-cmp.enable = true;
    };

    # Enable adds code snippets as you type your code along
    snippets.luasnip.enable = true;

    # Allow tree like structure for browsing your directory
    filetree = {
      neo-tree = {
        enable = true;
      };
    };

  };
}
