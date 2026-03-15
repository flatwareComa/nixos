{config, pkgs, ...}:
{	
	users.users.nixos = 
	{
		isNormalUser = true;
		extraGroups= [ "networkmanager" "wheel" ];
		packages = with pkgs; 
		[

		];
	};

	users.users.plex =
	{
		isSystemUser = true;
		extraGroups = [ "media" ];
	};

}
