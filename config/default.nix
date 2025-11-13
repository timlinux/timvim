{ pkgs, ... }:
{
  imports = [
    ./assistant
    ./core
    ./plugins
    ./themes
    ./ui
    ./utility
  ];

  # Extra packages available to Neovim
  vim.extraPackages = with pkgs; [
    # No additional packages needed for Claude Code integration
  ];
}
