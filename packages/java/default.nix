{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.jdk
    pkgs.maven
    pkgs.gradle
  ];
}
