{ inputs, pkgs, config, ... }:
with config.colorScheme.colors;
let
  bg = "#${config.colorScheme.colors.bg}";
  fg = "#${config.colorScheme.colors.fg}";
  altbg = "#${config.colorScheme.colors.altbg}";
  altfg = "#${config.colorScheme.colors.altfg}";
  ac = "#${config.colorScheme.colors.primary}";
  urgent = "#${config.colorScheme.colors.urgent}";
  blue = "#${config.colorScheme.colors.c12}";
  green = "#${config.colorScheme.colors.c11}";
  red = "#${config.colorScheme.colors.c9}";
  magenta = "#${config.colorScheme.colors.c14}";
in {
  imports = [
    inputs.nix-colors.homeManagerModule
  ];

  xdg.configFile = {
    "polybar/bars.ini".source = ./bars.ini;
    "polybar/modules.ini".source = ./modules.ini;
    "polybar/user_modules.ini".source = ./user_modules.ini;
  };

  services.polybar.enable = true;
  services.polybar.package = pkgs.polybar.override {
    i3Support = true;
    pulseSupport = true;
  };
  services.polybar.config = {
    color = {
      inherit bg fg altbg ac urgent blue green red magenta;
    };
  };
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}