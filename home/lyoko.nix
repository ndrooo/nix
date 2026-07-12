{ ... }:
let
  modules = import ./modules;
in
{
  imports = [
    ./base.nix
    modules.cli
    modules.graphical
    modules.sway
    modules.kitty
    ./themes/sumac.nix
  ];

  services.syncthing.enable = true;
}
