#!/usr/bin/env bash
set -euo pipefail

cd ~/.password-store/

password=$(fd -e gpg --format {.} | rofi -i -dmenu)

if [ -n "$password" ]; then
    pass -c "$password"
fi

