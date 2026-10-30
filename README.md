# dotfiles

CachyOS + Hyprland laptop

## Desktop

* [hypr](hypr/.config/hypr) - window manager
* [wofi](wofi/.config/wofi) - launcher
* [fuzzel](fuzzel/.config/fuzzel) - launcher
* [darkman](darkman) - theme switcher
* [clipse](clipse/.config/clipse) - clipboard manager
* [steam](steam/.local/share/applications) - Steam launcher on the NVIDIA GPU
* [vesktop](vesktop/.config) - Discord client flags
* [gtk](gtk/.config) - GTK 3/4 settings
* [qt](qt/.config) - qt6ct + Kvantum theme
* [mangohud](mangohud/.config/MangoHud) - in-game overlay

## Terminal & Shell

* [ghostty](ghostty/.config/ghostty) - terminal
* [zsh](zsh) - shell
* [git](git) - version control
* [yazi](yazi/.config/yazi) - file manager
* [lsd](lsd/.config/lsd) - ls replacement
* [fastfetch](fastfetch/.config/fastfetch) - system info
* [btop](btop/.config/btop) - resource monitor
* [tealdeer](tealdeer/.config/tealdeer) - tldr client

## Editor

* [zed](zed/.config/zed) - code editor
* [micro](micro/.config/micro) - terminal editor (`$EDITOR`)
* [zathura](zathura/.config/zathura) - PDF viewer

## Music

* [fooyin](fooyin/.config/fooyin) - music player
* [music-discord-rpc](music-discord-rpc/.config/music-discord-rpc) - Discord presence

## System

* [system](system) - system setup

## Install

```bash
cd ~/dotfiles
# folded: the whole config dir becomes a link into the repo
stow btop fastfetch ghostty hypr lsd music-discord-rpc tealdeer wofi yazi zathura
# --no-folding: the target dir also holds app state, so only the files are linked
stow --no-folding clipse darkman fooyin fuzzel git gtk mangohud micro qt steam vesktop zed zsh
```

Run stow as your user, never with sudo. Not stowed on purpose: `~/.config/mimeapps.list` and `~/.config/user-dirs.dirs`. Their tools save by replacing the file, which would silently turn the symlink back into a regular file.
