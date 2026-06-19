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
    ../graphical.nix
    ../virtualization.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "kiwi";
    firewall.checkReversePath = false;
    networkmanager.enable = true;
  };

  services.fwupd.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    nix = {
      device = "/dev/disk/by-uuid/e649bf5c-e2e4-4195-ad49-57014efaa1ad";
      preLVM = true;
      allowDiscards = true;
    };
  };
  # Get fix for bluetooth issue early
  # https://bugzilla.kernel.org/show_bug.cgi?id=221521
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    chromium
    xbacklight
  ];

  services.xserver.dpi = 144;

  services.joycond.enable = true;
}
