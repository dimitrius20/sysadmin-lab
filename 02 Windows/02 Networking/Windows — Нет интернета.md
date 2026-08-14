## 4. Диагностика «нет интернета» в Windows

### Шаг 1 — адаптер
`Win + R → ncpa.cpl`

Проверить, включён ли Wi-Fi/Ethernet и есть ли подключение.

### Шаг 2 — IP
```cmd
ipconfig /all
```

Смотреть: IPv4, Subnet Mask, Default Gateway, DNS Servers, DHCP Server.

### Шаг 3 — роутер
```cmd
ping <Default-Gateway>
```

Если gateway не отвечает, ищем проблему между ПК и локальной сетью.

### Шаг 4 — интернет по IP
```cmd
ping 8.8.8.8
```

### Шаг 5 — DNS
```cmd
nslookup google.com
ping google.com
```

Если `ping 8.8.8.8` работает, а имя не разрешается — подозреваем DNS.

### Дополнительно
```cmd
tracert 8.8.8.8
ipconfig /flushdns
ipconfig /release
ipconfig /renew
```

**Важно:** не применять `flushdns`, `release` или `renew` без понимания причины проблемы.
