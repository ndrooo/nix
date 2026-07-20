{ ... }:
let
  modules = import ./modules;

  ws-web = "1: web";
  ws-chat = "2: chat";
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
    # left
    output.DP-4 = {
      scale = "1.5";
      position = "0 0";
    };
    # right
    output.DP-5 = {
      scale = "1.5";
      position = "2560 0";
    };

    workspaceOutputAssign = [
      {
        workspace = ws-web;
        output = "DP-5";
      }
      {
        workspace = ws-chat;
        output = "DP-4";
      }
    ];

    startup = [
      { command = "swayidle -C ~/.config/sway/swayidle-desktop"; }
    ];
  };

  services.syncthing.enable = true;
}
