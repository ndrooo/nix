{ inputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    inputs.agenix.nixosModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    nushell
    zsh
    antibody
    bat
    eza
    vim
    neovim
    tmux
    wget
    git
    curl
    zip unzip
    direnv
    pciutils
    stow
    inputs.agenix.packages."${system}".default
    bottom
    ranger
    efibootmgr
    home-manager
    python3
    libnotify
    neofetch
    # for terminfo
    kitty
  ];

  services.locate.enable = true;
  
  programs.fish.enable = true;

  programs.vim = {
    enable = true;
    defaultEditor = true;
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

  users.defaultUserShell = pkgs.nushell;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11"; # Did you read the comment?
}
