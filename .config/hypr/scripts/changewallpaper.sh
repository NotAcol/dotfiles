#!/usr/bin/env bash

swww img --transition-bezier=0.1,1.0,0.1,1.0 --transition-angle=45 --transition-fps=144 -t any --transition-step=18  "$HOME"/Pictures/wallpaper"$1".png
swww clear-cache
