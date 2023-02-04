{ inputs, lib, config, pkgs, ... }:

let
  mod = "Mod4";
  bg = "#101010";
  fg = "#e0def4";
  second = "#3d3d3d";
  first = "#7882bf";
  urgent = "#596196";
  terminal = "kitty";
in {
  xsession.windowManager.i3.enable = true;

  xsession.windowManager.i3.config = {
    inherit terminal;

    startup = [
      { command = "nitrogen --restore"; always = true; notification = false; }
      { command = "\"pkill dunst; dunst\""; always = true; notification = false; }
    ];

    modifier = "${mod}";
    keybindings = {
      "${mod}+Return" = "exec ${terminal}";

      "${mod}+Shift+c" = "reload";
      "${mod}+Shift+r" = "restart";
      "${mod}+Shift+e" = "exit";
      "${mod}+Shift+s" = "exec systemctl suspend";

      "${mod}+h" = "focus left";
      "${mod}+j" = "focus down";
      "${mod}+k" = "focus up";
      "${mod}+l" = "focus right";
      "${mod}+Shift+h" = "move left";
      "${mod}+Shift+j" = "move down";
      "${mod}+Shift+k" = "move up";
      "${mod}+Shift+l" = "move right";

      "${mod}+BackSpace" = "focus mode_toggle";
      "${mod}+Shift+BackSpace" = "floating toggle";

      "${mod}+r" = "layout toggle split";
      "${mod}+e" = "layout stacking";
      "${mod}+v" = "split v";
      "${mod}+f" = "fullscreen toggle";
      "${mod}+a" = "focus parent";

      "${mod}+Control+h" = "resize grow left 2px or 2ppt";
      "${mod}+Control+j" = "resize grow down 2px or 2ppt";
      "${mod}+Control+k" = "resize grow up 2px or 2ppt";
      "${mod}+Control+l" = "resize grow right 2px or 2ppt";

      "${mod}+q" = "kill";
      "${mod}+Shift+q" = "exec xkill -id `xprop -root _NET_ACTIVE_WINDOW | cut -d\\# -f2`";

      "${mod}+d" = "exec rofi -show drun";
      "${mod}+Shift+d" = "exec rofi -show run";
      "${mod}+s" = "exec rofi -show ssh";
      "${mod}+m" = "exec rofimoji";
    };

    focus = {
      wrapping = "no";
      followMouse = false;
      mouseWarping = false;
    };

    fonts = {
      names = [ "VictorMono Nerd Font Mono" ];
      style = "Bold";
      size = 11.0;
    };

    window = {
      titlebar = false;
      border = 4;
    };

    floating = {
      titlebar = true;
      border = 4;
    };

    gaps = {
      smartBorders = "on";
      smartGaps = true;
      inner = 20;
      outer = 0;
    };

    colors = {
      background = bg;
      focused = {
        border = first;
        background = first;
        text = bg;
        indicator = first;
        childBorder = first;
      };
      focusedInactive = {
        border = second;
        background = second;
        text = bg;
        indicator = second;
        childBorder = second;
      };
      unfocused = {
        border = bg;
        background = bg;
        text = fg;
        indicator = bg;
        childBorder = bg;
      };
      urgent = {
        border = urgent;
        background = bg;
        text = urgent;
        indicator = urgent;
        childBorder = urgent;
      };
      placeholder = {
        border = bg;
        background = bg;
        text = second;
        indicator = bg;
        childBorder = bg;
      };
    };

    bars = [];
  };

  xsession.windowManager.i3.extraConfig = ''
    title_align center
  '';
}
