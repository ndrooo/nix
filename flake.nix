{
  description = "ndrooo nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.darwin.follows = "";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, agenix, nixos-hardware, ... }@inputs: {
    # nixos-rebuild switch --flake .#hostname
    nixosConfigurations.lyoko = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/lyoko/configuration.nix
      ];
    };
    nixosConfigurations.kiwi = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/kiwi/configuration.nix
        nixos-hardware.nixosModules.framework-13-7040-amd
      ];
    };
    nixosConfigurations.xana = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/xana/configuration.nix
      ];
    };
    nixosConfigurations.replika = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/replika/configuration.nix
        nixos-hardware.nixosModules.raspberry-pi-4
      ];
    };

    homeModules = import ./home/modules;
    themes = import ./home/themes;

    # home-manager switch --flake .#hostname
    homeConfigurations.lyoko = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
        pkgs-stable = import nixpkgs-stable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [ ./home/lyoko.nix ];
    };
    homeConfigurations.kiwi = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
        pkgs-stable = import nixpkgs-stable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [ ./home/kiwi.nix ];
    };
    homeConfigurations.xana = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
        pkgs-stable = import nixpkgs-stable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [ ./home/xana.nix ];
    };
    homeConfigurations.replika = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      extraSpecialArgs = {
        inherit inputs;
        pkgs-stable = import nixpkgs-stable {
          system = "aarch64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [ ./home/replika.nix ];
    };
  };
}
