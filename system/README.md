# System

Things that live outside `$HOME` or can't be stowed. Paths here mirror `/etc`.

## Files here

| File | Goes to |
|---|---|
| `pacman.conf` | `/etc/pacman.conf` |
| `paru.conf` | `/etc/paru.conf` |
| `systemd/logind.conf.d/10-lid.conf` | `/etc/systemd/logind.conf.d/` (lid switch ignored; stock `logind.conf` stays untouched) |
| `systemd/system/getty@tty1.service.d/override.conf` | `/etc/systemd/system/getty@tty1.service.d/` (tty1 font `ter-132b`, needs `terminus-font`) |
| `systemd/system/NetworkManager-wait-online.service.d/override.conf` | `/etc/systemd/system/NetworkManager-wait-online.service.d/` (5 s timeout) |
| `iwd/main.conf` | `/etc/iwd/main.conf` (iwd only does wifi; NetworkManager handles IP config) |
| `NetworkManager/conf.d/nm.conf` | `/etc/NetworkManager/conf.d/` (iwd as the wifi backend) |
| `tmpfiles.d/msi-ec.conf` | `/etc/tmpfiles.d/` (turbo shift mode at boot, needs `msi-ec-dkms-git`) |
| `tmpfiles.d/pacman-download-cleanup.conf` | `/etc/tmpfiles.d/` (at boot, removes leftover pacman `download-*` dirs) |
| `security/faillock.conf` | `/etc/security/faillock.conf` (`deny = 0`: no lockout after failed logins) |
| `pkglist-native.txt` | explicitly installed repo packages |
| `pkglist-aur.txt` | explicitly installed AUR packages |

Install a file with its parent directory, then reload what uses it:

```bash
sudo install -Dm644 systemd/logind.conf.d/10-lid.conf /etc/systemd/logind.conf.d/10-lid.conf
sudo systemctl reload systemd-logind   # never restart it: that ends the session
sudo systemctl daemon-reload           # after unit drop-ins
```

Regenerate the lists with `./update-pkglists.sh` (as your user, not with sudo). Restore with:

```bash
sudo pacman -S --needed - < pkglist-native.txt
paru -S --needed - < pkglist-aur.txt
```

## pacnew files

Don't overwrite blindly with `pacdiff`. Most of these files are customized, and the stock versions drop things this machine needs: the cachyos repos, active mirrors, locales, limine/snapper settings, the `ES` regdomain, and the resolved stub symlink. Diff the effective lines first:

```bash
diff <(grep -vE '^\s*#|^\s*$' /etc/FILE) <(grep -vE '^\s*#|^\s*$' /etc/FILE.pacnew)
```

## start-wayland script

`~/.zprofile` (tracked in [zsh](../zsh)) auto-starts Hyprland on tty1 login.
