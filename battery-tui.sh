#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$BASE_DIR/lib/utils.sh"
source "$BASE_DIR/lib/battery.sh"
source "$BASE_DIR/lib/ui.sh"

require whiptail

cleanup() {
    clear
    exit 0
}

trap cleanup INT TERM

while true; do
    BATTERY_DATA=$(get_battery_info) || {
        whiptail --title "Error" --msgbox "Battery not detected" 7 40
        cleanup
    }

    STATUS=$(echo "$BATTERY_DATA" | cut -d'|' -f1)
    PERCENT=$(echo "$BATTERY_DATA" | cut -d'|' -f2)
    TIME=$(echo "$BATTERY_DATA" | cut -d'|' -f3)

    show_battery_ui "$STATUS" "$PERCENT" "$TIME"
    EXIT_CODE=$?

    # ESC or Cancel = exit code 255
    if [ "$EXIT_CODE" -ne 0 ]; then
        cleanup
    fi

    sleep 1
done

