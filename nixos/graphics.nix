{ pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [];

  environment.systemPackages = with pkgs; [
    firefox
    gparted
    redshift
    brightnessctl
    rofi
    dunst
    picom
    pulseaudio # for pactl
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.space-mono
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
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.graphics.enable32Bit = true;

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };

}
