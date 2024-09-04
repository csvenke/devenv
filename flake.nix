{
  description = "Development environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    angular-language-server.url = "github:csvenke/angular-language-server-flake";
  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = { pkgs, system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              inputs.angular-language-server.overlays.default
            ];
          };
          inherit (pkgs) callPackage;
        in
        {
          packages = {
            format = callPackage ./tools/format { };
            release = callPackage ./tools/release { };
          };

          devShells = {
            dotnet = callPackage ./packages/dotnet { };
            fnm-use = callPackage ./packages/fnm-use { };
            node = callPackage ./packages/node { };
            java = callPackage ./packages/java { };
            haskell = callPackage ./packages/haskell { };
            python = callPackage ./packages/python { };
            angular = callPackage ./packages/angular { };
            rust = callPackage ./packages/rust { };
            gleam = callPackage ./packages/gleam { };
          };
        };
      flake = {
        templates = {
          default = {
            path = ./templates/default;
            description = "Default template";
          };
        };
      };
    };
}
