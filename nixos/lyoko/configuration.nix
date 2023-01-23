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
    ../graphics.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "lyoko";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    nix = {
      device = "/dev/disk/by-uuid/30b81c9d-b1ab-4eca-97f0-b76443553999";
      preLVM = true;
      allowDiscards = true;
    };
  };

  fileSystems."/papertape" = {
    device = "/dev/disk/by-uuid/7A909141909104B3";
    fsType = "ntfs3";
    options = ["rw" "uid=1000"];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

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
