#!/usr/bin/env bash

battery_icon() {
    local percent="$1"
    local status="$2"

    if [[ "$status" =~ Charging ]]; then
        echo "󰂄"
    elif (( percent >= 90 )); then echo "󰁹"
    elif (( percent >= 70 )); then echo "󰂀"
    elif (( percent >= 50 )); then echo "󰁿"
    elif (( percent >= 30 )); then echo "󰁽"
    elif (( percent >= 10 )); then echo "󰁺"
    else echo "󰂃"
    fi
}

show_battery_ui() {
    local STATUS="$1"
    local PERCENT="$2"
    local TIME="$3"

    local ICON
    ICON=$(battery_icon "$PERCENT" "$STATUS")

    whiptail \
        --title " $ICON  Battery " \
        --gauge "\
Status: $STATUS
Time remaining: $TIME
" \
        10 60 "$PERCENT"

    sleep 1
}

