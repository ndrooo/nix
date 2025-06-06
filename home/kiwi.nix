{ pkgs, ... }:
let
  modules = import ./modules;

  ws1 = "1: web";
  ws2 = "2: notes";
  ws3 = "3: chat";
  ws4 = "4: code";
  ws5 = "5: games";
  ws6 = "6: six";
  ws7 = "7: seven";
  ws8 = "8: music";
  ws9 = "9: nine";
  ws10 = "10: ten";

  mod = "Mod4";
  alt = "Mod1";
in {
  imports = [
    ./base.nix
    modules.cli
    modules.gfx
    modules.gfx_home
    modules.i3
    modules.kitty
    modules.sway
    modules.zathura
    ./themes/sumac.nix
  ];

  programs.kitty.font.size = 13;

  services.polybar.config = ./modules/polybar/kiwi.ini;
  services.polybar.script = "polybar laptop &";

  wayland.windowManager.sway.config = {
    defaultWorkspace = "workspace ${ws1}";

    keybindings = {
      "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1000";
      "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1000";
      "XF86MonBrightnessUp" = "exec light -A 5";
      "XF86MonBrightnessDown" = "exec light -U 5";
      "XF86AudioPlay" = "exec playerctl play-pause";
      "Print" = "exec grim && notify-send -t 1000 \"took screenshot\"";

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
      "${alt}+y" = "workspace ${ws8}";

      "${alt}+Shift+u" = "move container to workspace ${ws1}";
      "${alt}+Shift+i" = "move container to workspace ${ws2}";
      "${alt}+Shift+o" = "move container to workspace ${ws3}";
      "${alt}+Shift+p" = "move container to workspace ${ws4}";
      "${alt}+Shift+comma" = "move container to workspace ${ws5}";
      "${alt}+Shift+period" = "move container to workspace ${ws6}";
      "${alt}+Shift+y" = "move container to workspace ${ws8}";
    };
  };

  xsession.windowManager.i3.config = {
    defaultWorkspace = "workspace ${ws1}";

    keybindings = {
      "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1000";
      "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1000";
      "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
      "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
      "XF86AudioPlay" = "exec playerctl play-pause";

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
      "${alt}+y" = "workspace ${ws8}";

      "${alt}+Shift+u" = "move container to workspace ${ws1}";
      "${alt}+Shift+i" = "move container to workspace ${ws2}";
      "${alt}+Shift+o" = "move container to workspace ${ws3}";
      "${alt}+Shift+p" = "move container to workspace ${ws4}";
      "${alt}+Shift+comma" = "move container to workspace ${ws5}";
      "${alt}+Shift+period" = "move container to workspace ${ws6}";
      "${alt}+Shift+y" = "move container to workspace ${ws8}";
    };
  };
}