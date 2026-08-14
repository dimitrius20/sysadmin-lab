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
