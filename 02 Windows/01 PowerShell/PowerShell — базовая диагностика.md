## 2. PowerShell — базовая диагностика

### Система
```powershell
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsArchitecture, CsName
```

### CPU
```powershell
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors
```

### RAM
```powershell
Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer, Capacity, Speed, PartNumber
```

### Диски
```powershell
Get-PhysicalDisk | Select-Object FriendlyName, MediaType, HealthStatus, OperationalStatus, Size
Get-Volume | Select-Object DriveLetter, FileSystem, SizeRemaining, Size
```

### Процессы
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU, Id
```

### Службы
```powershell
Get-Service
Get-Service | Where-Object {$_.Status -eq 'Running'}
```

### Полезные конструкции
- `|` — передаёт результат следующей команде.
- `Where-Object` — фильтрует.
- `Sort-Object` — сортирует.
- `Select-Object` — выбирает поля или количество объектов.
- `Get-Help <команда> -Examples` — примеры использования.
