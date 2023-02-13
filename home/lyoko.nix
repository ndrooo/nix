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
  ws9 = "9: nine";
  ws10 = "10: ten";

  mod = "Mod4";
  alt = "Mod1";
in {
  imports = [
    ./base.nix
    ./modules/cli.nix
    ./modules/graphix.nix
    ./modules/i3.nix
    ./themes/luna.nix
  ];

  programs.kitty.font.size = 13;

  services.polybar.config = ./modules/polybar/lyoko.ini;

  xsession.windowManager.i3.config = {
    startup = [
      {
        command = "\"polybar left &\"";
        notification = false;
      }
      {
        command = "\"polybar right &\"";
        notification = false;
      }
      {
        command = "polybar-msg cmd restart";
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
      "${mod}+1" = "workspace ${ws1}";
      "${mod}+2" = "workspace ${ws2}";
      "${mod}+3" = "workspace ${ws3}";
      "${mod}+4" = "workspace ${ws4}";
      "${mod}+5" = "workspace ${ws5}";
      "${mod}+6" = "workspace ${ws6}";
      "${mod}+7" = "workspace ${ws7}";
      "${mod}+8" = "workspace ${ws8}";
      "${mod}+9" = "workspace ${ws9}";
      "${mod}+0" = "workspace ${ws10}";

      "${mod}+Shift+1" = "move container to workspace ${ws1}";
      "${mod}+Shift+2" = "move container to workspace ${ws2}";
      "${mod}+Shift+3" = "move container to workspace ${ws3}";
      "${mod}+Shift+4" = "move container to workspace ${ws4}";
      "${mod}+Shift+5" = "move container to workspace ${ws5}";
      "${mod}+Shift+6" = "move container to workspace ${ws6}";
      "${mod}+Shift+7" = "move container to workspace ${ws7}";
      "${mod}+Shift+8" = "move container to workspace ${ws8}";
      "${mod}+Shift+9" = "move container to workspace ${ws9}";
      "${mod}+Shift+0" = "move container to workspace ${ws10}";

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
