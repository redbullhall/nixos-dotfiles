{ pkgs, lib, ...}:
{
		wayland.windowManager.hyprland = {
			settings = {
				curve = [
					{
						_args = [
							"easeOutQuint"
							{
								type = "bezier";
								points = [
									[0.23 0.1]
									[0.32 1]
								];
							}
						];
					}

					{
						_args = [
							"easeInOutCubic"
							{
								type = "bezier";
								points = [
									[0.65 0.05]
									[0.36 1]
								];
							}
						];
					}

					{
						_args = [
							"linear"
							{
								type = "bezier";
								points = [
									[0 0]
									[1 1]
								];
							}
						];
					}

					{
						_args = [
							"almostLinear"
							{
								type = "bezier";
								points = [
									[0.5 0.5]
									[0.75 1]
								];
							}
						];
					}

					{
						_args = [
							"quick"
							{
								type = "bezier";
								points = [
									[0.15 0]
									[0.1 1]
								];
							}
						];
					}
					
					{
						_args = [
							"easy"
							{
								type = "spring";
								mass = 1;
								stiffness = 238.1191;
								dampening = 24.21279333;
							}
						];
					}
				];
				animation = [
					{
						_args = [
							{
								leaf = "global";
								enabled = true;
								speed = 10;
								bezier = "default";
							}
						];
					}

					{
						_args = [
							{
								leaf = "border";
								enabled = true;
								speed = 5.39;
								bezier = "easeOutQuint";
							}
						];
					}

					{
						_args = [
							{
								leaf = "windows";
								enabled = true;
								speed = 4.79;
								spring = "easy";
							}
						];
					}

					{
						_args = [
							{
								leaf = "windowsIn";
								enabled = true;
								speed = 4.1;
								spring = "easy";
								style = "popin 87%";
							}
						];
					}

					{
						_args = [
							{
								leaf = "windowsOut";
								enabled = true;
								speed = 1.49;
								bezier = "linear";
								style = "popin 87%";
							}
						];
					}

					{
						_args = [
							{
								leaf = "fadeIn";
								enabled = true;
								speed = 1.73;
								bezier = "almostLinear";
							}
						];
					}

					{
						_args = [
							{
								leaf = "fadeOut";
								enabled = true;
								speed = 1.46;
								bezier = "almostLinear";
							}
						];
					}

					{
						_args = [
							{
								leaf = "fade";
								enabled = true;
								speed = 3.03;
								bezier = "quick";
							}
						];
					}

					{
						_args = [
							{
								leaf = "layers";
								enabled = true;
								speed = 3.81;
								bezier = "easeOutQuint";
							}
						];
					}

					{
						_args = [
							{
								leaf = "layersIn";
								enabled = true;
								speed = 4;
								bezier = "easeOutQuint";
								style = "fade";
							}
						];
					}

					{
						_args = [
							{
								leaf = "layersOut";
								enabled = true;
								speed = 1.5;
								bezier = "linear";
								style = "fade";
							}
						];
					}

					{
						_args = [
							{
								leaf = "fadeLayersIn";
								enabled = true;
								speed = 1.79;
								bezier = "almostLinear";
							}
						];
					}

					{
						_args = [
							{
								leaf = "fadeLayersOut";
								enabled = true;
								speed = 1.39;
								bezier = "almostLinear";
							}
						];
					}

					{
						_args = [
							{
								leaf = "workspaces";
								enabled = true;
								speed = 1.94;
								bezier = "almostLinear";
								style = "fade";
							}
						];
					}

					{
						_args = [
							{
								leaf = "workspacesIn";
								enabled = true;
								speed = 1.21;
								bezier = "almostLinear";
								style = "fade";
							}
						];
					}

					{
						_args = [
							{
								leaf = "workspacesOut";
								enabled = true;
								speed = 1.94;
								bezier = "almostLinear";
								style = "fade";
							}
						];
					}

					{
						_args = [
							{
								leaf = "zoomFactor";
								enabled = true;
								speed = 7;
								bezier = "quick";
							}
						];
					}
				];
				config = {
					animations = {
						enabled = true;
					};
				};
			};
		};
}
