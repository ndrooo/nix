{ pkgs, ... }:
{
  # You can import other NixOS modules here
  imports = [ ];

  environment.systemPackages = with pkgs; [
    firefox
    chromium
    gparted
    brightnessctl
    rofi
    dunst
    pulseaudio # for pactl
    wev
    resources
    baobab
    thunar
    kitty
    solaar
    mpv
    vlc
    feh
    playerctl
    lxappearance
    proton-vpn
    lxqt.lxqt-policykit
    swayidle
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.victor-mono
    nerd-fonts.space-mono
    lexend
    victor-mono
    fraunces
    atkinson-hyperlegible
    atkinson-hyperlegible-mono
    atkinson-hyperlegible-next
  ];

  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "ndrooo";
  };
  services.xserver.enable = true;
  programs.xwayland.enable = true;
  programs.dconf.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
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
  security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };
  ## broken: https://github.com/NixOS/nixpkgs/issues/426046
  # services.redshift = {
  #   enable = true;
  # };
  location.provider = "geoclue2";

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.winbox = {
    enable = true;
    openFirewall = true;
    package = pkgs.winbox4;
  };

  hardware.graphics.enable32Bit = true;
}
