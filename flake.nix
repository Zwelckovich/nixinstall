{
	description = "Zwelchs NixOS Flake";

	nixConfig = {
		experimental-features = [ "nix-command" "flakes" ];
		substituters = [
			"https://cache.nixos.org/"
		];
	};

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# Helix Editor
		helix.url = "github:helix-editor/helix/23.05";
	};

	outputs = { self, nixpkgs, home-manager, ...}@inputs: {
		nixosConfigurations = {
			# TODO please change the hostname to your own
			"zwelchnix" = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = inputs;
				modules = [
					./.

					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;

						# TODO replace with your own username
						home-manager.users.zwelch = import ./home.nix;
					}
				];
			};
		};
	};
}
