
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

- An **Ubuntu system running the GNOME desktop environment**. This guide is specifically for GNOME and may not work on other desktop environments like KDE or XFCE.
- A stable **internet connection** for downloading themes, software, and updates.
- **Basic knowledge of the terminal**. You should be comfortable opening a terminal and running commands.

---

## Part 1: The Core macOS Transformation

This part covers the essential visual changes to make your desktop look and feel like macOS, from the application windows to the lockscreen.

### Step 1: Install Essential Tools & Dependencies

First, we need to get our system ready by updating package lists and installing the necessary tools for theme management, extensions, and building software.

```bash
# Update your package list to ensure you get the latest software versions.
# This is a critical first step before installing any new packages.
sudo apt update

# Install core tools:
# - git: For downloading themes and software from repositories like GitHub.
# - curl: A tool for transferring data with URLs, used by many scripts.
# - gnome-tweaks: The essential graphical tool for customizing the GNOME desktop.
# - gnome-shell-extensions: Provides the underlying framework for running GNOME extensions.
sudo apt install -y git curl gnome-tweaks gnome-shell-extensions

# Install the browser connector. This allows you to install GNOME extensions
# directly from the official website (extensions.gnome.org) with one click.
sudo apt install -y chrome-gnome-shell

# Install Ubuntu Restricted Extras. This package includes essential multimedia codecs
# for playing common audio and video formats (like MP3, MP4) and other proprietary software.
sudo apt install -y ubuntu-restricted-extras
```

### Step 2: Download the macOS Themes & Icons

We will use the popular "WhiteSur" theme, which is a fantastic open-source clone of the macOS Big Sur/Monterey aesthetic.

```bash
# Navigate to your home directory to keep our downloads organized.
cd ~

# Clone the WhiteSur GTK theme repository. This contains the theme for applications, the shell, and the lockscreen.
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

# Clone the WhiteSur icon theme repository. This will give us the macOS-style icons.
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
```

### Step 3: Install the WhiteSur GTK & Lockscreen (GDM) Theme

Now we run the installation scripts from the repositories we just downloaded.

```bash
# Navigate into the theme directory.
cd WhiteSur-gtk-theme

# Run the installer script. We are passing flags to specify the style:
# --monterey: Use the Monterey style.
# --color dark: Use the dark version of the theme.
./install.sh --monterey --color dark

# Now, install the theme for the GDM (login/lockscreen). This requires root permissions.
# -c dark: Specifies the dark theme for the lockscreen as well.
sudo ./tweaks.sh --gdm -c dark

# Navigate back to the home directory.
cd ~
```

### Step 4: Install the WhiteSur Icon Theme

Next, install the matching macOS-style icons.

```bash
# Navigate into the icon theme directory.
cd WhiteSur-icon-theme

# Run the installer script. This will make the icons available to the system.
./install.sh

# Navigate back to the home directory.
cd ~
```

### Step 5: Apply the Themes and Configure the System

With everything installed, we can now enable the new look using `gnome-tweaks` or the command line.

```bash
# Enable the "User Themes" extension, which is required to apply a custom shell theme.
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Apply the WhiteSur GTK theme for all application windows.
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"

# Apply the WhiteSur shell theme for the top bar, activities overview, etc.
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Dark"

# Apply the WhiteSur icon theme.
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"

# Set the color scheme to prefer dark themes globally. This tells applications that support
# both light and dark modes to default to their dark version.
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

### Step 6: Set the macOS Wallpaper

A desktop isn't complete without a matching wallpaper.

```bash
# Set the wallpaper for both the light and dark modes to ensure it's always visible.
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/WhiteSur-gtk-theme/src/assets/gnome-shell/backgrounds/background-default.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/WhiteSur-gtk-theme/src/assets/gnome-shell/backgrounds/background-default.png"
```

---

## Part 2: Advanced Customization & Alternatives

This section covers alternative themes, more visual tweaks, and powerful GNOME extensions.

### Alternative Theme: The Complete McMojave Look

If you prefer the classic aesthetic of macOS Mojave, the same developer provides a complete theme set for it.

#### 1. Download the McMojave GTK and Icon Themes

```bash
# Navigate to your home directory
cd ~

# Clone the GTK theme repository for McMojave
git clone https://github.com/vinceliuice/McMojave-gtk-theme.git

# Clone the Icon theme repository
git clone https://github.com/vinceliuice/McMojave-circle.git
```

#### 2. Install the McMojave GTK and Icon Themes

```bash
# Install the GTK Theme
cd McMojave-gtk-theme
./install.sh
cd ~

# Install the Icon Theme
cd McMojave-circle
./install.sh
cd ~
```

#### 3. Apply the McMojave Theme

To switch to the McMojave theme, use GNOME Tweaks or run these commands:

```bash
# Apply the McMojave GTK (application) theme
gsettings set org.gnome.desktop.interface gtk-theme "McMojave-dark"

# Apply the McMojave Shell theme
gsettings set org.gnome.shell.extensions.user-theme name "McMojave-dark"

# Apply the McMojave icon theme
gsettings set org.gnome.desktop.interface icon-theme "McMojave-circle"
```

### GNOME Extensions for a Better Workflow

Install the **Extension Manager** app (`sudo apt install -y gnome-shell-extension-manager`) to easily find and manage these.

- **Blur My Shell**: Adds a beautiful, configurable blur effect to the shell overview and top bar, mimicking macOS's frosted glass look.
- **Burn My Windows**: Adds spectacular, highly customizable animations when opening and closing windows. A must-have for visual flair!
- **Astra Monitor**: A fork of the popular "Vitals" extension that displays CPU, RAM, and network usage directly in your top bar.
- **Compact Quick Settings**: Makes the quick settings panel smaller and more efficient.

### Install a macOS-Style Dock

A dock is a signature element of the macOS desktop. You have two great options.

| Feature         | Plank             | Dash-to-Dock (GNOME Extension) |
|-----------------|-------------------|--------------------------------|
| **Simplicity**  | ⭐⭐⭐⭐⭐            | ⭐⭐⭐                           |
| **Customization**| ⭐⭐                | ⭐⭐⭐⭐⭐                       |
| **Integration** | ⭐⭐⭐              | ⭐⭐⭐⭐⭐                       |
| **Resources**   | Low               | Medium                         |

#### Option A: Plank (Simple & Lightweight)

```bash
sudo apt install -y plank
```
Run `plank` from the terminal. To have it start automatically, search for and open the "Startup Applications" app and add `plank` as an entry.

#### Option B: Dash-to-Dock (Advanced & Integrated)

This is a GNOME extension that transforms the default Ubuntu dock.

```bash
sudo apt install -y gnome-shell-extension-dash-to-dock
gnome-extensions enable dash-to-dock@micxgx.gmail.com
```

#### Configure Dash-to-Dock for macOS-like Behavior

To get the authentic macOS dock experience, configure these settings:

```bash
# Enable click-to-minimize: Clicking on an app icon will minimize the window if it's already active
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Position the dock at the bottom of the screen (like macOS)
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Make the dock extend across the entire bottom of the screen
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Set dock transparency for that sleek macOS look
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.7

# Hide the dock when windows overlap it (macOS behavior)
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

# Enable scroll action to cycle through windows (optional macOS-like feature)
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
```

**What these commands do:**
- `click-action 'minimize'`: Enables the macOS behavior where clicking an active app's icon minimizes its window, clicking again restores it
- `dock-position BOTTOM`: Positions the dock at the bottom like macOS
- `extend-height false`: Prevents the dock from extending to screen edges
- `transparency-mode FIXED` & `background-opacity 0.7`: Adds translucency like macOS dock
- `dock-fixed false` & `intellihide true`: Makes the dock auto-hide when windows overlap
- `scroll-action 'cycle-windows'`: Allows scrolling on icons to cycle through multiple windows of the same app

You can also configure these settings graphically by opening GNOME Tweaks or the Extensions app and navigating to the Dash-to-Dock settings.

---

### Customize Lockscreen Background and User Profile Picture

Complete your macOS transformation by personalizing both your lockscreen background and user profile picture.

#### Install GDM Settings Tool

First, install the tool needed to customize the lockscreen background.

```bash
# Install gdm-settings - a tool to customize GNOME login screen
sudo apt install gdm-settings
```

#### Change Lockscreen Background

**Step 1: Launch GDM Settings**

Open the GDM Settings application from your applications menu, or run it from terminal:

```bash
gdm-settings
```

**Step 2: Set Your Background**

1. Navigate to the **Background** or **Appearance** section
2. Click **Browse** to select your desired image
3. Apply the changes
4. **Log out** to see your new lockscreen background

#### Change User Profile Picture

**Step 1: Open System Settings**

1. Open **Settings** from your applications menu
2. Navigate to the **Users** section

**Step 2: Update Your Picture**

1. Click on your current profile picture
2. Choose from default avatars or select **"Choose a file..."** for a custom image
3. Changes apply immediately

#### Best Practices

| Element | Recommendation |
|---------|----------------|
| **Profile Picture** | Square image (256x256px or larger), PNG/JPEG format |
| **Lockscreen Background** | High-resolution image matching your screen resolution |
| **File Formats** | PNG, JPEG, or JPG for both |

Your lockscreen will now have a unique, personalized appearance that completes the macOS look.

---

## Part 3: System Enhancement & Optimization
This part covers additional software, drivers, and system-level tweaks for better performance and security.

### System Maintenance & Package Management

| Tool / Command         | Description                                                                                                                            |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| `sudo apt upgrade`     | Upgrades all installed packages to their latest versions. Run this regularly to keep your system secure and up-to-date.                 |
| `sudo apt install preload`| `preload` is a daemon that watches the applications you run and pre-loads their components into memory, making them start faster over time.    |
| **Nala Package Manager** | A faster, more user-friendly frontend for `apt` with parallel downloads and a clean interface.                                           |
| **Synaptic**           | A powerful graphical package manager for `apt`. A great tool for advanced package management. `sudo apt install -y synaptic`             |
| **BleachBit**          | A system cleaning tool to free up disk space by deleting temporary files, caches, and more. `sudo apt install -y bleachbit`           |

#### Using Nala

```bash
# Install Nala
sudo apt install -y nala

# Use nala to test and find the fastest package mirrors for your location.
# This can significantly speed up downloads.
sudo nala fetch

# Now, use nala instead of apt for a better experience.
sudo nala install <package-name>
sudo nala upgrade
```

### Hardware & Drivers

- **Select Best Server**: Open `Software & Updates` -> `Ubuntu Software` -> `Download from:`. Click `Select Best Server` to automatically find the fastest package server for you.
- **Install Additional Drivers**: Open `Software & Updates` -> `Additional Drivers`. The system will search for proprietary drivers (e.g., for NVIDIA graphics cards, Wi-Fi adapters). Installing these is crucial for optimal performance.
- **Automatic Driver Installation**: For a command-line approach, you can run `sudo ubuntu-drivers autoinstall`.

### Security: Firewall & Hardening

#### Firewall with GUFW

`gufw` is a simple graphical interface for the Uncomplicated Firewall (ufw), which is built into Ubuntu.

```bash
sudo apt install -y gufw
```
Open **GUFW Firewall** from your applications, enable it, and keep the default `incoming: deny`, `outgoing: allow` for solid baseline security.

#### System Hardening Tools

For advanced users, these tools can help detect potential security threats.

```bash
# Install a suite of security scanning tools
sudo nala install -y rkhunter chkrootkit clamav debsums
```

| Tool                      | Description                                                                       |
|---------------------------|-----------------------------------------------------------------------------------|
| `rkhunter` / `chkrootkit` | Scans your system for rootkits, backdoors, and local exploits.                    |
| `clamav`                  | An open-source antivirus engine for detecting trojans, viruses, & other malware.    |
| `debsums`                 | Verifies the integrity of installed package files against their official checksums. |

### Performance Optimization

#### Speed Up DNS Lookups

1.  Go to **Settings > Wi-Fi** (or **Network**), click the gear icon for your connection.
2.  On the **IPv4** tab, disable **Automatic** DNS and enter `8.8.8.8, 8.8.4.4` (Google) or `1.1.1.1, 1.0.0.1` (Cloudflare).
3.  On the **IPv6** tab, do the same with `2001:4860:4860::8888, 2001:4860:4860::8844` (Google) or `2606:4700:4700::1111, 2606:4700:4700::1001` (Cloudflare).

#### Firefox `about:config` Tweaks

1.  Open Firefox, type `about:config` in the address bar, and accept the warning.
2.  Set `layers.acceleration.force-enabled` to `true`.
3.  Set `gfx.webrender.all` to `true`.
4.  Restart Firefox for a snappier, hardware-accelerated browsing experience.

---

## Part 4: Recommended Software & Development

Here is a curated list of software to build a powerful and productive desktop.

### Detailed Software Recommendations

| Category                 | Recommendations & Descriptions                                                                                                                                                                                                                                                               |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Terminals**            | **Warp**: A modern, Rust-based terminal with AI features. **Terminator**: A powerful terminal that supports splitting windows into multiple panes.                                                                                                                                 |
| **Web Browsers**         | **Firefox** (default), **Google Chrome** (for Google ecosystem integration), **Brave** (privacy-focused), **Tor Browser** (for anonymity).                                                                                                                                      |
| **Code Editors & IDEs**  | **VSCode**: The de-facto standard for web and general development. **JetBrains Suite** (IntelliJ, PyCharm, etc.): Powerful, language-specific IDEs for professional development. **Zed** / **Cursor IDE**: Newer, fast, and AI-integrated code editors.                       |
| **API Testing**          | **Postman** / **Insomnia**: Essential tools for developing and testing APIs.                                                                                                                                                                                                    |
| **System & Utilities**   | **htop**: An interactive process monitor. **GDebi**: Installs `.deb` files and handles dependencies. **Synaptic**: GUI for `apt`. **GParted**: The go-to tool for disk partitioning. **Timeshift**: System restore utility, your safety net. **Flameshot**: The best screenshot tool. |
| **Office & Productivity**| **LibreOffice**: A complete, open-source office suite. **OnlyOffice**: very stable and MS looking like but less features compared to LibreOffice, but offers other features.**Obsidian** / **Joplin**: Powerful, Markdown-based note-taking apps.                                                                                                                                              |
| **Gaming & Windows Apps**| **Steam**: The primary platform for gaming on Linux. **Lutris**: A unified manager for games from all sources (Steam, GOG, etc.). **Bottles** / **Winetricks**: Tools to easily manage and run Windows applications and games. **PayOnLinux**: nice GUI for installing windows programs.                                                |
| **Virtualization**       | **VirtualBox**: Simple to use for basic VMs. **QEMU/KVM with Virt-Manager**: The native, high-performance virtualization solution for Linux. `sudo nala install -y virt-manager`                                                                                          |

### Development Environment: MariaDB & phpMyAdmin

```bash
# Install the MariaDB database server and client
sudo nala install -y mariadb-server mariadb-client

# Run the secure installation script to set a root password and secure your database.
sudo mysql_secure_installation

# Install phpMyAdmin, a web-based administration tool for MySQL/MariaDB.
sudo nala install -y phpmyadmin
```

### Command-Line Power-Ups: ZSH with Auto-Suggestions & Highlighting

Transform your terminal into a modern, intelligent tool with Zsh, auto-suggestions, and syntax highlighting. This provides a vastly improved command-line experience with features like command history that appears as you type and color-coded commands.

This setup is based on the guide from [barakacanbyte on GitHub](https://github.com/barakacanbyte/setup-for-auto-completion-and-text-highlighting-on-linux-terminal).

**1. Install Zsh and Plugins**

```bash
# Add the 'universe' repository which contains the necessary plugins
sudo add-apt-repository universe

# Update your package list
sudo apt update

# Install Zsh and the auto-suggestions and syntax-highlighting plugins
sudo apt install -y zsh zsh-syntax-highlighting zsh-autosuggestions
```

**2. Set Zsh as Your Default Shell**

```bash
# Change the default shell for your user to Zsh
chsh -s $(which zsh)
```
**Important**: You must **log out and log back in** for this change to take full effect.

**3. Configure `.zshrc`**

After logging back in, open a new terminal. Zsh will ask you what to do. Press `(2)` to populate your `~/.zshrc` file with the default configuration.

Now, open the configuration file in a text editor:
```bash
nano ~/.zshrc
```

Add the following lines at the **bottom** of the file. This will load the plugins every time you open a new terminal.

```zsh
# Enable syntax highlighting
# This must be sourced at the end of the file.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable auto-suggestions
# This must be sourced at the end of the file.
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Save the file (`Ctrl+O`, `Enter`) and exit (`Ctrl+X`). Restart your terminal, and you will now have a powerful, modern shell.

---

## Part 5: Troubleshooting

If you face a black screen or boot problems, here’s a recovery plan.

1.  Press `Ctrl` + `Alt` + `F3` to open a TTY (a raw terminal).
2.  Log in with your username and password.
3.  If you can't connect to the internet, run `nmtui` to open a terminal GUI for connecting to Wi-Fi.
4.  Free up space if the disk is full. Use `df -h` to check space and `ncdu` (`sudo apt install ncdu`) to find and delete large files.
5.  Run a full system update and attempt to fix any broken packages:
    ```bash
    sudo apt update
    sudo apt install -f
    sudo apt upgrade -y
    ```
6.  Reinstall the core desktop environment:
    ```bash
    sudo apt install --reinstall ubuntu-desktop gnome-tweaks
    ```
7.  For bootloader issues, install and run Boot-Repair:
    ```bash
    sudo add-apt-repository ppa:yannubuntu/boot-repair -y
    sudo apt update
    sudo apt install -y boot-repair && boot-repair
    ```
8.  Reboot your system: `sudo reboot`

---

## 🎉 Finished!

Congratulations! You have now completed a comprehensive transformation and enhancement of your Ubuntu system. Your desktop should not only look like macOS but also be more powerful, customized, and productive. Enjoy your new setup!

