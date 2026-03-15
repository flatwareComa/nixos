{config, ...}:
{
	services.jellyfin =
	{
		enable = true;
		openFirewall = true;
		user = "plex";
	};
}
