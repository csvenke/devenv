{ pkgs }:

let
  inherit (pkgs.lib) pipe;
  inherit (builtins) readFile toFile;

  config = pipe ./.prettierrc [
    readFile
    (toFile "prettierrc")
  ];
in

pkgs.writeShellApplication {
  name = "format";
  runtimeInputs = [ pkgs.nodePackages.prettier ];
  text = ''
    prettier --config ${config} --write "$@"
  '';
}
