{
  vim.utility.motion = {

    flash-nvim = {
      enable = true;
      mappings = {
        jump = "s"; # jump key
        remote = "r"; # remote jump
        toggle = "<c-s>"; # toggle search
        treesitter = "S"; # Treesitter jump
        treesitter_search = "R"; # Treesitter search
      };
      setupOpts = { }; # use defaults, optional
    };
  };
}
