# System

Things that live outside `$HOME` or can't be stowed.

## Files here

| File | Goes to |
|---|---|
| `logind.conf` | `/etc/systemd/logind.conf` (lid switch ignored) |
| `pacman.conf` | `/etc/pacman.conf` |
| `paru.conf` | `/etc/paru.conf` |
| `pkglist-native.txt` | explicitly installed repo packages |
| `pkglist-aur.txt` | explicitly installed AUR packages |

Regenerate the lists with `./update-pkglists.sh`. Restore with:

```bash
sudo pacman -S --needed - < pkglist-native.txt
paru -S --needed - < pkglist-aur.txt
```

## start-wayland script

Script in `~/.zprofile` to auto-start Hyprland on tty1 login

<details>
<summary>View script</summary>

```bash
─────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
     │ File: .zprofile
   1 │ # Auto-start Hyprland after a successful login on tty1
   2 │ if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "${XDG_VTNR}" = "1" ]; then
   3 │   exec start-hyprland
   4 │ fi
```

</details>

## changing login font

<details>
<summary>View commands</summary>

```bash
sudo systemctl edit getty@tty1.service
sudo systemctl daemon-reload
sudo systemctl restart getty@tty1
sudo systemctl revert getty@tty1.service
sudo systemctl restart getty@tty
```

```toml
[Service]
ExecStartPre=
ExecStartPre=/usr/bin/setfont ter-132b
```

</details>

## less agressive IWD <> NM

<details>
<summary>View config</summary>

```conf
[General]
EnableNetworkConfiguration=false
UseDefaultInterface=true

[Network]
NameResolvingService=systemd
```

</details>

## vesktop wayland support

<details>
<summary>View config</summary>

Edit `/usr/share/applications/vesktop.desktop` and add the `--ozone-platform-hint=auto` flag to the Exec line:

```desktop
Exec=/usr/bin/vesktop --ozone-platform-hint=auto %U
```

</details>
