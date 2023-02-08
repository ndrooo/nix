{
  description = "ndrooo nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, nix-colors, ... }@inputs: {
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

    homeModules = import ./home/modules;

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
  };
}
