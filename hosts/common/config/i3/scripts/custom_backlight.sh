#!/usr/bin/env bash

set -x

APPNAME="xbacklight"
TIMEOUT=2000 # 2 seconds

function do_increase
{
    ( xbacklight -inc 2 ) || ( logger -s --tag "$0" "xbacklight increase failed" )

    local current_xbacklight_level=$(xbacklight -getf)
    ( dunstify --appname=$APPNAME --timeout=$TIMEOUT "xbacklight level: ${current_xbacklight_level}" )
}

function do_decrease
{
    ( xbacklight -dec 2 ) || ( logger -s --tag "$0" "xbacklight decrease failed" )

    local current_xbacklight_level=$(xbacklight -getf)
    ( dunstify --appname=$APPNAME --timeout=$TIMEOUT "xbacklight level: ${current_xbacklight_level}" )
}

function show_usage
{
	echo "$0 increase|decrease"
	exit 1
}

# handle CLI arguments
case $1 in
	"increase")
		do_increase
	;;
	"decrease")
		do_decrease
	;;
	*)
		show_usage
	;;
esac
