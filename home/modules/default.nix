{
  cli = import ./cli.nix;
  gfx = import ./gfx.nix;
  gfx_home = import ./gfx_home.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  polybar = import ./polybar;
  i3 = import ./i3.nix;
  firefox_webapp = import ./firefox_webapp.nix;
  dunst = { xdg.configFile."dunst/dunstrc".source = ./dunstrc; };
  zathura = { xdg.configFile."zathura/zathurarc".source = ./zathurarc; };
}