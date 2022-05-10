#!/bin/sh

PROGRAM="bluetoothctl"
HD450_ID="00:16:94:38:7D:34"

function do_connect {
	is_connected=$(bluetoothctl info | grep "Connected: " | awk '{print $2}')
	if [[ "$is_connected" == "yes" ]]; then
		return
	fi

	${PROGRAM} connect "${HD450_ID}"
}

function do_disconnect {
	is_connected=$(bluetoothctl info | grep "Connected: " | awk '{print $2}')
	if [[ -z "${is_connected}" ]]; then
		return
	fi

	"${PROGRAM}" disconnect
}

function do_connect_toggle {
	is_connected=$(bluetoothctl info | grep "Connected: " | awk '{print $2}')
	if [[ "$is_connected" == "yes" ]]; then
		do_disconnect
	else
		do_connect
	fi
}

function show_usage {
	echo "$0 connect|disconnect|toggle"
	exit 1
}

# handle CLI arguments
case $1 in
	"connect")
		do_connect
	;;
	"disconnect")
		do_disconnect
	;;
	"toggle")
		do_connect_toggle
	;;
	*)
		show_usage
	;;
esac

