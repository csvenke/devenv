{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.nodePackages."@angular/cli"
  ];
}
