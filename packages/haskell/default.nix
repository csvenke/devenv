{ pkgs }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ghc
    pkgs.cabal-install
    pkgs.stack
  ];
}
