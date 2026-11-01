{ pkgs, lib, ... }:
{
	imports = [
		./hyprmodules/binds.nix
		./hyprmodules/anims.nix
	];
	
	wayland.windowManager.hyprland = {
		enable = true;
		configType = "lua";
		
		settings = {
			monitor = {
				output = "eDP-1";
				mode = "1920x1080@144";
				scale = "1";
			};
			config = {
				general = {
					gaps_in = 5;
					gaps_out = 10;
					border_size = 2;
				};
				decoration = {
					rounding = 10;
					rounding_power = 2;
					active_opacity = 1;
					inactive_opacity = 1;

				};
				animations = {
					enabled = true;
				};
				dwindle = {
					preserve_split = true;
				};
				master = {
					new_status = "master";
				};
				scrolling = {
					fullscreen_on_one_column = true;
				};
				misc = {
					force_default_wallpaper = -1;
					disable_hyprland_logo = false;
				};
				input = {
					kb_layout = "us,ru";
					kb_options = "grp:alt_shift_toggle";
					follow_mouse = 1;
					touchpad = {
						natural_scroll = false;
					};
				};
			};
			window_rule = [
				{
					name = "fix-xwayland-drags";
					match = {
						class = "^$";
						title = "^$";
						xwayland = true;
						float = true;
						fullscreen = false;
						pin = false;
					};
				}

				{
					name = "suppress-maximize-events";
					match = {
						class = ".*";
						};
					suppress_event = "maximize";
				}

				{
					name = "move-hyprland-run";
					match = {
						class = "hyprland-run";
					};
					move = "20 monitor_h-120";
					float = true;
				}
			];
			on = {
				_args = [
					"hyprland.start"
					(lib.generators.mkLuaInline ''
					function()
						hl.exec_cmd("waybar")
						hl.exec_cmd("hyprpaper")
						hl.exec_cmd("blueman-applet")
						hl.exec_cmd("swaync")
						hl.exec_cmd("killall -e xdg-desktop-portal-hyprland")
						hl.exec_cmd("killall -e xdg-desktop-portal")
						hl.exec_cmd("sleep 1 && /run/current-system/sw/libexec/xdg-desktop-portal hyprland &")
						hl.exec_cmd("sleep 2 && /run/current-system/sw/libexec/xdg-desktop-portal &")
						end
					'')
				];
			};
		};
	};
}
