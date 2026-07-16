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

  wayland.windowManager.sway.config = {
    output.DP-4 = {
      scale = "1.5";
    };
    output.DP-5 = {
      scale = "1.5";
    };
  };

  services.syncthing.enable = true;
}
