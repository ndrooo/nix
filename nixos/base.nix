{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    inputs.agenix.nixosModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages =
    (with pkgs; [
      nushell
      bat
      eza
      file
      neovim
      tmux
      wget
      git
      jujutsu
      curl
      zip
      unzip
      unrar
      zstd
      direnv
      pciutils
      dnsutils
      stow
      bottom
      efibootmgr
      home-manager
      python3
      libnotify
      fastfetch
      ntfs3g
      libwebp
      dmidecode
      traceroute
      nil
      nixfmt
      proton-vpn-cli
      wireguard-tools
      # for terminfo
      kitty
    ])
    ++ [
      inputs.zmx.packages."${pkgs.system}".default
      inputs.agenix.packages."${pkgs.system}".default
    ];

  services.locate.enable = true;

  programs.fish.enable = true;

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  programs.nix-ld.enable = true;

  virtualisation.oci-containers = {
    backend = "podman";
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  services.syncthing.openDefaultPorts = true;

  users.defaultUserShell = pkgs.nushell;

  users.users.ndrooo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "podman"
      "syncthing"
    ];
    shell = pkgs.nushell;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhQKBp+aYcvMtHWUp6X3aUIfglWEl+6LcU/XrqdnWNC ndrooo@kiwi"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPglOw1DK7ANW7k3s2UrpzEzJ11VD9db/9BVc2mdQCsP ndrooo@sanic"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGZNQgC/US8O4Pb0c61fUsPr8OVpCAEWjr/i8QtJnjq6 ndrooo@lyoko-win"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNFduZVzZWQK7zP8ji/+nqwF4YsTEwLOY1ZoOdr4Up7 ndrooo@lyoko"
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11"; # Did you read the comment?
}
