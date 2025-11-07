{ config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../base.nix
    ../modules/omada.nix
    ../modules/plex.nix
    ../modules/torrent.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems = {
    "/" = {
      options = [ "noatime" ];
    };
  };

  environment.etc.fstab = {
    enable = true;
    text = ''
      UUID=52030d99-d654-4516-aea4-ba33d174882c /twistor ext4 rw,relatime,nofail 0 2
    '';
  };

  age.identityPaths = ["/root/.ssh/id_ed25519"];
  age.secrets.ddclient.file = ../../secrets/ddclient.age;

  services.ddclient = {
    enable = true;
    configFile = config.age.secrets.ddclient.path;
  };

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
    extraGroups = [ "wheel" "podman" ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEnxGHi/ehTxFxEwWSyozesfQL3uX9762NW/YtgKrJw ndrooo@lyoko"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhQKBp+aYcvMtHWUp6X3aUIfglWEl+6LcU/XrqdnWNC ndrooo@kiwi"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPglOw1DK7ANW7k3s2UrpzEzJ11VD9db/9BVc2mdQCsP ndrooo@sanic"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGZNQgC/US8O4Pb0c61fUsPr8OVpCAEWjr/i8QtJnjq6 ndrooo@lyoko-win"
    ];
  };

  hardware.enableRedistributableFirmware = true;
}
