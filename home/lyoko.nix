{ inputs, lib, config, pkgs, ... }:

let
  lmon = "DP-2";
  rmon = "DP-0";
  tvmon = "HDMI-0";

  ws1 = "1: left";
  ws2 = "2: steam";
  ws3 = "3: right";
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

  xdg.configFile = {
    "polybar/lyoko.ini".source = ./polybar/lyoko.ini;
  };

  xsession.windowManager.i3.config = {
    startup = [
      {
        command = "\"pkill polybar; polybar -c ~/.config/polybar/lyoko.ini left; polybar -c ~/.config/polybar/lyoko.ini right\"";
        always = true;
        notification = false;
      }
    ];

    workspaceOutputAssign = [
      { workspace = ws1; output = lmon; }
      { workspace = ws2; output = lmon; }
      { workspace = ws3; output = rmon; }
      { workspace = ws4; output = rmon; }
      { workspace = ws5; output = lmon; }
      { workspace = ws6; output = rmon; }
      { workspace = ws7; output = tvmon; }
      { workspace = ws8; output = lmon; }
    ];

    keybindings = {
      "${alt}+u" = "workspace ${ws1}";
      "${alt}+i" = "workspace ${ws2}";
      "${alt}+o" = "workspace ${ws3}";
      "${alt}+p" = "workspace ${ws4}";
      "${alt}+comma" = "workspace ${ws5}";
      "${alt}+period" = "workspace ${ws6}";
      "${alt}+y" = "workspace ${ws7}";

      "${alt}+Shift+u" = "move container to workspace ${ws1}";
      "${alt}+Shift+i" = "move container to workspace ${ws2}";
      "${alt}+Shift+o" = "move container to workspace ${ws3}";
      "${alt}+Shift+p" = "move container to workspace ${ws4}";
      "${alt}+Shift+comma" = "move container to workspace ${ws5}";
      "${alt}+Shift+period" = "move container to workspace ${ws6}";
      "${alt}+Shift+y" = "move container to workspace ${ws7}";
    };
  };
}
