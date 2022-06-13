{ pkgs, ... }:
{
  home.packages = with pkgs; [

    virt-manager
    virtualenv
    neofetch

    rnix-lsp
    ccls
    cscope
    universal-ctags

    cmake
    gnumake

    fzf
    ripgrep

    nitrogen
    polkit
    vlc
    qbittorrent

    wine-staging

    trilium-desktop
    tdesktop
    obsidian

    python3Full
    python39Packages.pip

    calibre
    qpdf

    arandr
    wlsunset

    tmux
    screen
    picocom
    minicom
    putty

    nnn
    pcmanfm
    unzip

    gparted

    rpi-imager

    pulseview

    gitRepo

    htop

    verilog
    gtkwave
  ];

}
