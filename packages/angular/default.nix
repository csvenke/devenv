{ pkgs, language-servers }:

pkgs.mkShell {
  packages = [
    pkgs.nodePackages."@angular/cli"
    language-servers.packages.angular-language-server
  ];
}
