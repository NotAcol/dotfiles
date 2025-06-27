#!/usr/bin/env bash
set -euo pipefail

filename=$(fd . ~/Music/Soundboard --format {/.} -Lt file -E "*.csv" -E "*.sh" -E "*.txt" | rofi -i -dmenu -theme-str 'listview { columns: 1; }' -format 's')

if [ -n "$filename" ]; then
    path=$(fd "$filename" ~/Music/Soundboard -a)
    pw-cat -p --target "to-virtual-mic-and-speakers" "$path" 
fi
