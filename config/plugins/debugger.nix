{ pkgs, ... }:
{
  vim.debugger = {
    nvim-dap = {
      enable = true;

      ui = {
        enable = true;
        autoStart = true;
      };

      mappings = {
        continue = "<leader>dc";
        goDown = "<leader>dj";
        goUp = "<leader>dk";
        hover = "<leader>dh";
      };
    };
  };
}
