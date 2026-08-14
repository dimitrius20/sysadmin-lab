## 8. Linux — службы и логи

### systemd
```bash
systemctl status sshd
systemctl start sshd
systemctl stop sshd
systemctl restart sshd
systemctl enable sshd
```

### Логи
```bash
journalctl -b
journalctl -p err -b
journalctl -u sshd
```

Модель:
```text
Симптом → service status → journal → причина → исправление → повторная проверка
```
