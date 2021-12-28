{ config, lib, ... }:
{

  programs.urxvt = {
    enable = true;
    iso14755 = false;

    fonts = [ "xft:MesloLGS NF:size=12" ];
    # fonts = [ "xft:MesloLGS Nerd Font Mono:size=18" ];

    #fonts = [ "xft:FantasqueSansMono Nerd Font:size=11" ];
    # fonts = [ "xft:Iosevka:style=Regular:size=11" ];
    # fonts = [ "xft:Inconsolata Nerd Font Mono:size=15" ];

    # fonts = [ "xft:Powerline:style=Regular:size=15" ];

    extraConfig = {
      letterSpace =  -5;
      color0 = "#d4c490";
      color1 = "#aab283";
      color2 = "#8a9b71";
      color3 = "#5c7162";
      color4 = "#a1755c";
      color5 = "#895255";
      color6 = "#a95332";
      color7 = "#6c886f";
      color8 = "#c4623d";
      color9 = "#94643e";
      color10 = "#b78143";
      color11 = "#c69459";
      color12 = "#ae8b6b";
      color13 = "#818890";
      color14 = "#d4c490";
      color15 = "#aab283";
    };

    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
    };
  };

}
