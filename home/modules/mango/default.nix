{
  programs.hyprlock.enable = true;

  xdg.configFile = {
    "mango/config.conf".source = ./config.conf;
    "mango/waybar.jsonc".source = ./waybar.jsonc;
    "mango/waybar.css".source = ./waybar.css;
    "mango/launch.sh".source = ./launch.sh;
    "mango/hyprlock.conf".source = ./hyprlock.conf;
    "mango/swayidle".source = ./swayidle;
  };
}