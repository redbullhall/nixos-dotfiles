{ config, pkgs, ...}: 

{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use hyprland btw";
      vim = "nvim";
      nrs = "sudo nixos-rebuild switch --flake /home/user/nixos-dotfiles#hyprland-btw";
      ncg = "sudo nix-collect-garbage -d";
      confnix = "nvim /home/user/nixos-dotfiles/configuration.nix";
      homenix = "nvim /home/user/nixos-dotfiles/home.nix";
    };
    profileExtra = ''
	if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
		exec uwsm start hyprland.desktop
	fi
    '';
  };
#  home.file.".config/hypr".source = ./config/hypr;
#  home.file.".config/waybar".source = ./config/waybar;
#  home.file.".config/foot".source = ./config/foot;
}
