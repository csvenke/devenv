{ pkgs }:

let
  dotnet = with pkgs.dotnetCorePackages; (combinePackages [
    sdk_6_0
    sdk_7_0
    sdk_8_0
  ]);
in

pkgs.mkShell {
  packages = with pkgs; [
    dotnet
    csharpier
    omnisharp-roslyn
  ];
  shellHook = ''
    alias dotnet-run="nix run github:csvenke/tools#dotnet-run"

    export DOTNET_ROOT=${dotnet}
  '';
}
