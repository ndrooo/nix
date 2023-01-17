{ inputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ../base.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "lyoko";

  environment.systemPackages = with pkgs; [
    ntfs3g
    nitrogen
    alacritty
    kitty
    redshift
    rofi
    polybar
    dunst
    home-manager
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    nix = {
      device = "/dev/disk/by-uuid/30b81c9d-b1ab-4eca-97f0-b76443553999";
      preLVM = true;
      allowDiscards = true;
    };
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.windowManager.bspwm = {
    enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.picom.enable = true;

  programs.hyprland.enable = true;

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
      firefox
      vscode
      _1password-gui
      signal-desktop
      protonvpn-gui
      xfce.thunar
      baobab
      discord
      notion-app-enhanced
      spotify
      steam
      protonvpn-gui
      # itch: running off an EOLed Electron version?
    ];
  };
}
