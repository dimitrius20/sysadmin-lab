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
