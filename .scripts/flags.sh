#!/usr/bin/env bash

set -euo pipefail

echo "-O2
-stdlib=libc++ 
-lc++abi 
-flto 
-fno-exceptions 
-fno-rtti 
-Wall 
-pthreads 
-fuse-ld=lld" > ./flags

echo "-O2
-stdlib=libc++ 
-lc++abi 
-flto 
-fno-exceptions 
-fno-rtti 
-Wall 
-pthreads 
-fuse-ld=lld 
-fno-omit-frame-pointer 
-g" > ./debug-flags
