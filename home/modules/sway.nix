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
  term = "kitty";
in {
  imports = [
    inputs.nix-colors.homeManagerModule
  ];

  home.pointerCursor = {
    name = "Rose Pine";
    package = pkgs.rose-pine-cursor;
    size = 48;
  };

  home.packages = [
    pkgs.waypaper
    pkgs.swaybg
    pkgs.grim
    pkgs.slurp
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };

  programs.swaylock.enable = true;
  programs.swaylock.settings = {
    color = "${bg}";
    font-size = 24;
    indicator-idle-visible = false;
    indicator-radius = 100;
    show-failed-attempts = true;
    ignore-empty-password = true;
    ring-color = "${primary}";
    key-hl-color = "${primary}";
    bs-hl-color = "${urgent}";
  };

  programs.waybar.enable = true;
  programs.waybar.settings.main = {
    layer = "top";
    position = "bottom";
    modules-left = ["clock"];
    modules-center = ["sway/workspaces"];
    modules-right = ["pulseaudio" "battery" "tray"];
    "sway/workspaces" = {
      disable-scroll = true;
    };
    "clock" = {
      format = "{:%I.%M | %m-%d}";
    };
    "pulseaudio" = {
      format = "{icon} {volume}";
      format-muted = "󰸈 MU";
      format-icons = ["󰕿" "󰖀" "󰕾"];
    };
    "battery" = {
      format = "{icon} {capacity}";
      format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };
    "tray" = { spacing = 10; };
  };
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: CaskaydiaCove Nerd Font Mono;
    }
    window#waybar {
      background: ${bg};
      color: ${fg};
    }
    #workspaces button {
      color: ${dimmed};
    }
    #workspaces button.focused {
      color: ${fg};
    }
    .module {
      padding: 5px 10px;
    }
  '';

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    config = {
      modifier = mod;
      terminal = term;
      startup = [
        { command = "waypaper --restore"; }
        { command = "systemctl --user restart waybar"; always = true; }
      ];
      keybindings = {
        "${mod}+Return" = "exec ${term}";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+e" = "exit";
        "${mod}+Shift+s" = "exec systemctl suspend";
        "${mod}+z" = "exec swaylock";

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
        "${mod}+e" = "layout tabbed";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+a" = "focus parent";

        "${mod}+Control+h" = "resize grow left 2px or 2ppt";
        "${mod}+Control+j" = "resize grow down 2px or 2ppt";
        "${mod}+Control+k" = "resize grow up 2px or 2ppt";
        "${mod}+Control+l" = "resize grow right 2px or 2ppt";

        "${mod}+q" = "kill";
        # "${mod}+Shift+q" = "exec xkill -id `xprop -root _NET_ACTIVE_WINDOW | cut -d\\# -f2`";

        "${mod}+d" = "exec rofi -show drun";
        "${mod}+Shift+d" = "exec rofi -show run";
        "${mod}+s" = "exec rofi -show ssh";
        "${mod}+m" = "exec rofimoji";

        "${mod}+c" = "exec grim -g \"$(slurp)\"";
        # "${mod}+g" = "exec wmfocus";
      };

      focus = {
        wrapping = "no";
        followMouse = false;
        mouseWarping = false;
      };

      fonts = {
        names = [ "CaskaydiaCove Nerd Font Mono" ];
        size = 9.0;
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

      seat = {
        "*" = {
          xcursor_theme = "Adwaita 22";
        };
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
  };
}