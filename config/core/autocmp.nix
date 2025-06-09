{ pkgs, lib, ... }:
{
  vim = {
    autocomplete.nvim-cmp = {
      enable = true;

      sources = lib.mkForce {
        "nvim_lsp" = "[LSP]";
        "path" = "[Path]";
        "buffer" = "[Buffer]";
        "luasnip" = "[snippets]";
      };
    };
  };
}
