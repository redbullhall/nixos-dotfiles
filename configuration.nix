{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  networking.hostName = "hyprland-btw";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  services.power-profiles-daemon.enable = true;
  services.fstrim.enable = true;

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  time.timeZone = "Europe/London";
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.getty.autologinUser = "user";
  services.sshd.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = false;
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    glibc
  ];

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
  xdg.portal = {
	enable = true;
	extraPortals = [
		pkgs.xdg-desktop-portal-hyprland
		pkgs.xdg-desktop-portal-gtk
	];
	config.common.default = ["hyprland" "gtk"];
  };
  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	jack.enable = true;
	pulse.enable = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    foot
    kitty
    waybar
    git
    hyprpaper
    fastfetch
    dysk
    python3
    links2
    nbfc-linux
    (writeShellApplication {
    	name = "ns";
	runtimeInputs = with pkgs; [
		fzf
		nix-search-tv
	];
	text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nix.channel.enable = false;

  system.stateVersion = "26.05"; 
}

