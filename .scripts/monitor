#!/usr/bin/env bash
set -euo pipefail

if [[ "$1" == "-h" ]]; then
  echo "compile-explorer filename"
  exit 0
fi

if [[ "$1" == "-g++" ]]; then
  compiler="g++"
  filt="c++filt -i -t"
  file="$2"
else
  compiler="clang++"
  filt="llvm-cxxfilt -t"
  file="$1"
fi

$compiler ./$file -O2 -c -S -o - -masm=intel | $filt | rg -v '\s+\.' | prettybat -l Assembly\ \(x86_64\)

inotifywait -e close_write,moved_to -m . |
  while read -r directory events filename; do
    if [[ "$filename" = "$file" ]] ; then
      clear
    $compiler ./$file -O2 -c -S -o - -masm=intel | $filt | rg -v '\s+\.' | prettybat -l Assembly\ \(x86_64\)
    fi
  done
