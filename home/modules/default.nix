{
  cli = import ./cli.nix;
  graphical = import ./graphical.nix;
  kitty = import ./kitty.nix;
  rofi = import ./rofi;
  fuzzel = import ./fuzzel.nix;
  sway = import ./sway;
  vscode = import ./vscode.nix;
  dunst = {
    xdg.configFile."dunst/dunstrc".source = ./dunstrc;
  };
}
