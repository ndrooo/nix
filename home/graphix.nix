# Common configuration for graphical hosts regardless of WM

# Note: this currently assumes X11, down the line it might be good to split
# out X11 and Wayland modules.

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