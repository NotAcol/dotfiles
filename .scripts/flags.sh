#!/usr/bin/env bash

set -euo pipefail

echo "-O2
-march=native
-stdlib=libc++ 
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-pthreads 
-flto=thin
-fuse-ld=lld" > ./.flags

echo "-O2
-march=native
-stdlib=libc++ 
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-Wextra
-pedantic
-pthreads 
-flto=thin
-fuse-ld=lld 
-fno-omit-frame-pointer  
-fsanitize=address
-ggdb" > ./.debug-flags #fno-omit-frame-pointer is for perf

echo -e "\033[1;33m                     remember to use tsan as well retard (-fsanitize=thread)"
