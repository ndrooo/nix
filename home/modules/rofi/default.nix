{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModule
  ];

  home.packages = with pkgs; [
    rofimoji
  ];

  xdg.configFile = {
    "rofi/config.rasi".source = ./config.rasi;
    "rofi/theme.rasi".source = ./theme.rasi;
  };
}