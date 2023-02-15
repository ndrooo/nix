{
  cli = import ./cli.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  polybar = import ./polybar;
  i3 = import ./i3.nix;
  dunst = { xdg.configFile."dunst/dunstrc".source = ./dunstrc; };
  zathura = { xdg.configFile."zathura/zathurarc".source = ./zathurarc; };
}