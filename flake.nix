{
  description = "ndrooo nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.darwin.follows = "";
  };

  outputs = { nixpkgs, home-manager, hyprland, agenix, ... }@inputs: {
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
      ];
    };
    nixosConfigurations.xana = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/xana/configuration.nix
      ];
    };

    homeModules = import ./home/modules;
    themes = import ./home/themes;

    # home-manager switch --flake .#hostname
    homeConfigurations.lyoko = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./home/lyoko.nix ];
    };
    homeConfigurations.kiwi = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./home/kiwi.nix ];
    };
    homeConfigurations.xana = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux; # TODO: fix
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./home/xana.nix ];
    };
  };
}
