{ inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModule
    ./rofi
    ./polybar
    ./kitty.nix
  ];

  xdg.configFile = {
    "dunst/dunstrc".source = ./dunstrc;
    "zathura/zathurarc".source = ./zathurarc;
  };
}