{ inputs, config, pkgs, ... }:

with config.colorScheme.colors;
let
  mod = "Mod4";
  bg = "#${config.colorScheme.colors.bg}";
  fg = "#${config.colorScheme.colors.fg}";
  altbg = "#${config.colorScheme.colors.altbg}";
  altfg = "#${config.colorScheme.colors.altfg}";
  dimmed = "#${config.colorScheme.colors.dimmed}";
  primary = "#${config.colorScheme.colors.primary}";
  urgent = "#${config.colorScheme.colors.urgent}";
  terminal = "kitty";
in {
  imports = [
    inputs.nix-colors.homeManagerModule
    ./polybar
    ./rofi
    ./flameshot.nix
    (import ./default.nix).dunst
  ];

  home.packages = [ pkgs.wmfocus ];

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

      "${mod}+c" = "exec flameshot gui";
      "${mod}+g" = "exec wmfocus";
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
      commands = [
        {
          command = "border pixel 4";
          criteria = {
            class = "^.*";
          };
        }
      ];
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
        border = primary;
        background = primary;
        text = bg;
        indicator = primary;
        childBorder = primary;
      };
      focusedInactive = {
        border = altbg;
        background = altbg;
        text = altfg;
        indicator = altbg;
        childBorder = altbg;
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
        text = dimmed;
        indicator = bg;
        childBorder = bg;
      };
    };

    bars = [];
  };

  xsession.windowManager.i3.extraConfig = ''
    title_align center
  '';

  services.picom.enable = true;
  services.picom.backend = "glx";
  services.picom.settings = {
    corner-radius = 4.0;
    rounded-corners-exclude = [
      "class_g = 'Polybar'"
      "fullscreen"
      "class_g = 'i3-frame'"
      "_PICOM_ROUNDED@:32c = 1"
    ];
    shadow = true;
    shadow-radius = 15;
    shadow-offset-x = -7;
    shadow-offset-y = -7;
    shadow-opacity = 0.3;
    shadow-exclude = [
        "class_g = 'Polybar'"
        "fullscreen"
        "class_g = 'i3-frame'"
        "_PICOM_ROUNDED@:32c = 1"
    ];
  };
}
