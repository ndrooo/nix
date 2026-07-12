{
  cli = import ./cli.nix;
  graphical = import ./graphical.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  mango = import ./mango;
  sway = import ./sway;
  dunst = {
    xdg.configFile."dunst/dunstrc".source = ./dunstrc;
  };
  zathura = {
    xdg.configFile."zathura/zathurarc".source = ./zathurarc;
  };
}
