#!/bin/bash
set -euo pipefail

# this script will break in multiple ways if any part of the dir contains spaces

KASVIT_DIR="./kasvit/"

set +e
mkdir -p "./kasvit/video/"
set -e

input_args="$(ls ./kasvit/2023-*/{12,13,14,15}-*.jpg | sort -g | tr '\n' ' ')"
# input_args="$(ls ./kasvit/2023-*/*.jpg | sort -g | tr '\n' ' ')"

output="./kasvit/video/$(date +'%Y-%m-%d')-day.mp4"
cat $input_args | ffmpeg \
  -y \
  -framerate 60 \
  -f image2pipe -i - \
  -c:v libx264 \
  -crf 22 \
  -pix_fmt yuv420p \
  -vf "normalize=blackpt=black:whitept=white:strength=1:independence=0" \
  "${output}"