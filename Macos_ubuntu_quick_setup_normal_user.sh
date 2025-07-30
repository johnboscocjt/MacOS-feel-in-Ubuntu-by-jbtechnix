#!/bin/bash

# macOS-style Ubuntu Customization Script
# Run this script to automatically transform your Ubuntu GNOME desktop

echo "🍎 Starting macOS-style Ubuntu transformation..."

# Step 1: Install dependencies
echo "📦 Installing dependencies..."
sudo apt update
sudo apt install -y git curl gnome-tweaks gnome-shell-extensions

# Step 2: Download themes
echo "⬇️  Downloading WhiteSur themes..."
cd ~
if [ ! -d "WhiteSur-gtk-theme" ]; then
    git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
fi

if [ ! -d "WhiteSur-icon-theme" ]; then
    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
fi

# Step 3: Install GTK theme
echo "🎨 Installing GTK theme..."
cd ~/WhiteSur-gtk-theme
./install.sh --monterey --color dark

# Step 4: Install GDM (lockscreen) theme
echo "🔐 Installing lockscreen theme (requires sudo)..."
sudo ./tweaks.sh --gdm -c dark

# Step 5: Install icon theme
echo "✨ Installing icon theme..."
cd ~/WhiteSur-icon-theme
./install.sh

# Step 6: Apply themes and configure system
echo "⚙️  Applying themes and configuring system..."

# Enable user themes extension
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Apply themes
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Dark"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"

# Configure dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.7

# Set wallpaper
echo "🖼️  Setting macOS wallpaper..."
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/WhiteSur-gtk-theme/src/assets/gnome-shell/backgrounds/background-default.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/WhiteSur-gtk-theme/src/assets/gnome-shell/backgrounds/background-default.png"

# Restart GNOME Shell
echo "🔄 Restarting GNOME Shell..."
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")' 2>/dev/null || echo "Please restart GNOME Shell manually: Alt+F2, type 'r', press Enter"

echo "🎉 Transformation complete!"
echo "🔒 Lock your screen (Super+L) to see the new macOS-style lockscreen!"
echo "📝 To change your profile picture, run: gnome-control-center user-accounts"
