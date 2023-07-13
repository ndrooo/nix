{
  cli = import ./cli.nix;
  gfx = import ./gfx.nix;
  gfx_home = import ./gfx_home.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  polybar = import ./polybar;
  hypr = import ./hypr.nix;
  i3 = import ./i3.nix;
  dunst = { xdg.configFile."dunst/dunstrc".source = ./dunstrc; };
  zathura = { xdg.configFile."zathura/zathurarc".source = ./zathurarc; };
}