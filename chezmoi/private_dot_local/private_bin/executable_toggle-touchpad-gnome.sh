#!/bin/bash
status=$(gsettings get org.gnome.desktop.peripherals.touchpad send-events)

function on() {
	gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
	notify-send -u normal "Touchpad Enabled"
}

function off() {
	gsettings set org.gnome.desktop.peripherals.touchpad send-events 'disabled'
	notify-send -u normal "Touchpad Disabled"
}

if [[ "$status" = *"enabled"* ]]; then
	off
else
	on
fi
