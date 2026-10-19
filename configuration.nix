{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hyprland-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  
  services.getty.autologinUser = "user";
  services.sshd.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

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
    links
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

