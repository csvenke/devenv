{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    fnm
    bun
    yarn
    nodePackages.pnpm

    (callPackage ./scripts/npm-run.nix { })
  ];

  shellHook = /* bash */ ''
    if [ -e .node-version ] || [ -e .nvmrc ]; then
      eval "$(fnm env --use-on-cd)"
      fnm use --install-if-missing --silent-if-unchanged
    fi
  '';
}
