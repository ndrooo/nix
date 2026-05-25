{
  cli = import ./cli.nix;
  gfx = import ./gfx.nix;
  gfx_home = import ./gfx_home.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  sway = import ./sway.nix;
  dunst = { xdg.configFile."dunst/dunstrc".source = ./dunstrc; };
  zathura = { xdg.configFile."zathura/zathurarc".source = ./zathurarc; };
}