# Ubuntu Custom Keybindings

A list of my personalized keyboard shortcuts for Ubuntu (GNOME-based).

## General Navigation
| Shortcut       | Action                     |
|----------------|----------------------------|
| `Super` (Windows key) | Open Activities Overview |
| `Super + A`    | Show All Applications      |
| `Super + E`    | Open File Manager (Nautilus) |
| `Super + S`    | Open Settings              |
| `Super + Z`    | Take a Screenshot (GNOME Screenshot) |

## How to Set These Up

### 1. `Super + E` (File Manager)
```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"