{ pkgs, ... }:
{
  imports = [
    ./barbecue.nix
    ./ibl.nix
    ./tabline.nix
  ];
}
