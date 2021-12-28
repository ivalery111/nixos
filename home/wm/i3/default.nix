{ config, lib, pkgs, ... }:

let

  mod = "Mod4";

in {

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;

      fonts = {
        names = ["DejaVu Sans Mono" "FontAwesome 6"];
        size = 12.0;
      };

      terminal = "alacritty";

      defaultWorkspace = "workspace number 1";

      #window.border = 0;
      #window.titlebar = false;

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
        bottom = 2;
        horizontal = 2;
        inner = 5;
        outer = -2;
        smartGaps = true;
        smartBorders = "on";
      };

      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs $HOME/.config/i3status-rust/config-base.toml";
          position = "top";
          fonts = {
            names = ["DejaVu Sans Mono" "FontAwesome 6"];
            size = 12.0;
          };
        }
      ];
    };

    extraConfig =
    ''
    default_border pixel
    '';
  };

}
