# Configs

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

## skip discord update check

<details>
<summary>View config</summary>

on .config/discord/settings.json >> "SKIP_HOST_UPDATE": true

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

## gammastep

> Without uncommenting these, gammastep starts before Wayland

<details>
<summary>View systemd override</summary>

### Editing /home/koes/.config/systemd/user/gammastep.service.d/ove>

### Anything between here and the comment below will become the con>

### Edits below this comment will be discarded

### /usr/lib/systemd/user/gammastep.service

# [Unit]

# Description=Display colour temperature adjustment

# PartOf=graphical-session.target

# After=graphical-session.target

#

# [Service]

# ExecStart=/usr/bin/gammastep

# Restart=on-failure

#

# [Install]

# WantedBy=graphical-session.target

</details>
