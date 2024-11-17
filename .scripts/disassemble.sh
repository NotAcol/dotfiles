#!/usr/bin/env bash
set -euo pipefail

file="$1"

objdump -M intel,amd64 -g -C -S --visualize-jumps --no-show-raw-insn $file | pygmentize -P style=catppuccin-mocha -l asm |  less -r
