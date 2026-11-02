{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nbfc.nix
    ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.binfmt.emulatedSystems = [ "armv7l-linux" "aarch64-linux" ];

  fileSystems."/mnt/external" = {
	device = "/dev/sda1";
	fsType = "exfat";
	options = [
		"nofail"
	];
  };
#  fileSystems."/mnt/windrive" = {
#	device = "/dev/nvme0n1p2";
#	fsType = "ntfs3";
#	options = [
#		"nofail"
#	];
#  };

  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;

  networking.hostName = "hyprland-btw";
  networking.networkmanager.enable = true;

  services.udev.extraRules = ''
  	ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="1a2c", ATTRS{idProduct}=="9605", ATTR{power/control}="on"
	'';

  time.timeZone = "Europe/Kyiv";
  
  services.cloudflare-warp.enable = true;
  services.getty.autologinUser = "user";
  services.kanata = {
	enable = true;
	keyboards.main = {
		configFile = ./misc/kanata.kbd;
	};
  };
  services.flatpak.enable = true;
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
	withUWSM = false;
  };
  

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.extraConfig = {
      "10-disable-hfp-autoswitch" = {
        "wireplumber.settings" = {
          "bluetooth.autoswitch-to-headset-profile" = false;
        };
      };
    };
  };

  services.libinput.enable = true;
  xdg.portal = {
	enable = true;
	extraPortals = [
		pkgs.xdg-desktop-portal-hyprland
		pkgs.xdg-desktop-portal-gtk
	];
  };
  hardware.graphics = {
	enable = true;
	enable32Bit = true;
  };
  hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
	settings = {
		General = {
			Enable = "Source,Sink,Media,Socket";
			Experimental = true;
		};
	};
  };
  services.blueman.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
	modesetting.enable = true;
	powerManagement.enable = false;
	powerManagement.finegrained = false;
	open = true;
	nvidiaSettings = true;
	package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  users.users.user = {
    isNormalUser = true;
    packages = with pkgs; [
      tree
    ];
    extraGroups = [
	"wheel"
	"input"
	"uinput"
    ];
  };

#  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
	neovim
	wget
	thunar
	git
	nix-your-shell
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh.enable = true;
  networking.firewall.enable = false;
  
  nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "materialgram-7.0.5.1"
	"materialgram-unwrapped-7.0.5.1"
      ];
    };

  system.stateVersion = "26.05"; 	
}

