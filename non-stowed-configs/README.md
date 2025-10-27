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
