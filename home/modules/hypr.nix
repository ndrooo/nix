{ inputs, ... }: {
    imports = [
        inputs.hyprland.homeManagerModules.default
    ];

    wayland.windowManager.hyprland.enable = true;
	programs.waybar.enable = true;

    wayland.windowManager.hyprland.extraConfig = ''
	# See https://wiki.hyprland.org/Configuring/Monitors/
	monitor=eDP-1,1920x1200@60,0x0,1

	exec-once = waybar

	input {
		follow_mouse = 0
	}

	general {
		border_size = 2
		layout = dwindle
	}

	dwindle {
		no_gaps_when_only = true
	}

	decoration {
		rounding = 5
	}

	animations {
		enabled = false
	}

	bind = SUPER, Q, killactive
	bind = SUPER SHIFT, E, exit
	bind = SUPER, Return, exec, kitty
	bind = SUPER, D, exec, rofi -show drun
	bind = SUPER SHIFT, D, exec, rofi -show run

	bind = SUPER, H, movefocus, l
	bind = SUPER, J, movefocus, d
	bind = SUPER, K, movefocus, u
	bind = SUPER, L, movefocus, r
	bind = SUPER SHIFT, H, movewindow, l
	bind = SUPER SHIFT, J, movewindow, d
	bind = SUPER SHIFT, K, movewindow, u
	bind = SUPER SHIFT, L, movewindow, r
	binde = SUPERCTRL, H, resizeactive, -20 0
	binde = SUPERCTRL, J, resizeactive, 0 20 
	binde = SUPERCTRL, K, resizeactive, 0 -20
	binde = SUPERCTRL, L, resizeactive, 20 0

	bind = SUPER, 1, workspace, 1
	bind = SUPER, 2, workspace, 2
	bind = SUPER, 3, workspace, 3
	bind = SUPER, 4, workspace, 4
	bind = SUPER, 5, workspace, 5
	bind = SUPER, 6, workspace, 6
	bind = SUPER, 7, workspace, 7
	bind = SUPER, 8, workspace, 8
	bind = SUPER, 9, workspace, 9
	bind = SUPER, 0, workspace, 10

	bind = SUPER SHIFT, 1, movetoworkspace, 1
	bind = SUPER SHIFT, 2, movetoworkspace, 2
	bind = SUPER SHIFT, 3, movetoworkspace, 3
	bind = SUPER SHIFT, 4, movetoworkspace, 4
	bind = SUPER SHIFT, 5, movetoworkspace, 5
	bind = SUPER SHIFT, 6, movetoworkspace, 6
	bind = SUPER SHIFT, 7, movetoworkspace, 7
	bind = SUPER SHIFT, 8, movetoworkspace, 8
	bind = SUPER SHIFT, 9, movetoworkspace, 9
	bind = SUPER SHIFT, 0, movetoworkspace, 10

	bindm = SUPER, mouse:272, movewindow
	bindm = SUPER, mouse:273, resizewindow
    '';

	programs.waybar.settings = {
		mainBar = {
			layer = "top";
			position = "top";
			height = 32;
			output = [
				"eDP-1"
			];
			modules-left = [ "wlr/workspaces" ];
			modules-center = ["wlr/taskbar"];
			modules-right = [ "mpd" "battery" ];

			"wlr/taskbar" = {
				active-first = true;
			};
		};
	};
}
