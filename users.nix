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

}
