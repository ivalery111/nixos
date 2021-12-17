#!/usr/bin/env bash

function log_debug {
    echo "[D]: $1"
}

function log_info {
    echo "[I]: $1"
}

function log_error {
    echo "[E]: $1"
    exit 1
}

function show_usage {
    echo "Usage:"
    echo "$0 partition [simple_mbr|simple_uefi] [disk-name]"
    echo "$0 home-manager [install]"
    exit 1
}

function print_post_partition_actions {
    log_info "Post partition actions:"
    log_info "  nixos-generate-config --root /mnt"
    log_info "  nano /mnt/etc/nixos/configuration.nix"
    log_info "  nixos-install"
    log_info "  reboot"
}

function __do_partition_simple_mbr {
    log_debug "__do_partition_simple"

    local disk_name=$1

    log_info "Starting partition..."
    parted ${disk_name} -- mklabel msdos
    parted ${disk_name} -- mkpart primary 1MiB -4GiB
    parted ${disk_name} -- mkpart primary linux-swap -4GiB 100%

    mkfs.ext4 -L NIXOS ${disk_name}1
    mkswap -L swap ${disk_name}2
    swapon ${disk_name}2
    mount /dev/disk/by-label/NIXOS /mnt
    log_info "Partition done."

    print_post_partition_actions
}

function __do_partition_simple_uefi {
    log_debug "__do_partition_simple_uefi"

    local disk_name=$1

    log_info "Starting partition..."
    parted ${disk_name} -- mklabel gpt
    parted ${disk_name} -- mkpart primary 512MiB -4GiB
    parted ${disk_name} -- mkpart primary linux-swap -4GiB 100%
    parted ${disk_name} -- mkpart ESP fat32 1MiB 512MiB
    parted ${disk_name} -- set 3 esp on

    mkfs.ext4 -L NIXOS ${disk_name}1
    mkswap -L SWAP ${disk_name}2
    swapon ${disk_name}2
    mkfs.fat -F 32 -n boot ${disk_name}3
    mount /dev/disk/by-label/NIXOS /mnt
    mkdir -p /mnt/boot
    mount /dev/disk/by-label/boot /mnt/boot
    log_info "Partition done."

    print_post_partition_actions
}

function partition {
    local partition_type=$1
    local disk_name=$2

    case $partition_type in
        "simple_mbr")
            __do_partition_simple_mbr $disk_name
            ;;
        "simple_uefi")
            __do_partition_simple_uefi $disk_name
            ;;
        *)
            echo "[E]: Unknown partition type"
            show_usage
            ;;
    esac
}

function __do_home_manager_install {
    log_debug "__do_home_manager_install"

    nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
    nix-channel --update

    log_info "You may need to log out"
    export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

    log_info "Running the Home Manager installation and creating the first Home Manager generation"
    nix-shell '<home-manager>' -A install
    log_info "Done, Home Manager should be active"
}

function home-manager {
    local command=$1

    case $command in
        "install")
            __do_home_manager_install
            ;;
        *)
            log_error "Unknown home-manager command"
            ;;
    esac
}

# Handle CLI arguments
case $1 in
    "partition")
        partition $2 $3
        ;;
    "home-manager")
        home-manager $2
        ;;
    *)
        show_usage
        ;;
esac

