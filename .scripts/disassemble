#!/usr/bin/env bash
set -euo pipefail

file="$1"

objdump -M intel -M amd64 --disassembler-color=off -S --visualize-jumps --no-show-raw-insn --no-addresses ./$file | prettybat -l asm
