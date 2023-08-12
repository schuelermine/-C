{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  description = "a small utility to run commands in different directories";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in { packages = rec { default = pkgs.callPackage ./. { }; }; }) // {
        overlays.default = final: prev: {
          "-C" = self.packages.${system}.default;
        };
      };
}
