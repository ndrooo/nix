{ inputs, lib, config, pkgs, ... }:

let
  mod = "Mod4";
  bg = "#121212";
  fg = "#f3e2ec";
  second = "#444444";
  first = "#ca9ee9";
  urgent = "#ca9ee9";
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

      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";
      "${mod}+6" = "workspace number 6";
      "${mod}+7" = "workspace number 7";
      "${mod}+8" = "workspace number 8";
      "${mod}+9" = "workspace number 9";
      "${mod}+0" = "workspace number 10";

      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";
      "${mod}+Shift+9" = "move container to workspace number 9";
      "${mod}+Shift+0" = "move container to workspace number 10";
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
