#!/bin/bash
set -euo pipefail

dirname="$(date +"%Y-%m-%d")"
filename="$(date +"%H-%M-%S").jpg"

root_dir="/home/kameraspi/Pictures/kasvit/${dirname}"

set +e
mkdir -p "${root_dir}"
set -e

fswebcam \
	--rotate 270 \
	-r 1920x1080 \
	--jpeg 90 \
	-S 10 \
	--fps 5 \
	--no-banner \
	--set "Focus, Auto=False" \
	--set "Focus (absolute)=60" \
	"${root_dir}/${filename}"
