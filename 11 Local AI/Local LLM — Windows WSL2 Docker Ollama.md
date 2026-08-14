# Local LLM на Windows — WSL2 + Docker + Ollama

## Цель

Настроить локальную систему ИИ на Windows:

```text
Windows
│
├── WSL2
│   └── Ubuntu
│
├── Docker Desktop
│
├── Ollama
│   └── Local LLM
│
└── Open WebUI
    └── Web-интерфейс для LLM
```

В дальнейшем можно добавить:
- RAG
- PDF
- OCR
- Web Search
- Vector Database
- несколько LLM
- API
- n8n
- голосовой ввод

---

## 1. Проверка WSL2

### Проверить состояние WSL

```powershell
wsl --status
```

### Посмотреть установленные дистрибутивы

```powershell
wsl -l -v
```

Получено:

```text
NAME      STATE     VERSION
Ubuntu    Running   2
```

### Что означает

- `Ubuntu` — установленный Linux-дистрибутив.
- `Running` — Ubuntu сейчас запущен.
- `2` — используется WSL2.

WSL2 необходим для нормальной работы Linux-контейнеров Docker Desktop.

---

# 2. Docker Desktop

## Проверка Docker CLI

```powershell
docker version
```

Рабочий результат содержит две секции:

```text
Client:
...

Server:
...
```

### Client

Docker CLI на Windows.

### Server

Docker Engine, который фактически запускает контейнеры.

Если есть только `Client`, а `Server` отсутствует — Docker Engine не работает.

---

## Docker Context

Проверить:

```powershell
docker context ls
```

Для Docker Desktop используется:

```text
desktop-linux
```

У нас:

```text
Context: desktop-linux
```

Это правильная конфигурация для Linux-контейнеров.

---

# 3. Проверка Docker Engine

```powershell
docker info
```

Показывает:
- количество контейнеров;
- количество образов;
- storage driver;
- CPU;
- RAM;
- Docker version;
- архитектуру;
- runtime.

---

# 4. Тестовый контейнер

Для проверки Docker:

```powershell
docker run --rm hello-world
```

Получен успешный результат:

```text
Hello from Docker!

This message shows that your installation appears to be working correctly.
```

## Что произошло

Docker:

1. Получил команду от клиента.
2. Подключился к Docker daemon.
3. Скачал образ `hello-world`.
4. Создал контейнер.
5. Запустил контейнер.
6. Получил вывод контейнера.
7. Удалил контейнер благодаря `--rm`.

### Проверка образов

```powershell
docker images
```

---

# 5. Архитектура WSL2 + Docker

```text
Windows
   │
   ▼
WSL2
   │
   ▼
Ubuntu
   │
   ▼
Docker Desktop
   │
   ▼
Docker Engine
   │
   ▼
Linux Containers
```

---

# 6. Аппаратная конфигурация

| Компонент | Значение |
|---|---|
| CPU | Intel Core i5-10400F |
| GPU | AMD Radeon RX 6600 XT |
| VRAM | 8 GB |
| RAM | 64 GB |
| ОС | Windows |
| Linux | Ubuntu через WSL2 |
| Docker | Docker Desktop |
| Ollama | 0.32.9 |

---

# 7. Проверка видеокарты Windows

Команда:

```powershell
Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, AdapterRAM
```

Результат:

```text
AMD Radeon RX 6600 XT
32.0.21045.1000
4293918720
```

Видеокарта:

```text
AMD Radeon RX 6600 XT
```

имеет:

```text
8 GB VRAM
```

---

# 8. Ollama

## Что такое Ollama

Ollama — программа для запуска локальных LLM.

Она позволяет запускать модели непосредственно на компьютере.

Пример:

```text
Ollama
   │
   ├── Qwen
   ├── Llama
   ├── Gemma
   ├── Mistral
   └── другие модели
```

---

# 9. Проверка Ollama

```powershell
ollama --version
```

Текущая версия:

```text
0.32.9
```

---

## Список установленных моделей

```powershell
ollama list
```

Если моделей ещё нет, список будет пустым.

---

# 10. Проверка работающих моделей

```powershell
ollama ps
```

Команда показывает запущенные модели.

Пример:

```text
NAME          ID          SIZE      PROCESSOR
qwen3:8b      xxxxx       5.2 GB    100% GPU
```

Особенно интересен столбец:

```text
PROCESSOR
```

Он показывает, используется ли CPU, GPU или оба.

---

# 11. Первая тестовая модель

Для первого теста:

```powershell
ollama run qwen3:8b
```

Ollama автоматически скачает модель.

После загрузки появится:

```text
>>>
```

Можно отправить:

```text
Привет! Напиши одной фразой, на каком GPU ты работаешь.
```

Выход:

```text
/bye
```

---

# 12. Проверка GPU во время работы модели

Открыть второе окно PowerShell.

В первом:

```powershell
ollama run qwen3:8b
```

Во втором:

```powershell
ollama ps
```

Смотрим:

```text
PROCESSOR
```

Возможные варианты:

```text
100% GPU
```

Модель полностью выполняется на GPU.

Или:

```text
CPU/GPU
```

Часть модели находится в RAM/CPU, часть — в VRAM.

---

# 13. Почему важны 8 GB VRAM

У RX 6600 XT:

```text
VRAM = 8 GB
```

Размер модели зависит от:
- количества параметров;
- квантования;
- контекстного окна;
- архитектуры модели.

Для 8 GB VRAM хорошим стартовым классом обычно являются модели около:

```text
7B–8B
```

Большие модели:

```text
14B
32B
70B
```

могут потребовать значительно больше памяти и использовать системную RAM.

---

# 14. AMD и CUDA

Видеокарта:

```text
AMD Radeon RX 6600 XT
```

не использует CUDA.

CUDA — технология NVIDIA.

```text
CUDA → NVIDIA
```

Для AMD используются соответствующие AMD-графические стеки и поддержка конкретного приложения.

Не нужно устанавливать CUDA для запуска LLM на AMD.

---

# 15. Следующая архитектура

После проверки Ollama планируется установить Open WebUI.

```text
                    WINDOWS
                       │
              ┌────────┴────────┐
              │                 │
            WSL2            Ollama
              │                 │
           Ubuntu               │
              │                 │
              └───────┬─────────┘
                      │
                Docker Desktop
                      │
                      ▼
                 Open WebUI
                      │
                      ▼
                 Local LLM
```

---

# 16. Open WebUI

Open WebUI даст браузерный интерфейс вместо терминала.

Вместо:

```powershell
ollama run qwen3:8b
```

будет:

```text
Browser
   │
   ▼
Open WebUI
   │
   ▼
Ollama
   │
   ▼
Qwen / Llama / Mistral / ...
```

---

# 17. План развития

## Этап 1 — базовая инфраструктура

- [x] Windows
- [x] WSL2
- [x] Ubuntu
- [x] Docker Desktop
- [x] Docker Engine
- [x] Проверка `hello-world`
- [x] AMD RX 6600 XT
- [x] Ollama

## Этап 2 — LLM

- [ ] Скачать первую модель
- [ ] Проверить GPU
- [ ] Проверить скорость генерации
- [ ] Подобрать оптимальную модель
- [ ] Настроить контекст

## Этап 3 — Web UI

- [ ] Open WebUI
- [ ] Подключить Ollama
- [ ] Настроить пользователей
- [ ] Настроить хранилище

## Этап 4 — RAG

```text
PDF
 │
 ▼
OCR
 │
 ▼
Text
 │
 ▼
Embeddings
 │
 ▼
Vector DB
 │
 ▼
RAG
 │
 ▼
LLM
```

## Этап 5 — Web Search

```text
User
 │
 ▼
Open WebUI
 │
 ├──── Ollama ────► Local LLM
 │
 └──── Web Search ─► Internet
```

## Этап 6 — автоматизация

```text
n8n
 │
 ├── Telegram
 ├── Email
 ├── Webhooks
 ├── LLM
 └── RAG
```

---

# 18. Полезные команды

## WSL

```powershell
wsl --status
```

```powershell
wsl -l -v
```

```powershell
wsl --shutdown
```

```powershell
wsl -d Ubuntu
```

## Docker

```powershell
docker version
```

```powershell
docker info
```

```powershell
docker context ls
```

```powershell
docker ps
```

```powershell
docker images
```

```powershell
docker run --rm hello-world
```

## Ollama

```powershell
ollama --version
```

```powershell
ollama list
```

```powershell
ollama ps
```

```powershell
ollama run qwen3:8b
```

---

# 19. Текущий статус

```text
Windows
   │
   ├── WSL2                 ✅
   │    └── Ubuntu          ✅
   │
   ├── Docker Desktop       ✅
   │    └── Docker Engine   ✅
   │
   ├── hello-world          ✅
   │
   ├── RX 6600 XT 8 GB      ✅
   │
   └── Ollama 0.32.9        ✅
```

## Следующая задача

Запустить:

```powershell
ollama run qwen3:8b
```

После запуска модели во втором PowerShell:

```powershell
ollama ps
```

По результату `ollama ps` определяем, использует ли Ollama RX 6600 XT и как распределяется модель между GPU и CPU.
