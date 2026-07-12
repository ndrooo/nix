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
        proxyWebsockets = true;
      };
    };
    virtualHosts."octo.replika.local" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:5000";
        proxyWebsockets = true;
      };
    };
    virtualHosts."sync.replika.local" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:8384";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
    8384
  ];

  users.users.ndrooo.linger = true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  hardware.enableRedistributableFirmware = true;
}
