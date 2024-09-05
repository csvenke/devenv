{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    fnm
    bun
    yarn
    nodePackages.pnpm
  ];

  shellHook = /* bash */ ''
    alias npm-run="nix run github:csvenke/tools#npm-run"

    if [ -e .node-version ] || [ -e .nvmrc ]; then
      eval "$(fnm env --use-on-cd)"
      fnm use --install-if-missing --silent-if-unchanged
    fi
  '';
}
