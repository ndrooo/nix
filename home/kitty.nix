{ inputs, lib, config, pkgs, ... }:
let
  colors = config.colorScheme.colors;
in {
  programs.kitty.enable = true;

  programs.kitty.font.name = "Victor Mono Nerd Font";
  programs.kitty.settings = {
    confirm_os_window_close = 2;

    window_padding_width = 8;
    placement_strategy = "center";

    mouse_hide_wait = -1;

    cursor_shape = "block";
    cursor_blink_interval = 0;
    disable_ligatures = "cursor";

    enable_audio_bell = false;
    window_alert_on_bell = true;

    url_color = "#${colors.altbg}";
    url_style = "curly";

    cursor = "#${colors.fg}";
    foreground = "#${colors.fg}";
    background = "#${colors.bg}";
    selection_foreground = "#${colors.bg}";
    selection_background = "#${colors.fg}";
    color0  = "#${colors.c0}";
    color8  = "#${colors.c8}";
    color1  = "#${colors.c1}";
    color9  = "#${colors.c9}";
    color2  = "#${colors.c2}";
    color10 = "#${colors.c10}";
    color3  = "#${colors.c3}";
    color11 = "#${colors.c11}";
    color4  = "#${colors.c4}";
    color12 = "#${colors.c12}";
    color5  = "#${colors.c5}";
    color13 = "#${colors.c13}";
    color6  = "#${colors.c6}";
    color14 = "#${colors.c14}";
    color7  = "#${colors.c7}";
    color15 = "#${colors.c15}";
  };
}
