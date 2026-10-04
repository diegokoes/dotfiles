# dotfiles

CachyOS + Hyprland laptop. One dir = one stow package.

## Desktop

* [hypr](hypr/.config/hypr) – Hyprland (Lua config), hyprlock, hypridle, hyprsunset, scripts.
* [wofi](wofi/.config/wofi) – app launcher.
* [fuzzel](fuzzel/.config/fuzzel) – picker for the wallpaper and project scripts.
* [darkman](darkman) – auto light/dark, plus the GTK switch scripts.
* [clipse](clipse/.config/clipse) – clipboard manager.

## Terminal & Shell

* [ghostty](ghostty/.config/ghostty) – terminal.
* [zsh](zsh) – `.zshrc`, `.zshenv`, `.zprofile` (starts Hyprland on tty1), `.p10k.zsh`.
* [git](git) – `.gitconfig` and global ignore.
* [yazi](yazi/.config/yazi) – file manager, plugins and flavors.
* [lsd](lsd/.config/lsd) – ls replacement.
* [fastfetch](fastfetch/.config/fastfetch) – system info.
* [btop](btop/.config/btop) – resource monitor.
* [tealdeer](tealdeer/.config/tealdeer) – tldr client.

## Editor

* [zed](zed/.config/zed) – settings and keymap.

## Music

* [fooyin](fooyin/.config/fooyin) – music player config and layout.
* [music-discord-rpc](music-discord-rpc/.config/music-discord-rpc) – MPRIS rich presence.

## System

* [system](system) – package lists, pacman/paru/logind conf, and manual setup notes.

- - -

Clone into `~/dotfiles`, then:

```bash
stow hypr wofi ghostty yazi lsd fastfetch btop tealdeer music-discord-rpc
stow --no-folding zsh git zed fuzzel darkman clipse fooyin
```

`--no-folding` links individual files, so app state in those directories stays out of the repo.
