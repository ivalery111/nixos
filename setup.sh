#!/usr/bin/env bash

function log_debug {
    echo "[D]: $1"
}

function log_info {
    echo "[I]: $1"
}

function show_usage {
    echo "Usage:"
    echo "$0 partition [simple_mbr] [disk-name]"
    exit 1
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

    log_info "Do following steps:"
    log_info "  nixos-generate-config --root /mnt"
    log_info "  nano /mnt/etc/nixos/configuration.nix"
    log_info "  nixos-install"
    log_info "  reboot"
}

function partition {
    local partition_type=$1
    local disk_name=$2

    case $partition_type in
        "simple_mbr")
            __do_partition_simple_mbr $disk_name
            ;;
        *)
            echo "[E]: Unknown partition type"
            show_usage
            ;;
    esac
}

# Handle CLI arguments
case $1 in
    "partition")
        partition $2 $3
        ;;
    *)
        show_usage
        ;;
esac

