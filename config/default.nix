{ pkgs, ... }:
{
  imports = [
    ./core
    ./plugins
    ./themes
    ./ui
  ];
}
