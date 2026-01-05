#!/usr/bin/env bash

show_battery_ui() {
    STATUS="$1"
    PERCENT="$2"
    TIME="$3"

    dialog \
        --title "Battery Monitor" \
        --gauge "\
Status: $STATUS
Time remaining: $TIME
" \
        10 60 "$PERCENT"

    sleep 1
}

