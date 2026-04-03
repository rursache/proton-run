#!/bin/bash
set -e
cd "$(dirname "$0")"
makepkg -sif --noconfirm
rm -rf pkg src *.pkg.tar.zst
echo "Build artifacts cleaned up."
