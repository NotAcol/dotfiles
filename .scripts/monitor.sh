#!/usr/bin/env bash
set -euo pipefail


if [[ -z $1 ]] || [[ "$1" == "-h" ]] ; then
  echo -e "Usage:\tmonitor.sh [OPTIONS] [FILE]\n\nOPTIONS: \n\t-h \tfor help\n\t-g++ \tuse g++ as compiler\n\nYou can also create a .flags file to privide your own compiler flags"
  exit 0
fi

# cleanup before exiting 
cleanup(){
    clear
    rm -rf ./temp
}
trap cleanup EXIT

if [[ "$1" == "-g++" ]]; then
  compiler="g++"
  file="$2"
else
  compiler="clang++"
  file="$1"
fi

mkdir ./temp

# check if flags are there and if not create them
if  [[-f "./.flags"]] ; then
    flags=$(< .flags)
else
    flags="-g -O2 -fno-exceptions -fno-rtti -lc++abi -stdlib=libc++"
fi

$compiler $flags $file -o ./temp/temp.o
objdump -M intel,amd64 -C -g -S --visualize-jumps  --no-show-raw-insn  ./temp/temp.o | pygmentize -P style=catppuccin-mocha -l asm | less -r

inotifywait -e close_write,moved_to -m . |
  while read -r directory events filename; do
    if [[ "$filename" = "$file" ]] ; then
      clear
    $compiler $flags $file -o ./temp/temp.o
    objdump -M intel,amd64 -g -C  -S --visualize-jumps  --no-show-raw-insn  ./temp/temp.o | pygmentize -P style=catppuccin-mocha -l asm | less -r
    fi
  done
