{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-stable";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = inputs@{ self, nixpkgs, nix-minecraft, ... }: {

	nixosConfiguration."MOTHER" = nixpkgs.lib.nixosSystem {

		system = "arm64-linux";
		modules = [
			./configuration.nix
			./minecraft.nix
			nix-minecraft.nixosModules.minecraft-servers
			{
				nixpkgs.overlays = [inputs.nix-minecraft.overlay];
			}
		];

	};

  };
}
