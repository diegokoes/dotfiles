# Configs

## skip discord update check

on .config/discord/settings.json >> "SKIP_HOST_UPDATE": true

## changing login font

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

## less agressive IWD <> NM

```conf
[General]
EnableNetworkConfiguration=false
UseDefaultInterface=true

[Network]
NameResolvingService=systemd
```

## gammastep

> Without uncommenting these, gammastep starts before Wayland

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
