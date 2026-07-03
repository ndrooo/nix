{ ... }: 
let
  modules = import ./modules;
in {
  imports = [
    ./base.nix
    modules.cli
  ];
}
