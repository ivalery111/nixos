# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.supportedFilesystems = [ "ntfs" ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

  hardware.video.hidpi.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "mem_sleep_default=deep" ];

  services.thermald.enable = true;
  services.tlp.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  virtualisation.libvirtd = {
    enable = true;
  };

  networking.hostName = "FW"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  networking.useDHCP = false;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # hardware.opengl.enable = true;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    mesa_drivers
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
  ];

  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    dpi = 96;

    displayManager = {
      gdm.enable = true;
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;

      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        i3blocks
      ];
    };
  };



  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  users.users.valery = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "video" "docker" "libvirtd" "kvm" ];
  };

  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
  };
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Meslo" "JetBrainsMono" ]; })
    fantasque-sans-mono
    font-awesome-ttf
    font-awesome_4
    powerline-fonts
    iosevka
    emojione
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    hack-font
    terminus_font
    anonymousPro
    freefont_ttf
    corefonts
    dejavu_fonts
    inconsolata
    ubuntu_font_family
    ttf_bitstream_vera
    meslo-lgs-nf
  ];

  nixpkgs.config.allowUnfree = true;

  # USB automounting
  services.gvfs.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    git
    lxappearance
    brightnessctl
    lm_sensors
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}

