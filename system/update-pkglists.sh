#!/usr/bin/env bash
# Regenerate the explicitly-installed package lists.
set -euo pipefail
cd "$(dirname "$0")"
pacman -Qqen > pkglist-native.txt
pacman -Qqem > pkglist-aur.txt
