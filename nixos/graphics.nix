{ pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [];

  environment.systemPackages = with pkgs; [
    firefox
    redshift
    brightnessctl
    rofi
    dunst
    picom
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["VictorMono" "SpaceMono"]; })
    lexend
    victor-mono
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.windowManager.i3.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.opengl.driSupport32Bit = true;

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };

}
