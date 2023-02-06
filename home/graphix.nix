{ inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModule
    ./rofi
    ./polybar
  ];

  xdg.configFile = {
    "dunst/dunstrc".source = ./dunstrc;
    "zathura/zathurarc".source = ./zathurarc;
  };
}