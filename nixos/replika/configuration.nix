{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    ../modules/octoprint.nix
  ];

  fileSystems = {
    "/" = {
      options = [ "noatime" ];
    };
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
