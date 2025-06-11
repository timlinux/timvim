{ pkgs, ... }:
{
  vim.notes = {
    obsidian = {
      enable = true;

      setupOpts = {
        completion.nvim_cmp = true;
      };
    };
  };
}
