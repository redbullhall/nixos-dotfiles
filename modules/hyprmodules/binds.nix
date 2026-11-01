{ pkgs, lib, ...}:
{
	wayland.windowManager.hyprland = {
		settings = {
			mod = {
				_var = "SUPER";
			};
			bind = [
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + C\"")
						(lib.generators.mkLuaInline "hl.dsp.window.close()")
					];
				}
				{
					_args = [
						"SUPER + RETURN"
						(lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
					];
				}
				{
					_args = [
						"SUPER + F11"
						(lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl next\")")
					];
				}
				{
					_args = [
						"SUPER + F12"
						(lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl previous\")")
					];
				}
				{
					_args = [
						"SUPER + F10"
						(lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl play-pause\")")
					];
				}
				{
					_args = [
						"XF86AudioRaiseVolume"
						(lib.generators.mkLuaInline ''
							hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
						'')
						(lib.generators.mkLuaInline ''
							{ locked = true, repeating = true }
						'')
					];
				}
				{
					_args = [
						"XF86AudioLowerVolume"
						(lib.generators.mkLuaInline ''
							hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
						'')
						(lib.generators.mkLuaInline ''
							{ locked = true, repeating = true }
						'')
					];
				}
				{
					_args = [
						"XF86AudioMute"
						(lib.generators.mkLuaInline ''
							hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
						'')
						(lib.generators.mkLuaInline ''
							{ locked = true, repeating = true }
						'')
						
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + M\"")
						(lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'\")")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + V\"")
						(lib.generators.mkLuaInline "hl.dsp.window.float({ action = \"toggle\" })")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + Space\"")
						(lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"rofi -show drun\")")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + N\"")
						(lib.generators.mkLuaInline ''hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')'')
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + left\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"left\" })")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + right\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"right\" })")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + up\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"up\" })")

					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + down\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"down\" })")

					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + 1\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({workspace = 1})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + 2\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({workspace = 2})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + 3\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({workspace = 3})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + 4\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({workspace = 4})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + 5\"")
						(lib.generators.mkLuaInline "hl.dsp.focus({workspace = 5})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \"+ SHIFT + 1\"")
						(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 1})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \"+ SHIFT + 2\"")
						(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 2})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \"+ SHIFT + 3\"")
						(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 3})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \"+ SHIFT + 4\"")
						(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 4})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \"+ SHIFT + 5\"")
						(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 5})")
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + mouse:272\"")
						(lib.generators.mkLuaInline "hl.dsp.window.drag()")
						{ mouse = true; }
					];
				}
				{
					_args = [
						(lib.generators.mkLuaInline "mod .. \" + mouse:273\"")
						(lib.generators.mkLuaInline "hl.dsp.window.resize()")
						{ mouse = true; }
					];
				}
			];
		};
	};
}
