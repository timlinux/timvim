{ pkgs, ... }:
{
  vim.extraPlugins = with pkgs.vimPlugins; {
    nvim-autopairs = {
      package = nvim-autopairs;
      setup = ''require("nvim-autopairs").setup {}'';
    };
  };
}
