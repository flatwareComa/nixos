{
  description = "A very basic flake";

  inputs = {
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  };

  outputs = inputs@{ self, nixpkgs, nix-minecraft, ...}: {

	nixosConfigurations."edi" = nixpkgs.lib.nixosSystem {
		system = "aarch64-linux";
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
