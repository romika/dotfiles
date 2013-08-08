#!/bin/sh

vgastatus="$(cat /sys/class/drm/card0-VGA-1/status)"
hdmistatus="$(cat /sys/class/drm/card0-HDMI-A-1/status)"

# This script is called as root and without X knowledge
export DISPLAY=:0.0

if [ "${vgastatus}" = disconnected ]; then
	xrandr --output VGA1 --off
	if [ "${hdmistatus}" = disconnected ]; then
		xrandr --output HDMI1 --off
		xrandr --output LVDS1 --auto
	elif [ "${hdmistatus}" = connected ]; then
		xrandr --output HDMI1 --auto
		xrandr --output LVDS1 --off
	fi
elif [ "${vgastatus}" = connected ]; then
	xrandr --output VGA1 --auto
	xrandr --output HDMI1 --off
	xrandr --output LVDS1 --off
fi
