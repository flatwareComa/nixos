{config, ...}:

{
	services.syncthing = {
		enable = true;
		openDefaultPorts = true;
		user = "nixos";
		group = "wheel";
		overrideDevices = true;
		overrideFolders = true;
	};
	
	networking.firewall.allowedTCPPorts = [ 8384 ];
}
