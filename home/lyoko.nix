{ inputs, lib, config, pkgs, ... }:

let
  lmon = "DP-2";
  rmon = "DP-0";
  tvmon = "HDMI-0";

  ws1 = "1: www";
  ws2 = "2: www";
  ws3 = "3: steam";
  ws4 = "4: discord";
  ws5 = "5: code";
  ws6 = "6: docs";
  ws7 = "7: teevee";
  ws8 = "8: music";

  alt = "Mod1";
in {
  imports = [
    ./base.nix
    ./i3.nix
  ];

  xsession.windowManager.i3.config = {
    workspaceOutputAssign = [
      { workspace = ws1; output = lmon; }
      { workspace = ws2; output = rmon; }
      { workspace = ws3; output = lmon; }
      { workspace = ws4; output = rmon; }
      { workspace = ws5; output = lmon; }
      { workspace = ws6; output = rmon; }
      { workspace = ws7; output = tvmon; }
      { workspace = ws8; output = rmon; }
    ];

    keybindings = {
      "${alt}+u" = "workspace ${ws1}";
      "${alt}+o" = "workspace ${ws2}";
      "${alt}+i" = "workspace ${ws3}";
      "${alt}+p" = "workspace ${ws4}";
      "${alt}+comma" = "workspace ${ws5}";
      "${alt}+period" = "workspace ${ws6}";

      "${alt}+Shift+u" = "move container to workspace ${ws1}";
      "${alt}+Shift+o" = "move container to workspace ${ws2}";
      "${alt}+Shift+i" = "move container to workspace ${ws3}";
      "${alt}+Shift+p" = "move container to workspace ${ws4}";
      "${alt}+Shift+comma" = "move container to workspace ${ws5}";
      "${alt}+Shift+period" = "move container to workspace ${ws6}";
    };
  };
}
