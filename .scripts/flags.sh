#!/usr/bin/env bash

set -euo pipefail

echo "-O2
-stdlib=libc++ 
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-pthreads 
-flto=thin
-fuse-ld=lld" > ./flags

echo "-O2
-stdlib=libc++ 
-lc++abi 
-fno-exceptions 
-fno-rtti 
-Wall 
-pthreads 
-flto=thin
-fuse-ld=lld 
-fno-omit-frame-pointer  
-g" > ./debug-flags #fno-omit-frame-pointer is for perf
