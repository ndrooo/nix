{
  description = "ndrooo nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    # nixos-rebuild --flake .#your-hostname
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

    # home-manager --flake .#your-username@your-hostname
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
