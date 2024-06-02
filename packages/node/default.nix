{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.nodejs
    pkgs.bun
    pkgs.yarn
    pkgs.nodePackages.pnpm
  ];
}
