#!/usr/bin/env bash

set -euo pipefail

echo "-O2
-mavx2
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-pthreads 
-ffinite-math-only
-fno-math-errno
-fno-trapping-math
-fuse-ld=lld" > ./.flags

echo "-mavx2
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-Wextra
-pedantic
-pthreads 
-fuse-ld=lld 
-fno-trapping-math
-fno-math-errno
-fno-omit-frame-pointer  
-fsanitize=address
-ggdb" > ./.debug-flags #fno-omit-frame-pointer is for perf

echo -e "\033[1;33m                     remember to use tsan as well retard (-fsanitize=thread)"
