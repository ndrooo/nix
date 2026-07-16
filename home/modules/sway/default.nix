{
  inputs,
  config,
  pkgs,
  ...
}:

let
  mod = "Mod4";
  bg = "#${config.colorScheme.palette.bg}";
  fg = "#${config.colorScheme.palette.fg}";
  altbg = "#${config.colorScheme.palette.altbg}";
  altfg = "#${config.colorScheme.palette.altfg}";
  dimmed = "#${config.colorScheme.palette.dimmed}";
  primary = "#${config.colorScheme.palette.primary}";
  urgent = "#${config.colorScheme.palette.urgent}";
  term = "kitty";
in
{
  imports = [
    inputs.nix-colors.homeManagerModule
    (import ../default.nix).dunst
    (import ../default.nix).rofi
  ];

  xdg.configFile = {
    "sway/waybar.jsonc".source = ./waybar.jsonc;
    "sway/waybar.css".source = ./waybar.css;
    "sway/hyprlock.conf".source = ./hyprlock.conf;
    "sway/swayidle".source = ./swayidle;
    "sway/rofi-ws.sh" = {
      source = ./rofi-ws.sh;
      executable = true;
    };
    "sway/rofi-ws-move.sh" = {
      source = ./rofi-ws-move.sh;
      executable = true;
    };
    "sway/scratchpad.sh" = {
      source = ./scratchpad.sh;
      executable = true;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Rose Pine";
    package = pkgs.rose-pine-cursor;
    size = 48;
  };

  home.packages = [
    pkgs.waybar
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
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    style.name = "gtk2";
  };

  programs.hyprlock.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    systemd.variables = [ "--all" ];
    xwayland = true;
    config = {
      modifier = mod;
      terminal = term;
      startup = [
        { command = "waypaper --restore"; }
        {
          command = "pkill --signal SIGUSR2 waybar";
          always = true;
        }
        { command = "waybar -c ~/.config/sway/waybar.jsonc -s ~/.config/sway/waybar.css"; }
      ];
      keybindings = {
        "${mod}+Return" =
          "exec --no-startup-id bash ~/.config/sway/scratchpad.sh -t -acc -d 60%x70% -- kitty";
        "${mod}+Shift+Return" = "exec ${term}";
        "${mod}+t" =
          "exec --no-startup-id bash ~/.config/sway/scratchpad.sh -t -acc -d 60%x80% -- todoist-electron";

        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+e" = "exit";
        "${mod}+Shift+s" = "exec systemctl suspend";
        "${mod}+z" = "exec hyprlock -c ~/.config/sway/hyprlock.conf";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Control+h" = "resize grow left 2px or 2ppt";
        "${mod}+Control+j" = "resize grow down 2px or 2ppt";
        "${mod}+Control+k" = "resize grow up 2px or 2ppt";
        "${mod}+Control+l" = "resize grow right 2px or 2ppt";

        "${mod}+comma" = "workspace prev";
        "${mod}+period" = "workspace next";
        "${mod}+Shift+comma" = "workspace prev";
        "${mod}+Shift+period" = "workspace next";

        "${mod}+BackSpace" = "focus mode_toggle";
        "${mod}+Shift+BackSpace" = "floating toggle";

        "${mod}+Space" = "exec dunstctl close-all";

        "${mod}+r" = "layout toggle split";
        "${mod}+e" = "layout tabbed";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+a" = "focus parent";

        "${mod}+q" = "kill";

        "${mod}+d" = "exec rofi -show drun";
        "${mod}+Shift+d" = "exec rofi -show run";
        "${mod}+s" = "exec rofi -show ssh";
        "${mod}+m" = "exec rofimoji";
        "${mod}+semicolon" = "exec rofi -modes \"Workspaces:~/.config/sway/rofi-ws.sh\" -show Workspaces";
        "${mod}+Shift+semicolon" =
          "exec rofi -modes \"Move to workspace:~/.config/sway/rofi-ws-move.sh\" -show \"Move to workspace\"";

        "${mod}+c" = "exec grim -g \"$(slurp)\"";
      };

      focus = {
        wrapping = "no";
        followMouse = false;
        mouseWarping = false;
        newWindow = "focus";
      };

      fonts = {
        names = [ "Fraunces" ];
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
          text = fg;
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

      bars = [ ];
    };
  };
}
