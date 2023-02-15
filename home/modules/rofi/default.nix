{ inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModule
  ];

  xdg.configFile = {
    "rofi/config.rasi".source = ./config.rasi;
    "rofi/theme.rasi".source = ./theme.rasi;
  };
}