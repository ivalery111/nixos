{ config, lib, pkgs, ... }:
{

  programs.i3status-rust = {
    enable = true;

    bars = {
      base = {
        blocks = [
          {
            block = "bluetooth";
            mac = "00:16:94:38:7D:34";
            format = "HD450 {percentage}";
            format_unavailable = "HD450 X";
          }
          {
            block = "bluetooth";
            mac = "60:F4:3A:BD:7E:77";
            format = "TWS 200";
            format_unavailable = "TWS 200 X";
          }
          {
            block = "networkmanager";
            interface_name_exclude = ["br\\-[0-9a-f]{12}" "docker\\d+" "virbr\\d+"];
            device_format = "{icon} {ap} {ips}";
            on_click = "alacritty -e nmtui";
          }
          {
            block = "temperature";
            collapsed = false;
            format = "{average}";
          }
          {
            block = "cpu";
            interval = 1;
            format = "{utilization}|{frequency}";
          }
          {
            block = "memory";
            display_type = "memory";
            format_mem = "{mem_used}/{mem_total}";
            interval = 5;
          }
          {
            block = "disk_space";
            path = "/";
            alias = "/";
            info_type = "available";
            format = "{icon} {available}/{total}";
            unit = "GB";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          { block = "backlight"; }
          {
            block = "sound";
            format = "{volume}";
          }
          {
            block = "battery";
            interval = 10;
          }
          {
            block = "time";
            interval = 60;
            format = "%a %d/%m %R";
          }
        ];
        settings = {
          theme = { name = "gruvbox-dark"; };
        };
        icons = "material-nf";
      };
    };
  };

}
