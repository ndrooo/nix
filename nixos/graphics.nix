{ inputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [];

  environment.systemPackages = with pkgs; [
    nitrogen
    alacritty
    kitty
    redshift
    rofi rofimoji
    xdotool
    (polybar.override { i3Support = true; pulseSupport = true; })
    dunst
    picom
    vscode
    firefox
    lxappearance
    xfce.thunar
    baobab
    feh
    mpv
    darktable
    godot
    spotify
    protonvpn-gui
    _1password-gui
    signal-desktop
    discord
    notion-app-enhanced
    zathura
    # itch: running off an EOLed Electron version?
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = ["VictorMono" "SpaceMono"]; })
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
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

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };

}