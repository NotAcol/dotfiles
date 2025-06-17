#!/usr/bin/env bash

device=$(udiskie-info -a -o "{ui_label} {is_mounted}" |  awk '{
    label = $1;
    name = "";
    for (i = 2; i < NF; i++) {
        name = name (i > 2 ? " " : "") $i;
    }
    if ($NF == "True") {
        status = "<span foreground=\"#a6e3a1\">[mounted]</span>";
    } else {
        status = "<span foreground=\"#f38ba8\">[unmounted]</span>";
    }
    printf "%-12s %-38s %s\n", label, name, status;
}' | rofi -dmenu -theme-str 'listview { columns: 1; }' -markup-rows | awk -F: '{print $1}')

if [ -n "$device" ]; then
    if mount | grep -q "$device"; then
        udisksctl unmount -b "$device"
    else
        udisksctl mount -b "$device"
    fi
fi
