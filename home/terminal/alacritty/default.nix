{ config, lib, pkgs, ... }:
{

  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal = {
          family = "Fira Code Nerd Font";
        };
        size = 6;
        scale_with_dpi = true;
      };
      scrolling = {
        history = 1000;
        fmux_multiplier = 100;
        auto_scroll = true;
      };
      mouse = {
        hide_when_typing = false;
      };
      colors = {
        primary = {
          background = "#292929";
          foreground = "#ffffff";
        };
        normal = {
          black = "#000000";
          red = "#ff0000";
          green = "#38de21";
          yellow = "#ffe50a";
          blue = "#1460d2";
          magenta = "#ff005d";
          cyan = "#00bbbb";
          white = "#bbbbbb";
        };
        bright = {
          black = "#555555";
          red = "#f40e17";
          green = "#3bd01d";
          yellow = "#edc809";
          blue = "#5555ff";
          magenta = "#ff55ff";
          cyan = "#6ae3fa";
          white = "#ffffff";
        };
      };

      background_opacity = 0.98;
      tabspaces = 4;
    };
  };

}
