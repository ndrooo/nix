{ pkgs, inputs, ... }:
{
  # You can import other NixOS modules here
  imports = [ ];

  environment.systemPackages = with pkgs; [
    firefox
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
    pavucontrol
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

  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "sway";
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
  security.pam.services = {
    hyprlock.enableGnomeKeyring = true;
  };
  location.provider = "geoclue2";

  xdg.portal.wlr.enable = true;
  xdg.portal.wlr.settings.screencast = {
    output_name = "eDP-1";
    max_fps = 30;
    chooser_type = "simple";
    chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
  };

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
