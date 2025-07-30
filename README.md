
# Guide: Transform Your Ubuntu GNOME Desktop into a macOS Clone

This tutorial provides step-by-step instructions to customize your Ubuntu desktop, including the lockscreen, to closely resemble the look and feel of macOS.

## 🎯 What You Will Achieve

By following this guide, you will transform your Ubuntu system to have:

### 🔐 **macOS-Style Lockscreen**
- Beautiful macOS Big Sur/Monterey login screen with blur effects
- Apple-style user selection interface
- Elegant password input design
- macOS-themed background on lockscreen

### 🖥️ **Complete Desktop Transformation**
- **Dark macOS theme** for all applications and system elements
- **macOS-style icons** throughout the entire system
- **Translucent dock** positioned at the bottom like macOS
- **Apple-style top bar** with macOS button layouts
- **macOS Big Sur wallpaper** as your desktop background
- **Apple logo** in the Activities button area

### 📱 **Visual Elements**
- Window controls (minimize, maximize, close) styled like macOS
- macOS-style notifications and system dialogs
- Rounded corners and smooth animations
- macOS-inspired color scheme and typography
- System sounds and visual feedback similar to macOS

### 🎨 **Overall Experience**
Your Ubuntu system will look and feel almost identical to a real Mac, with:
- Seamless integration between all visual elements
- Consistent macOS design language
- Professional, polished appearance
- Familiar macOS user interface patterns

---

## 🎯 Prerequisites
- An Ubuntu system running the **GNOME** desktop environment.
- An internet connection.
- Basic knowledge of the terminal.

---

## 🛠️ Step 1: Install Essential Tools & Dependencies

First, we need to update our package list and install some necessary tools for theme and extension management.

```bash
# Update package lists
sudo apt update

# Install Git, curl, and GNOME's customization tools
sudo apt install git curl gnome-tweaks gnome-shell-extensions
```

---

## 🎨 Step 2: Download the macOS Themes

We will use the popular "WhiteSur" theme, which is a fantastic macOS Big Sur/Monterey clone.

```bash
# Navigate to your home directory
cd ~

# Clone the GTK theme (for applications and shell)
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

# Clone the icon theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
```

---

## ⚙️ Step 3: Install the WhiteSur GTK & Lockscreen (GDM) Theme

Now, let's install the main application theme and then the lockscreen/login (GDM) theme.

```bash
# Navigate into the theme directory
cd WhiteSur-gtk-theme

# Run the installer for the main GTK/Shell theme
# We'll use the dark Monterey style here
./install.sh --monterey --color dark

# Now, install the GDM (login/lockscreen) theme using the tweaks script
# This requires root permission
sudo ./tweaks.sh --gdm -c dark
```
*You will be prompted for your password for the `sudo` command.*

---

## ✨ Step 4: Install the WhiteSur Icon Theme

Next, install the matching macOS-style icons.

```bash
# Go back to your home directory
cd ~

# Navigate into the icon theme directory
cd WhiteSur-icon-theme

# Run the installer for the icons
./install.sh
```

---

## 🔧 Step 5: Apply the Themes and Configure the Dock

With everything installed, it's time to apply the new themes and tweak the dock to look like it does on macOS.

```bash
# Enable the ability to use user themes
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Apply the GTK (application) theme
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"

# Apply the Shell theme (for the top bar, activities overview, etc.)
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Dark"

# Apply the icon theme
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"

# Move the dock to the bottom of the screen
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Center the dock's icons
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Set a bit of transparency for the dock background
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.7
```

---

## 🖼️ Step 6: Set the macOS Wallpaper

A good wallpaper completes the look. The WhiteSur theme comes with the perfect one.

```bash
# Set the wallpaper for both light and dark modes
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/WhiteSur-gtk-theme/src/assets/gnome-shell/backgrounds/background-default.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/WhiteSur-gtk-theme/src/assets/gnome-shell/backgrounds/background-default.png"
```

---

## 👤 Step 7: Change Your Profile Picture (Optional)

You can easily change your user's profile picture to further personalize the lockscreen.

**Method 1: GUI (Easiest)**
1.  Open **Settings**.
2.  Go to the **Users** panel.
3.  Click on your user's avatar and select a new image.

**Method 2: Command Line**
1. Find an image you want to use.
2. Run the following command, replacing `/path/to/your/image.jpg` with the actual path to your picture.

```bash
sudo cp /path/to/your/image.jpg /var/lib/AccountsService/icons/$(whoami)
```

---

## 🔄 Step 8: Restart the Shell to See All Changes

Finally, restart the GNOME Shell to make sure all the changes, especially for the shell theme and lockscreen, are applied correctly.

Press **`Alt + F2`**, type `r` in the dialog box, and press **`Enter`**.

If that doesn't work, you can run this command in the terminal:
```bash
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'
```

---

## 🎉 Finished!

That's it! **Lock your screen (Super + L)** to see your new macOS-style lockscreen. Your entire desktop, from applications and icons to the dock and top bar, should now have a clean, modern macOS look.
