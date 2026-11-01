{
	description = "Hyprland on Nixos";
	inputs = {
		nixpkgs-old.url = "github:NixOS/nixpkgs/81a3b1f4c056";
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, nixpkgs-old, ...}@inputs: {
		nixosConfigurations.hyprland-btw = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						extraSpecialArgs = { inherit inputs; };
						users.user = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	};
}
