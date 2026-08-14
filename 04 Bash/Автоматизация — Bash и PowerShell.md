## 12. Автоматизация

Цель админа — постепенно превращать повторяющиеся действия в скрипты.

### PowerShell
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU, Id
```

### Bash
```bash
df -h
free -h
uptime
```

Следующий уровень: собственные скрипты для отчёта о ПК/сервере, Bash, PowerShell и затем Ansible.
