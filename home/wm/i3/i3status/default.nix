{ config, lib, pkgs, ... }:
{
  programs.i3status = {
    enable = true;

    modules = {
      "disk /" = {
        enable = false;
        position = 2;
        settings = {
          format = "/ %avail";
        };
      };

      "tztime local" = { enable = true; };

      "memory" = { enable = false; };

      "battery all" = { enable = false; };

      "load" = { enable = false; };

      "ipv6" = { enable = false; };

      "ethernet _first_" = { enable = false; };

      "wireless _first_" = { enable = false; };
    };
  };
}
