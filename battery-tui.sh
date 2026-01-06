#!/usr/bin/env bash

set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$BASE_DIR/lib/utils.sh"
source "$BASE_DIR/lib/battery.sh"
source "$BASE_DIR/lib/ui.sh"

require dialog

cleanup() {
    dialog --clear
    clear
    exit 0
}

trap cleanup INT TERM EXIT

while true; do
    if ! BATTERY_DATA=$(get_battery_info); then
        dialog --title "Battery TUI" --msgbox "No battery detected." 7 40
        cleanup
    fi

    IFS='|' read -r STATUS PERCENT TIME <<<"$BATTERY_DATA"

    show_battery_ui "$STATUS" "$PERCENT" "$TIME"
    RC=$?

    # ESC, Cancel, or error → quit
    [[ $RC -ne 0 ]] && cleanup

    sleep 1
done

