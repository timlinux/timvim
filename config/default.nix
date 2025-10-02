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
    nodejs_20 # Required for GitHub Copilot
  ];
}
