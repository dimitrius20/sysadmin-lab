## 6. Linux — диагностика системы

### ОС и ядро
```bash
hostnamectl
cat /etc/os-release
uname -a
```

### CPU / RAM
```bash
lscpu
free -h
top
```

### Диски
```bash
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINTS
df -h
```

Разница:
- `lsblk` — структура физических/логических блоковых устройств.
- `df -h` — занятое и свободное место смонтированных файловых систем.
