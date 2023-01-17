{ config, pkgs, lib, ... }:
{
  imports = [
    ../common/modules/zsh
    ../common/modules/docker
  ];

  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;

  # if you have a Raspberry Pi 2 or 3, pick this:
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # A bunch of boot parameters needed for optimal runtime on RPi 3b+
  boot.kernelParams = [ "cma=256M" "console=ttyS1,115200n8" ];
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 3;
  boot.loader.raspberryPi.uboot.enable = true;
  boot.loader.raspberryPi.firmwareConfig = ''
    gpu_mem=256
  '';

  # File systems configuration for using the installer's partition layout
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.valery = {
      isNormalUser = true;
      initialPassword = "1234"; # ATTENTION! Change the password!    <<<---
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDodMoUBvzn2ENILnSSnCkqoQOEA41u1rjonlITOMqoAnB5yVfutv2y78CuhDjYTJCm8PCy4IVOGr/yXnFlsL0w0z9YubuuM9lFsFB/c5d46Uk6luksea5DRc48kJLlgfcEZP3M0aEBMS53z819w3daRHdUDYJEhQV4hELM53kmhAsq57Z7v5G5V56w5jgnlfAM2aSM5qZsaPkYJmoVwY5TNGi3aKWtcmM5jVA1pVbo+eJCHns4utBnP7XKQoWhhHb1Coc+HZf/rNAE06i37v6qI/wXay19TrgjXRJOgAuJz1vTvusPEW0929O1hKgvmYyHibRkiHEErKcLWyqAa/5Pe8+JCufvQhXOR/0OTAWa/iTU8c4VEGhf5JzjQY3+8R/TIVmkJH4F2xGxFg07PK3TNdJ1UvJ8LcLkVOYnFRWUceMqTcQmAMF0+5JzlTI5Jn2aKgsFiuuYLBqrZ97mq0T/38wX5Rgq1GyagFfpbrjC0EHttQGhtCOP/yIzNiWzeb0= valery@fw"
      ];
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    };
  };

  networking.hostName = "rpi";


  # Preserve space by sacrificing documentation and history
  documentation.nixos.enable = false;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  boot.cleanTmpDir = true;

  # Configure basic SSH access
  services.openssh.enable = true;

  # Use 1GB of additional swap memory in order to not run out of memory
  # when installing lots of things while running other things at the same time.
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];

  environment.systemPackages = with pkgs; [
    libraspberrypi
    vim
    git
    neofetch
  ];

  system.stateVersion = "22.11";
}
