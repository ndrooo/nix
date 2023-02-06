{ config, ... }:
let
  bg = "1e1e2e";
  fg = "cdd6f4";

  # black
  c0 =  "45475a";
  c8 =  "585b70";

  # red
  c1 =  "f38ba8";
  c9 =  "f38ba8";

  # green
  c2 =  "a6e3a1";
  c10 = "a6e3a1";

  # yellow
  c3 =  "f9e2af";
  c11 = "f9e2af";

  # blue
  c4 =  "89b4fa";
  c12 = "89b4fa";

  # magenta
  c5 =  "f5c2e7";
  c13 = "f5c2e7";

  # cyan
  c6 =  "94e2d5";
  c14 = "94e2d5";

  # white
  c7 =  "bac2de";
  c15 = "a6adc8";
in {
  colorScheme = {
    slug = "mocha";
    name = "Catppuccin Mocha";
    author = "github.com/catppuccin";
    colors = {
      inherit fg bg c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15;

      primary = c13;
      secondary = c10;
      tertiary = c12;
      urgent = c5;
      dimmed = c8;
      altbg = c0;
      altfg = bg;
    };
  };
}