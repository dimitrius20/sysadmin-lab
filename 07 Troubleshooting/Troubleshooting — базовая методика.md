## 11. Troubleshooting — главный навык

Не угадываем причину. Работаем по гипотезам.

### Пример: «Linux-сервер не открывает сайт»
1. Есть ли IP? → `ip addr`
2. Есть ли маршрут? → `ip route`
3. Есть ли связь? → `ping`
4. Слушает ли веб-сервер порт? → `ss -tulpn`
5. Работает ли сервис? → `systemctl status nginx`
6. Что говорят логи? → `journalctl -u nginx`
7. Локально отвечает ли HTTP? → `curl -I http://localhost`
8. Проверить firewall/DNS/reverse proxy.
9. Повторить тест после исправления.
