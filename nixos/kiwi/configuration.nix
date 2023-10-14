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
    ../graphics.nix
    ./hardware-configuration.nix
  ];


  age.identityPaths = ["/etc/ssh/id_ed25519"];
  networking = {
    hostName = "kiwi";
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

  environment.etc.crypttab = {
    enable = true;
    text = ''
      selectron UUID=4f94671e-2b0f-47f9-b1bc-e42653a1d5f0 /root/kiwi.key luks,nofail
    '';
  };

  environment.etc.fstab = {
    enable = true;
    text = ''
      UUID=08f1112e-fbc0-4f3e-9a6a-cd5c562d92fd /selectron ext4 rw,relatime,nofail,x-systemd.device-timeout=100ms 0 2
    '';
  };

  hardware.opengl.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    flutter
  ];

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
