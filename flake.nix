{
  description = "Development environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = { pkgs, ... }:
        let
          inherit (pkgs) callPackage;
        in
        {
          devShells.dotnet = callPackage ./packages/dotnet { };
          devShells.fnm-use = callPackage ./packages/fnm-use { };
          devShells.node = callPackage ./packages/node { };
          devShells.java = callPackage ./packages/java { };
          devShells.haskell = callPackage ./packages/haskell { };
          devShells.python = callPackage ./packages/python { };
          devShells.angular = callPackage ./packages/angular { };
        };
      flake = {
        templates.default = {
          path = ./templates/default;
          description = "Default template";
        };
      };
    };
}
