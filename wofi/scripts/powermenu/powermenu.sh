#!/usr/bin/env bash

# If wofi is already running, toggle it off and exit instantly
if pkill -x wofi; then
    exit 0
fi

# Define options
op_shutdown="   Shutdown"
op_reboot="   Reboot"
options="$op_reboot\n$op_shutdown"

# Simple, reliable sizing flags
choice=$(echo -e "$options" | wofi --dmenu \
                                   --width 500 \
                                   --height 115 \
                                   --lines 2)

show_spinner() {
    local action="$1"
    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴")
    
    while true; do
        for frame in "${frames[@]}"; do
            notify-send "Power Menu" "$frame  $action" \
                --urgency=critical \
                -h string:x-dunst-stack-tag:powermenu
            sleep 0.12
        done
    done
}

case "$choice" in
    "$op_shutdown")
        show_spinner "Shutting Down" &
        hyprshutdown -t '' --post-cmd 'systemctl poweroff'
        ;;
        
    "$op_reboot")
        show_spinner "Rebooting" &
        hyprshutdown -t '' --post-cmd 'systemctl reboot'
        ;;
esac
