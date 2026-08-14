# 🖥️ SysAdmin Lab

> Практическая лаборатория системного администратора: Linux, Windows, сети, Bash, PowerShell, диагностика и troubleshooting.

Этот репозиторий содержит мои **практические лабораторные работы, конспекты, команды, скрипты и решения реальных IT-задач**.

Цель проекта — систематизировать знания и постепенно собрать практическое портфолио для позиции **Junior System Administrator / IT Support**.

---

## 🎯 Цели

* Изучить администрирование Linux и Windows
* Разобраться в компьютерных сетях
* Научиться диагностировать проблемы
* Освоить Bash и PowerShell
* Практиковаться с пользователями и правами доступа
* Изучить systemd и управление сервисами
* Разобраться с DNS, DHCP и TCP/IP
* Автоматизировать рутинные задачи
* Документировать решения реальных проблем
* Собрать практическое SysAdmin-портфолио

---

## 🐧 Linux

### Основные темы

* Filesystem
* Users & Groups
* Permissions
* Processes
* Services
* systemd
* SSH
* Networking
* DNS
* Logs
* Package management
* Storage
* Disk management
* Bash
* Troubleshooting

### Примеры команд

```bash
# Информация о системе
uname -a
hostnamectl
lsb_release -a

# Процессор и память
lscpu
free -h

# Диски
lsblk
df -h
du -sh *

# Процессы
ps aux
top

# Сервисы
systemctl status sshd
systemctl restart sshd
systemctl enable sshd

# Логи
journalctl -xe
journalctl -u sshd

# Сеть
ip addr
ip route
ping 8.8.8.8
ss -tulpn

# DNS
dig google.com
nslookup google.com
```

---

## 🪟 Windows

### Основные темы

* Windows administration
* PowerShell
* CMD
* Users & Groups
* Services
* Processes
* Event Viewer
* Networking
* Firewall
* Disk management
* System diagnostics
* Troubleshooting

### Полезные команды

```powershell
# Информация о системе
systeminfo

# Сетевые настройки
ipconfig /all

# Проверка соединения
ping 8.8.8.8

# DNS
nslookup google.com

# Таблица маршрутизации
route print

# Сетевые соединения
Get-NetTCPConnection

# Процессы
Get-Process

# Службы
Get-Service

# Проверка диска
Get-Volume

# Информация о компьютере
Get-ComputerInfo
```

---

## 🌐 Networking

Изучаем сетевые технологии от базового уровня до практической диагностики.

### Темы

* OSI Model
* TCP/IP
* IPv4
* IPv6
* Subnetting
* CIDR
* MAC addresses
* ARP
* ICMP
* TCP
* UDP
* DNS
* DHCP
* NAT
* Routing
* Ports
* Firewall
* VPN

### Диагностика

```text
Client
  │
  ▼
Network Adapter
  │
  ▼
Default Gateway
  │
  ▼
Internet
  │
  ▼
DNS
  │
  ▼
Remote Server
```

### Базовый алгоритм диагностики

```text
1. Проверить IP
2. Проверить Gateway
3. Проверить доступность Gateway
4. Проверить Internet по IP
5. Проверить DNS
6. Проверить маршрут
7. Проверить firewall
8. Проверить конкретный сервис/порт
```

Пример:

```powershell
ipconfig
ping 192.168.1.1
ping 8.8.8.8
nslookup google.com
```

---

## 👤 Users & Permissions

### Linux

Изучаются:

* Users
* Groups
* UID / GID
* `/etc/passwd`
* `/etc/shadow`
* `/etc/group`
* chmod
* chown
* sudo
* ACL

Примеры:

```bash
id
whoami
groups

sudo useradd testuser
sudo passwd testuser

sudo usermod -aG wheel testuser

chmod 640 file.txt
chown user:group file.txt
```

### Windows

Изучаются:

* Local Users
* Local Groups
* NTFS permissions
* UAC
* Windows services
* PowerShell administration

---

## ⚙️ Services & Processes

### Linux

```bash
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx

ps aux
top
htop
kill PID
```

### Windows

```powershell
Get-Service
Start-Service
Stop-Service
Restart-Service

Get-Process
Stop-Process
```

---

## 🔐 Security

Основы системной безопасности:

* SSH security
* Password policies
* File permissions
* Least privilege
* Firewall
* Open ports
* User management
* Logs
* System updates
* Basic hardening

### Проверка открытых портов Linux

```bash
ss -tulpn
```

### Проверка Windows

```powershell
Get-NetTCPConnection -State Listen
```

---

## 📊 Monitoring & Logs

### Linux

```bash
journalctl
journalctl -xe
journalctl -f

dmesg
uptime
free -h
df -h
```

### Windows

Изучаются:

* Event Viewer
* System logs
* Application logs
* Security logs
* PowerShell event queries
* Performance monitoring

---

## 💻 Bash

Примеры автоматизации:

```bash
#!/bin/bash

echo "System information"

hostname
uptime
free -h
df -h
```

Планируется изучение:

* Variables
* Conditions
* Loops
* Functions
* Arguments
* Exit codes
* Pipes
* Redirection
* Cron
* Bash automation

---

## ⚡ PowerShell

Примеры:

```powershell
Get-Process
Get-Service
Get-ComputerInfo
Get-NetIPConfiguration
Get-NetTCPConnection
```

Планируется изучение:

* Cmdlets
* Variables
* Objects
* Pipelines
* Conditions
* Loops
* Functions
* Scripts
* Error handling
* Automation

---

## 🧪 Labs

Практические лабораторные работы будут добавляться сюда.

### Planned Labs

* [ ] Linux installation & initial configuration
* [ ] Linux users and permissions
* [ ] SSH server
* [ ] Linux networking
* [ ] DNS troubleshooting
* [ ] DHCP
* [ ] systemd services
* [ ] Linux logs
* [ ] Disk and filesystem management
* [ ] Bash automation
* [ ] Windows troubleshooting
* [ ] PowerShell administration
* [ ] Windows networking
* [ ] Firewall troubleshooting
* [ ] Network diagnostics

---

## 🔧 Troubleshooting

Отдельный раздел для реальных проблем и их решений.

Каждая проблема оформляется по схеме:

```text
Problem
   ↓
Symptoms
   ↓
Diagnostics
   ↓
Root Cause
   ↓
Solution
   ↓
Verification
```

### Пример

**Problem:** отсутствует доступ в Internet.

**Diagnostics:**

```powershell
ipconfig
ping 192.168.1.1
ping 8.8.8.8
nslookup google.com
```

**Проверяем:**

1. IP address
2. Subnet mask
3. Default gateway
4. Connectivity to gateway
5. Internet connectivity
6. DNS resolution
7. Firewall
8. Routing

---

## 📁 Repository Structure

```text
sysadmin-lab/
│
├── linux/
│   ├── commands/
│   ├── networking/
│   ├── users-permissions/
│   ├── systemd/
│   ├── storage/
│   └── troubleshooting/
│
├── windows/
│   ├── powershell/
│   ├── networking/
│   ├── services/
│   └── troubleshooting/
│
├── networking/
│   ├── tcp-ip/
│   ├── dns/
│   ├── dhcp/
│   └── troubleshooting/
│
├── scripts/
│   ├── bash/
│   └── powershell/
│
├── labs/
│   ├── linux/
│   ├── windows/
│   └── networking/
│
├── docs/
│   └── notes/
│
└── README.md
```

---

## 📚 Learning Approach

Каждая тема изучается по принципу:

```text
Theory
   ↓
Commands
   ↓
Lab
   ↓
Troubleshooting
   ↓
Documentation
```

Главный приоритет — **практика**, а не только чтение теории.

---

## 🚀 Roadmap

### Level 1 — Fundamentals

* [x] Basic PC troubleshooting
* [x] Windows basics
* [x] Linux basics
* [x] Basic networking
* [ ] Git & GitHub

### Level 2 — Junior SysAdmin

* [ ] Linux administration
* [ ] Windows administration
* [ ] SSH
* [ ] Users & permissions
* [ ] systemd
* [ ] DNS
* [ ] DHCP
* [ ] Firewall
* [ ] Bash
* [ ] PowerShell

### Level 3 — Infrastructure

* [ ] Monitoring
* [ ] Backup
* [ ] Virtualization
* [ ] Advanced networking
* [ ] Automation
* [ ] Security hardening

### Level 4 — Professional

* [ ] Active Directory
* [ ] Enterprise networking
* [ ] Infrastructure monitoring
* [ ] Configuration management
* [ ] CI/CD fundamentals
* [ ] Cloud fundamentals

---

## 🎓 Target Position

Основная карьерная цель:

**Junior System Administrator / IT Support / Junior Infrastructure Engineer**

Этот репозиторий используется как:

* учебная лаборатория;
* база знаний;
* документация;
* портфолио;
* журнал практических работ.

---

## 📌 Status

**In progress 🚧**

Репозиторий постоянно развивается по мере изучения новых технологий и выполнения лабораторных работ.

---

## 👨‍💻 Author

**Dmitry Otroshchenko**

GitHub: [@dimitrius20](https://github.com/dimitrius20)

---

⭐ Если этот репозиторий оказался полезным, можно поставить Star.
