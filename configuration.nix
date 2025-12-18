{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "DAUGHTER"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
networking.networkmanager.enable = true;
nixpkgs.config.allowUnfree = true;

networking.firewall.checkReversePath = false;

# Set your time zone.
time.timeZone = "Europe/London";

# Select internationalisation properties.
i18n.defaultLocale = "en_GB.UTF-8";

i18n.extraLocaleSettings = {
	LC_ADDRESS = "en_GB.UTF-8";
	LC_IDENTIFICATION = "en_GB.UTF-8";
	LC_MEASUREMENT = "en_GB.UTF-8";
	LC_MONETARY = "en_GB.UTF-8";
	LC_NAME = "en_GB.UTF-8";
	LC_NUMERIC = "en_GB.UTF-8";
	LC_PAPER = "en_GB.UTF-8";
	LC_TELEPHONE = "en_GB.UTF-8";
	LC_TIME = "en_GB.UTF-8";
};

services = {
	xserver = {
		enable = true;
		displayManager.gdm.enable = true;
		desktopManager.gnome.enable = true;
		xkb = {
			layout = "gb";
			variant = "";
		};
		libinput.enable = true;
	};

	printing = {
		enable = true;
	};

	pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
	};

	flatpak = {
		enable = true;
	};
};

# Configure console keymap
console.keyMap = "uk";

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.kas = {
	isNormalUser = true;
	description = "kas";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [
		
	];
};

nixpkgs.config.permittedInsecurePackages = [
                "electron-36.9.5"
              ];

# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	firefox
	protonvpn-gui
	vlc
	git
	prismlauncher
	anki
	webcord
	qbittorrent
	joplin-desktop
	alacritty
	mpv
	cmatrix
	steam
	wineWowPackages.waylandFull
	winetricks
	lutris
	inkscape
	gimp
	wireguard-tools
	libreoffice-qt-fresh
	libgcc
];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
programs.mtr.enable = true;
programs.gnupg.agent = {
	enable = true;
	enableSSHSupport = true;
};

system.stateVersion = "25.05"; # Did you read the comment?

}
