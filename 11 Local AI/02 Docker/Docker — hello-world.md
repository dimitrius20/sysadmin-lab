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
