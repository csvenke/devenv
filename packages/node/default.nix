{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.nodejs
    pkgs.fnm
    pkgs.bun
    pkgs.yarn
    pkgs.nodePackages.pnpm
  ];

  shellHook = /* bash */ ''
    if [ -e .node-version ] || [ -e .nvmrc ]; then
      eval "$(fnm env --use-on-cd)"
      fnm use --install-if-missing --silent-if-unchanged
    fi
  '';
}
