#!/bin/bash
set -euo pipefail

declare -a focuses=(60 65 70 75 80 85 90)

for focus in "${focuses[@]}"; do
	fswebcam \
        --rotate 270 \
        -r 1920x1080 \
        --jpeg 90 \
        -S 2 \
        --fps 5 \
        --no-banner \
        --set "Focus, Auto=False" \
        --set "Focus (absolute)=${focus}" \
        "/home/kameraspi/Pictures/kasvit/gfocus-${focus}.jpg"
done
