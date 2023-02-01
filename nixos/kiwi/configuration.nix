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

  networking.hostName = "kiwi";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    nix = {
      device = "/dev/disk/by-uuid/e649bf5c-e2e4-4195-ad49-57014efaa1ad";
      preLVM = true;
      allowDiscards = true;
    };
  };

  /*
  environment.etc.crypttab = {
    enable = true;
    text = ''
      selectron UUID=### /root/kiwi.key luks,nofail
    '';
  };

  environment.etc.fstab = {
    enable = true;
    text = ''
      UUID=### /selectron ext4 rw,relatime,nofail 0 2
    '';
  };
  */

  hardware.opengl.enable = true;

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
