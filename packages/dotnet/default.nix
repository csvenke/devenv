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

    (pkgs.callPackage ./scripts/dotnet-run.nix { })
  ];
  shellHook = ''
    export DOTNET_ROOT=${dotnet}
  '';
}
