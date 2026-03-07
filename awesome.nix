{config, pkgs, ...}:

{
	services = {

		displayManager = {
			sddm.enable = true;
			defaultSession = "none+awesome";
		};

		xserver = {
			enable = true;
			windowManager = {
				awesome = {
					enable = true;
				};
			};
		};
	};
}
