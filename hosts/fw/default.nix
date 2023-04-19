{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../common/modules/wm/i3/default.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_latest.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
        url = "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
        sha256 = "NI2XTBQ/3vhRfscD/aokut4SpJBHhIvpLLnjJTsZ75g=";
      };
      version = "5.15.96";
      modDirVersion = "5.15.96";
    };
  });
  boot.supportedFilesystems = [ "ntfs" ];

  services.fwupd.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.valery = {
      initialPassword = "1234";
      uid = 1000;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "docker" ];
    };
  };

  networking = {
    hostName = "fw";
    firewall.enable = true;
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.wlp170s0.useDHCP = true;

    wireguard = {
      enable = true;
    };
  };

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  #console = {
  #  font = "Lat2-Terminus16";
  #  keyMap = "colemak";
  #};

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # sound.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # hardware.pulseaudio.enable = false;
  # security.rtkit.enable = true;

  services = {
    # pipewire = {
    #   enable = true;
    #   alsa.enable = true;
    #   alsa.support32Bit = true;
    #   pulse.enable = true;
    # };
    gvfs.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [ coreutils wget git ];
  environment.pathsToLink = [ "/share/zsh" ];

  fonts = {
    fontconfig = {
      enable = true;
    };
    fonts = with pkgs; [
      jetbrains-mono
      font-awesome_5
      noto-fonts
    ];
  };

   nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 8d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings.trusted-users = [ "valery" "root" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  documentation.man.generateCaches = true;
  system.stateVersion = "22.11";
}
