{ pkgs }:

with pkgs;
let
  essentials =
    [ coreutils ];

in mkShell {
  name = "flakeEnv";
  buildInputs = essentials;
}
