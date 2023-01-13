#!/usr/bin/env bash

export DPI=$(xrdb -query | sed -nE 's/^Xft\.dpi:\s*//p')
export HEIGHT=$((20 * DPI / 96))
export BACKLIGHT=$(cd /sys/class/backlight ; ls | head -1)

MONITORS=$(polybar --list-monitors | sed -nE 's/([^ ]+): .*/\1/p' | tr '\n' ' ')
PRIMARY=$(polybar --list-monitors | grep -F '(primary)' | sed -nE 's/([^ ]+): .*/\1/p')
NUM_MONITORS=$(echo $MONITORS | wc -w)
PRIMARY=${PRIMARY:-${MONITORS%% *}}

case $NUM_MONITORS in
    1)
        MONITOR=$PRIMARY polybar --reload alone &
        systemd-notify --status="Single polybar instance running on $PRIMARY"
        ;;
    *)
        MONITOR=$PRIMARY polybar --reload primary &
        for MONITOR in ${MONITORS}; do
            [ $MONITOR != $PRIMARY ] || continue
            MONITOR=$MONITOR polybar --reload secondary &
        done
        # systemd-notify --status="$NUM_MONITORS polybar instances running"
        ;;
esac
