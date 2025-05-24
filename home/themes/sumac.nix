let
  bg = "0a0a0a";
  fg = "cccccc";

  # black
  c0 =  "222222";
  c8 =  "292929";

  # red
  c1 =  "91534f";
  c9 =  "b38375";

  # green
  c2 =  "627756";
  c10 = "759164";

  # yellow
  c3 =  "916b4f";
  c11 = "b39e75";

  # blue
  c4 =  "3a5862";
  c12 = "527d8b";

  # magenta
  c5 =  "3e3f62";
  c13 = "706b9f";

  # cyan
  c6 =  "3a625b";
  c14 = "518a81";

  # white
  c7 =  "999999";
  c15 = "bababa";
in {
  colorScheme = {
    slug = "sumac";
    name = "Sumac";
    author = "a.ndr.ooo";
    palette = {
      inherit fg bg c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15;

      primary = c6;
      secondary = c10;
      tertiary = c12;
      urgent = c5;
      dimmed = c8;
      altbg = c0;
      altfg = bg;
    };
  };
}
