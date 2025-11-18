{ pkgs, lib, ... }:
{
  imports = [
    # ./hardware-configuration.nix
    ../base.nix
    ../modules/octoprint.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [
      "xhci_pci"
      "usbhid"
      "usb_storage"
    ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = "replika";
    networkmanager = {
      enable = true;
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."octo" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:5000";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEnxGHi/ehTxFxEwWSyozesfQL3uX9762NW/YtgKrJw ndrooo@lyoko"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhQKBp+aYcvMtHWUp6X3aUIfglWEl+6LcU/XrqdnWNC ndrooo@kiwi"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPglOw1DK7ANW7k3s2UrpzEzJ11VD9db/9BVc2mdQCsP ndrooo@sanic"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGZNQgC/US8O4Pb0c61fUsPr8OVpCAEWjr/i8QtJnjq6 ndrooo@lyoko-win"
    ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  hardware.enableRedistributableFirmware = true;
}
