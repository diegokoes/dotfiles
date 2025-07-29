#!/bin/bash

# CachyOS System Update Script
# Updates system packages with pacman and AUR packages with paru

echo "🔄 Starting system update..."
echo "========================================="

# Update official repositories
echo "📦 Updating official packages..."
sudo pacman -Syu

if [ $? -eq 0 ]; then
    echo "✅ Official packages updated successfully"
else
    echo "❌ Error updating official packages"
    exit 1
fi

echo ""
echo "========================================="

# Update AUR packages
echo "📦 Updating AUR packages..."
paru -Syu

if [ $? -eq 0 ]; then
    echo "✅ AUR packages updated successfully"
else
    echo "❌ Error updating AUR packages"
fi

echo ""
echo "========================================="
echo "🎉 System update completed!"
echo "Press any key to close..."
read -n 1
