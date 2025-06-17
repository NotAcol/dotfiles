#!/usr/bin/env bash

set -euo pipefail

ps -u $USER -o pid,comm | rofi -i -dmenu  | awk '{print $1}' | xargs -r kill
