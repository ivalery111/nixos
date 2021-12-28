{ config, lib, pkgs, callPackage, ... }:
{

  services.redshift = {
    enable = true;
    tray = true;

    latitude = 55.755825;
    longitude = 37.617298;
  };

}
