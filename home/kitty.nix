{ inputs, lib, config, pkgs, ... }: {
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

    url_color = "#4d4d4d";
    url_style = "curly";

    cursor = "#e0def4";
    foreground = "#e0def4";
    background = "#101010";
    selection_foreground = "#101010";
    selection_background = "#e0def4";
    color0  = "#3d3d3d";
    color8  = "#4d4d4d";
    color1  = "#6673bf";
    color9  = "#899aff";
    color2  = "#52ad91";
    color10 = "#48bca7";
    color3  = "#98c9bb";
    color11 = "#b0ead9";
    color4  = "#31658c";
    color12 = "#477ab3";
    color5  = "#596196";
    color13 = "#7882bf";
    color6  = "#8292b2";
    color14 = "#95a7cc";
    color7  = "#c8cacc";
    color15 = "#edeff2";
  };
}
