## 7. Linux — сеть

Современная базовая команда:
```bash
ip addr
ip route
```

Проверка:
```bash
ping -c 4 8.8.8.8
ping -c 4 google.com
```

DNS:
```bash
resolvectl status
resolvectl query google.com
```

Порты и слушающие сервисы:
```bash
ss -tulpn
```

Маршрут:
```bash
tracepath 8.8.8.8
```

На некоторых системах отдельные утилиты могут отсутствовать; при необходимости их можно установить из репозиториев дистрибутива.
