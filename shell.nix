let
#  nixpkgs = import <nixpkgs>;
  pkgs = import <nixpkgs> {
    config = {};
    overlays = [
      (import ./overlay.nix)
    ];
  };
  shell = pkgs.mkShell {
    buildInputs = pkgs.balenaos-in-container.buildInputs ++ [ pkgs.valgrind pkgs.gdb ];
  };

in shell
