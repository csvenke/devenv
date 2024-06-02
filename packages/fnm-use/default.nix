{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.fnm
  ];

  shellHook = /* bash */ ''
    if [ ! -e .node-version ] && [ ! -e .nvmrc ]; then
      "${pkgs.nodejs}/bin/node" -v > .node-version
    fi

    eval "$(fnm env --use-on-cd)"
    fnm use --install-if-missing --silent-if-unchanged
  '';
}
