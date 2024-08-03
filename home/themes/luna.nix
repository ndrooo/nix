let
  bg = "101010";
  fg = "e0def4";

  # black
  c0 =  "2d2d2d";
  c8 =  "3d3d3d";

  # red
  c1 =  "6673bf";
  c9 =  "899aff";

  # green
  c2 =  "52ad91";
  c10 = "48bca7";

  # yellow
  c3 =  "98c9bb";
  c11 = "b0ead9";

  # blue
  c4 =  "31658c";
  c12 = "477ab3";

  # magenta
  c5 =  "596196";
  c13 = "7882bf";

  # cyan
  c6 =  "8292b2";
  c14 = "95a7cc";

  # white
  c7 =  "c8cacc";
  c15 = "edeff2";
in {
  colorScheme = {
    slug = "luna";
    name = "Luna";
    author = "Modified from gitlab.com/SamDenton/dots";
    palette = {
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