{ pkgs, ... }:
{
  config.vim = {
    telescope = {
      enable = true;

      #      mappings = {
      #        findFiles = "<leader>ff";
      #        liveGrep = "<leader>fg";
      #      };

    };
  };
}
