#!/bin/bash
sudo pacman -Qei | awk '
    /^Name/{name=$3} /^Description/{desc=""; for (i=3; i<=NF; i++) desc = desc $i " "} /^Installed Size/{print $4$5, name, "-", desc}
' | sort -h
