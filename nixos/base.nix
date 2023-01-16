{ inputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nushell
    zsh
    antibody
    bat
    exa
    vim
    neovim
    tmux
    wget
    git
    curl
    pciutils
    stow
    bottom
    ranger
    efibootmgr
  ];

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

      substituters = ["https://hyperland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11"; # Did you read the comment?
}
