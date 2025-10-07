{ pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [];

  environment.systemPackages = with pkgs; [
    firefox
    gparted
    brightnessctl
    rofi
    dunst
    picom
    pulseaudio # for pactl
    wev
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.victor-mono
    nerd-fonts.space-mono
    lexend
    victor-mono
  ];

  services.xserver.enable = true;
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  programs.xwayland.enable = true;
  programs.dconf.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.xserver.desktopManager.xfce.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.windowManager.i3.enable = true;
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.pam.services.swaylock = {};
  ## broken: https://github.com/NixOS/nixpkgs/issues/426046
  # services.redshift = {
  #   enable = true;
  # };
  location.provider = "geoclue2";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.graphics.enable32Bit = true;
}
