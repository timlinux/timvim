{ pkgs, lib, ... }:
let
  ui_select = pkgs.vimUtils.buildVimPlugin {
    pname = "telescope-ui-select.nvim";
    version = "2023-12-04";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2";
      sha256 = "1cgi4kmq99ssx97nnriff5674cjfvc3qsw62nx3iz0xqc6d4s631";
    };
  };
in
{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.telescope-nvim
    ];
    extraPlugins = {
      "telescope-ui-select" = {
        package = ui_select;
        setup = ''
          require("telescope").setup {
            extensions = {
              ["ui-select"] = require("telescope.themes").get_dropdown({})
            }
          }
          require("telescope").load_extension("ui-select")
        '';
      };
    };
  };
}
