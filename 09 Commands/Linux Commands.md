# 🐧 Linux Commands

## System
```bash
uname -a
hostnamectl
lscpu
free -h
uptime
```

## Storage
```bash
lsblk
df -h
du -sh *
```

## Processes
```bash
ps aux
top
```

## Services
```bash
systemctl status <service>
systemctl restart <service>
systemctl enable <service>
```

## Networking
```bash
ip addr
ip route
ss -tulpn
ping 8.8.8.8
dig google.com
```

## Logs
```bash
journalctl -xe
journalctl -u <service>
```
