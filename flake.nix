{
  description = "NVF Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nvf.url = "github:notashelf/nvf";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      #nixpkgs,
      nixpkgs-stable,

      ...
    }@inputs:
    {
      packages.x86_64-linux = {
        default =
          (inputs.nvf.lib.neovimConfiguration {
            pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
            modules = [
              ./config
            ];
          }).neovim;
      };
    };
}
