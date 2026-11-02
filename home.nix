{ config, pkgs, lib, inputs, ...}:
{
	imports = [
		./modules
	];
	home.username = "user";
	home.homeDirectory = "/home/user";
	home.stateVersion = "26.05";
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		shellAliases = {
			btw = "echo i use hyprland btw";
			nrs = "sudo nixos-rebuild switch --flake /etc/nixos#hyprland-btw";
			ncg = "sudo nix-collect-garbage -d";
			vim = "nvim";
			confnix = "sudo nvim /etc/nixos/configuration.nix";
			homenix = "sudo nvim /etc/nixos/home.nix";
			fastfetch = "fastfetch --logo nixos_small";
		};
		initContent = lib.mkOrder 1500 ''
			[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
			source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
			if [ -z "$IN_NIX_SHELL" ]; then
				fastfetch --logo nixos_small
			fi
			eval "$(nix-your-shell zsh)"
		'';
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [
				"starship"
			];
		};
	};
	programs.bash = {
		enable = true;
		profileExtra = '' 
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
				exec dbus-run-session start-hyprland
			fi
		'';

	};
	programs.kitty = lib.mkForce {
		enable = true;
		settings = {
			confirm_os_window_close = 0;
			background_opacity = "0.5";
			shell = "zsh";
			editor = "nvim";
		};
		font = {
			name = "JetBrainsMonoNL Nerd Font";
			size = 11;
		};
	};
	programs.vesktop = {
		enable = true;
		vencord.settings = builtins.fromJSON (builtins.readFile ./misc/settings.json);
	};
	programs.rofi = {
		enable = true;
		theme = "gruvbox-dark";
	};
	services.playerctld.enable = true;
	services.hyprpaper = {
		enable = true;
		settings = {
			splash = false;
			preload = [
				"${./walls/wall3.png}"
			];
			wallpaper = [ 
			{
				monitor = "eDP-1";
				path = "${./walls/wall3.png}";
			}
			];
		};
	};
	home.packages = with pkgs; [
		hyprpaper
		gimp
		krita
		qemu
		qemu_kvm
		pmbootstrap
		steam
		wl-clipboard
		kdePackages.kdenlive
		grim
		slurp
		fastfetch
		waybar
		wine64
		winetricks
		gvfs
		ntfsprogs
		nerd-fonts.jetbrains-mono
    		nerd-fonts.symbols-only
		meslo-lgs-nf
		catppuccin-cursors.mochaDark
		libnotify
		brave-origin
		killall
		pavucontrol
		zoom-us
		feh
		kitty
		starship
		zsh-powerlevel10k
		(pkgs.writeShellApplication
		{
			name = "ns";
			runtimeInputs = with pkgs; [
				fzf
				nix-search-tv
			];
			text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
	  	})
	] ++ [
		inputs.nixpkgs-old.legacyPackages.${pkgs.stdenv.hostPlatform.system}.materialgram
	];
	fonts.fontconfig.enable = true;
	services.swaync = {
		enable = true;
		settings = {

			positionX = "right";
  			positionY = "top";
  			layer = "overlay";
 			control-center-layer = "top";
			layer-shell = true;
			cssPriority = "application";
			control-center-margin-top = 0;
			control-center-margin-bottom = 0;
			control-center-margin-right = 0;
			control-center-margin-left = 0;
			notification-2fa-action = true;
			notification-inline-replies = false;
			notification-icon-size = 64;
			notification-body-image-height = 100;
			notification-body-image-width = 200;
		};

	};
}
