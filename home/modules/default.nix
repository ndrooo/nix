{
  cli = import ./cli.nix;
  graphical = import ./graphical.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  sway = import ./sway;
  vscode = import ./vscode.nix;
  dunst = {
    xdg.configFile."dunst/dunstrc".source = ./dunstrc;
  };
  zathura = {
    xdg.configFile."zathura/zathurarc".source = ./zathurarc;
  };
}
