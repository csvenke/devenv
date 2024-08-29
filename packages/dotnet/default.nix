{ pkgs }:

with pkgs.dotnetCorePackages;

let
  dotnet = (combinePackages [
    sdk_6_0
    sdk_7_0
    sdk_8_0
  ]);
in

pkgs.mkShell {
  packages = [
    dotnet
    pkgs.csharpier
    pkgs.omnisharp-roslyn
  ];
  shellHook = ''
    export DOTNET_ROOT=${dotnet}
  '';
}
