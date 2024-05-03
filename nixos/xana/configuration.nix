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
    ../server.nix
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      options = [ "noatime" ];
    };
  };
  
  age.identityPaths = ["/etc/ssh/id_ed25519"];

  networking = {
    hostName = "xana";
    networkmanager = {
      enable = true;
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.nushell;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEnxGHi/ehTxFxEwWSyozesfQL3uX9762NW/YtgKrJw ndrooo@lyoko"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhQKBp+aYcvMtHWUp6X3aUIfglWEl+6LcU/XrqdnWNC ndrooo@kiwi"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPglOw1DK7ANW7k3s2UrpzEzJ11VD9db/9BVc2mdQCsP ndrooo@sanic"
    ];
  };

  hardware.enableRedistributableFirmware = true;
}
