{ pkgs, ... }: {
  imports = [
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

  services.fprintd.enable = true;

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
}
