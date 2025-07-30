#!/bin/bash

# Font Ligatures Setup Script for Ubuntu
# This script installs programming fonts and sets up VS Code for beautiful ligatures

echo "🚀 Setting up Font Ligatures for VS Code on Ubuntu"
echo "=================================================="

# Create fonts directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# Function to install Cascadia Code
install_cascadia() {
    echo "📥 Installing Cascadia Code..."
    cd ~/Downloads
    
    # Download Cascadia Code
    wget -O CascadiaCode.zip "https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip"
    
    # Extract and install
    unzip -o CascadiaCode.zip
    cp CascadiaCode-2111.01/ttf/*.ttf ~/.local/share/fonts/
    
    # Cleanup
    rm -rf CascadiaCode.zip CascadiaCode-2111.01/
    
    echo "✅ Cascadia Code installed successfully!"
}

# Function to install Fira Code
install_fira() {
    echo "📥 Installing Fira Code..."
    
    # Try installing from repositories first
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y fonts-firacode
        echo "✅ Fira Code installed from repositories!"
    else
        # Manual installation
        cd ~/Downloads
        wget -O FiraCode.zip "https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
        unzip -o FiraCode.zip
        cp Fira_Code_v6.2/ttf/*.ttf ~/.local/share/fonts/
        rm -rf FiraCode.zip Fira_Code_v6.2/
        echo "✅ Fira Code installed manually!"
    fi
}

# Function to install JetBrains Mono
install_jetbrains() {
    echo "📥 Installing JetBrains Mono..."
    cd ~/Downloads
    
    # Download JetBrains Mono
    wget -O JetBrainsMono.zip "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip"
    
    # Extract and install
    unzip -o JetBrainsMono.zip
    cp JetBrainsMono-2.304/fonts/ttf/*.ttf ~/.local/share/fonts/
    
    # Cleanup
    rm -rf JetBrainsMono.zip JetBrainsMono-2.304/
    
    echo "✅ JetBrains Mono installed successfully!"
}

# Ask user which fonts to install
echo "Which fonts would you like to install?"
echo "1) Cascadia Code (Recommended)"
echo "2) Fira Code"
echo "3) JetBrains Mono"
echo "4) All fonts"
echo "5) Skip font installation"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        install_cascadia
        ;;
    2)
        install_fira
        ;;
    3)
        install_jetbrains
        ;;
    4)
        install_cascadia
        install_fira
        install_jetbrains
        ;;
    5)
        echo "⏭️ Skipping font installation..."
        ;;
    *)
        echo "❌ Invalid choice. Installing Cascadia Code by default..."
        install_cascadia
        ;;
esac

# Refresh font cache
echo "🔄 Refreshing font cache..."
fc-cache -fv

# Check installed fonts
echo "🔍 Checking installed programming fonts..."
echo "Cascadia Code:"
fc-list | grep -i cascadia | head -3
echo "Fira Code:"
fc-list | grep -i fira | head -3
echo "JetBrains Mono:"
fc-list | grep -i jetbrains | head -3

# VS Code settings setup
echo ""
echo "⚙️ VS Code Configuration"
echo "========================"

# Check if VS Code is installed
if command -v code &> /dev/null; then
    echo "✅ VS Code is installed"
    
    # Ask if user wants to backup current settings
    if [ -f ~/.config/Code/User/settings.json ]; then
        read -p "📄 Backup existing VS Code settings? (y/n): " backup
        if [[ $backup =~ ^[Yy]$ ]]; then
            cp ~/.config/Code/User/settings.json ~/.config/Code/User/settings.json.backup
            echo "✅ Settings backed up to settings.json.backup"
        fi
    fi
    
    # Ask if user wants to apply recommended settings
    read -p "🔧 Apply recommended font ligature settings to VS Code? (y/n): " apply_settings
    if [[ $apply_settings =~ ^[Yy]$ ]]; then
        # Create VS Code User directory if it doesn't exist
        mkdir -p ~/.config/Code/User
        
        # Copy the template settings
        if [ -f "vscode-settings-template.json" ]; then
            cp vscode-settings-template.json ~/.config/Code/User/settings.json
            echo "✅ VS Code settings applied successfully!"
        else
            echo "⚠️ Settings template not found. You'll need to configure manually."
        fi
    fi
else
    echo "⚠️ VS Code not found. Please install VS Code first:"
    echo "   wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg"
    echo "   sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/"
    echo "   sudo sh -c 'echo \"deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main\" > /etc/apt/sources.list.d/vscode.list'"
    echo "   sudo apt update && sudo apt install code"
fi

echo ""
echo "🎉 Setup Complete!"
echo "=================="
echo "1. Restart VS Code if it's currently running"
echo "2. Open a code file and test these operators:"
echo "   =>  ->  !=  >=  <=  ===  !==  &&  ||"
echo "3. You should see beautiful arrow symbols and mathematical operators!"
echo ""
echo "📖 For detailed instructions, see: FONT_LIGATURES_SETUP_GUIDE.md"
echo "⚙️ For manual configuration, see: vscode-settings-template.json"
echo ""
echo "Happy coding! 🚀"
