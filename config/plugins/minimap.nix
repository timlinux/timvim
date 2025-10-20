{ ... }:
{
  vim.minimap = {
    #enable = true;
    codewindow = {
      enable = true;
      mappings = {
        open = "<leader>cs";
        close = "<leader>ch";
        toggle = "<leader>cm";
        toggleFocus = "<leader>ci";
      };
    };
  };
}
