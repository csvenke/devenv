{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.fnm
  ];

  shellHook = ''
    eval "$(fnm env --use-on-cd)"
    fnm use --install-if-missing --silent-if-unchanged
  '';
}
