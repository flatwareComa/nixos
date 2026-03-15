{config, pkgs, lib, ...}:

{
	imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
	nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
	services.minecraft-server = {
		enable = true;
		eula = true;
		openFirewall = true;
		dataDir = "/mnt/xDrive/minecraftServer";

		servers.fabric =
		{
			package = pkgs.fabricServers.fabric-1_21_1;

			server-port = 25565;
			difficulty = 2;
			gamemode = 0;
			motd = "super awesome epic funtime server";
		};

#		jvm0pts = " -XX: +useZGC -XX: +ZGenerational";
	};
}
