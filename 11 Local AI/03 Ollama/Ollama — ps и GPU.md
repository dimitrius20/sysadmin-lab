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
