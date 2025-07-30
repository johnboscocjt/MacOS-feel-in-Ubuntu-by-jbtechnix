# Ubuntu Native Screenshot App Shortcut Guide

This guide explains how to set up a Super+Z keyboard shortcut for Ubuntu's built-in "Take a screenshot" application - the same one accessible from the top-right system menu.

## Overview

Ubuntu ships with a native screenshot tool that can be accessed from the top-right system menu. It's called "Take a screenshot" and doesn't have a dedicated app icon. By default, it's bound to the Print Screen key. This guide shows how to rebind it to Super+Z using the correct method that works reliably and persists after reboot.

## The Solution: Direct GNOME Keybinding Modification

The correct approach is to modify GNOME's native screenshot keybinding using `gsettings`. This method directly changes the system setting that controls the screenshot UI.

### Step 1: Check Current Screenshot Binding

First, check what key is currently bound to the screenshot UI:

```bash
gsettings get org.gnome.shell.keybindings show-screenshot-ui
```

*Expected output: `['Print']`*

### Step 2: Change the Keybinding to Super+Z

Modify the GNOME setting to bind the screenshot UI to Super+Z:

```bash
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>z']"
```

### Step 3: Clear Conflicting Custom Keybindings

Remove any custom keybindings that might conflict (this was crucial for making it work):

```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"
```

### Step 4: Verify the Setting

Confirm the new keybinding is correctly applied:

```bash
gsettings get org.gnome.shell.keybindings show-screenshot-ui
```

*Expected output: `['<Super>z']`*

### Step 5: Restart GNOME Shell

Apply the changes by restarting GNOME Shell. This step is essential for the shortcut to become active:

**For X11 sessions (most common):**
```bash
killall -3 gnome-shell
```

**Or press Alt+F2, type `r`, and press Enter**

**For Wayland sessions:**
Log out and log back in for changes to take effect.

## What This Does

This method:
- **Uses the native function**: Modifies `show-screenshot-ui`, which is Ubuntu's built-in screenshot interface
- **No external dependencies**: No need for xdotool, ydotool, or other tools
- **Direct system integration**: Changes the actual GNOME keybinding
- **Persistent**: Survives reboots and system updates
- **Clean**: No workarounds or timing issues

## Testing

After completing the steps:

1. **Immediate test**: Press `Super + Z` to open the screenshot UI
2. **Reboot test**: Restart your system and test again to ensure persistence
3. **Functionality test**: Verify you can capture screen areas, windows, and full screen

## The Screenshot UI Features

When you press Super+Z, you'll get Ubuntu's native screenshot interface with options to:
- Select a screen area to capture
- Capture a specific window
- Take a full-screen screenshot  
- Start screen recording
- Save or copy screenshots to clipboard

## Troubleshooting

### Shortcut Not Working
- Ensure you restarted GNOME Shell after making changes
- Check for conflicts with other Super+Z shortcuts
- Verify the setting with the `gsettings get` command

### Setting Not Persisting
- Make sure you cleared custom keybindings in Step 3
- Restart GNOME Shell after making changes
- For Wayland, a full logout/login may be required

### Wrong Tool Opening  
- This method ensures you get the native Ubuntu screenshot tool
- If another tool opens, check for conflicting custom shortcuts

## Why This Method Works

This approach succeeded because it:
1. **Directly modifies the system setting** that controls the native screenshot UI
2. **Clears conflicts** by removing custom keybindings
3. **Uses GNOME's native functionality** instead of workarounds
4. **Properly applies changes** by restarting GNOME Shell

## Alternative: GUI Method

You can also change this through Ubuntu Settings:

1. Open **Settings** → **Keyboard** → **View and Customize Shortcuts**
2. Scroll to **Screenshots** section  
3. Find **"Show the screenshot UI"** (bound to Print Screen)
4. Click on it and press `Super + Z` when prompted
5. Click **Set** to apply

However, the command-line method above is more reliable and ensures proper cleanup of conflicting shortcuts.

---

## Summary

The key to success was using `gsettings` to directly modify GNOME's `show-screenshot-ui` keybinding rather than creating custom shortcuts or using external tools. The critical steps are:

1. Set the native screenshot UI binding to Super+Z
2. Clear any conflicting custom keybindings  
3. Restart GNOME Shell to apply changes
4. Reboot to ensure persistence

This gives you direct access to Ubuntu's built-in screenshot tool with a convenient Super+Z shortcut that works reliably across reboots.

---

## Method Development Notes

This documentation was refined through testing to find the optimal solution. Here are the key changes that led to success:

### Key Changes Made:

1. **Removed all xdotool references** - No longer using workarounds
2. **Focuses on the correct gsettings method** - The one that actually worked
3. **Emphasizes the show-screenshot-ui function** - Ubuntu's native screenshot interface
4. **Includes the critical step of clearing custom keybindings** - This was essential for success
5. **Explains why this method works** - Direct system integration vs workarounds
6. **Mentions the GNOME Shell restart requirement** - Necessary for immediate activation

### The Core Solution:

The documentation shows the simple 5-step process:
1. Check current binding with `gsettings get`
2. Set Super+Z with `gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>z']"`
3. Clear conflicts with `gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"`
4. Verify the setting
5. Restart GNOME Shell

This method:
• Uses Ubuntu's native screenshot tool (the one from the top-right menu)
• Works reliably after reboot
• Requires no external dependencies
• Is the cleanest and most direct approach

The guide is now accurate and will help others achieve the same successful result!
