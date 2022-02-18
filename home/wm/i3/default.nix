{ config, lib, pkgs, ... }:

let

  mod = "Mod4";

in {

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;

      fonts = {
        names = [ "Fira Code" "FontAwesome 6" ];
        size = 12.0;
      };

      terminal = "alacritty";

      defaultWorkspace = "workspace number 1";

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec --no-startup-id \"rofi -modi drun,run -show drun\"";

        # Change focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        # Change focus alternatively with cursor keys
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        # Move alternatively with cursor keys
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # Navigate workspaces next/previous
        "${mod}+Ctrl+Right" = "workspace next";
        "${mod}+Ctrl+Left" = "workspace prev";

        # Switch to workspace
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";

        # Move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";

        "${mod}+Ctrl+greater" = "move workspace to output right";
        "${mod}+Ctrl+less" = "move workspace to output left";

        # Split orientation
        "${mod}+Ctrl+h" = "split h";
        "${mod}+Ctrl+v" = "split v";
        "${mod}+q" = "split toggle";

        # Lock screen
        "${mod}+Shift+x" = "exec --no-startup-id betterlockscreen -l dim";

        "XF86MonBrightnessDown" = "exec --no-startup-id \"brightnessctl set 2%-\"";
        "XF86MonBrightnessUp" = "exec --no-startup-id \"brightnessctl set +2%\"";

        # Use pactl to adjust volume in PulseAudio.
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && killall -SIGUSR1 i3status";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && killall -SIGUSR1 i3status";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && killall -SIGUSR1 i3status";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && killall -SIGUSR1 i3status";
      };

      workspaceAutoBackAndForth = true;

      startup = [
        # { command = "--no-startup-id picom -b --backend glx --vsync --xrender-sync-fence --glx-no-rebind-pixmap --use-damage --glx-no-stencil"; }
        { command = "--no-startup-id dex --autostart --environment i3"; }
        { command = "--no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork"; }
        { command = "--no-startup-id nm-applet"; }
        { command = "--no-startup-id setxkbmap -layout \"us,ru\" -option \"grp:alt_shift_toggle\""; always = true; }
        { command = "--no-startup-id nitrogen --restore"; always = true; }
      ];

      gaps = {
        inner = 6;
        outer = -2;
        smartGaps = true;
        smartBorders = "on";
      };

      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs $HOME/.config/i3status-rust/config-base.toml";
          position = "top";
          fonts = {
            names = ["Fira Code" "FontAwesome 6"];
            size = 12.0;
          };
        }
      ];
    };

    extraConfig =
    ''
    default_border pixel

    # Set shut down, restart and locking features
    bindsym $mod+z mode "$mode_system"
    set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
    set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
    mode "$mode_system" {
        bindsym l exec --no-startup-id i3exit lock, mode "default"
        bindsym s exec --no-startup-id i3exit suspend, mode "default"
        bindsym u exec --no-startup-id i3exit switch_user, mode "default"
        bindsym e exec --no-startup-id i3exit logout, mode "default"
        bindsym h exec --no-startup-id i3exit hibernate, mode "default"
        bindsym r exec --no-startup-id i3exit reboot, mode "default"
        bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

        # exit system mode: "Enter" or "Escape"
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    '';
  };

}
