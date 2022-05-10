#!/bin/sh

PROGRAM="wlsunset"

function do_start {
	if ! pgrep -x "$PROGRAM"; then
		exec wlsunset -l 55.75222 -L  37.61556 -T 6000
	fi
}

function do_stop {
	if pgrep -x "$PROGRAM"; then
		pkill -9 "$PROGRAM"
	fi
}

function do_toggle {
	logger -s "do_toggle"
	if pgrep -x "$PROGRAM"; then
		do_stop
	else
		do_start
	fi
}

function show_usage {
	echo "$0 start|stop"
	exit 1
}

# handle CLI arguments
case $1 in
	"start")
		do_start
	;;
	"stop")
		do_stop
	;;
	"toggle")
		do_toggle
	;;
	*)
		show_usage
	;;
esac

