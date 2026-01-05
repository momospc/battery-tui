#!/usr/bin/env bash

require() {
    command -v "$1" &>/dev/null || {
        echo "Missing dependency: $1"
        exit 1
    }
}

error_dialog() {
    dialog --title "Error" --msgbox "$1" 7 40
}

