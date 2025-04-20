{ config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ../base.nix
    ../dev.nix
    ../graphics.nix
    ../virtualization.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "kiwi";
    firewall.checkReversePath = "loose";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    nix = {
      device = "/dev/disk/by-uuid/e649bf5c-e2e4-4195-ad49-57014efaa1ad";
      preLVM = true;
      allowDiscards = true;
    };
  };

  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    chromium
  ];

  services.xserver.dpi = 144;

  services.joycond.enable = true;

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.nushell;
  };
}
