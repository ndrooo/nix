{ pkgs, ... }: {
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

  networking = {
    hostName = "lyoko";
    networkmanager = {
      enable = true;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    nix = {
      device = "/dev/disk/by-uuid/30b81c9d-b1ab-4eca-97f0-b76443553999";
      preLVM = true;
      allowDiscards = true;
    };
  };

  environment.etc.crypttab = {
    enable = true;
    text = ''
      magdrum UUID=682c9ace-52e0-46e0-9f8e-0ed479d648e1 /root/lyoko.key luks,nofail
    '';
  };

  environment.etc.fstab = {
    enable = true;
    text = ''
      UUID=3239b580-6a8b-4a1f-a9cd-d6a97c3b9f95 /magdrum ext4 rw,relatime,nofail 0 2
    '';
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.xrandrHeads = [
    {
      output = "DP-4.8";
      primary = true;
    }
    {
      output = "DP-4.1.8";
      monitorConfig = "Option \"LeftOf\" \"DP-4.8\"";
    }
  ];
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
