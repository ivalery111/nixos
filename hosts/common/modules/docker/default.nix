{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    rootless.setSocketVariable = true;
    enableOnBoot = true;
  };
}
