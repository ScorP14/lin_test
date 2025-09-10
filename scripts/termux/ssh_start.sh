#!/bin/bash

SSHD_CONFIG="$HOME/.config/ssh/sshd_config"

cleanup() {
    pkill sshd
    echo "Получен сигнал завершения. Останавливаем sshd..."
    exit 0
}

trap cleanup SIGINT SIGTERM

if [ ! -f "$SSHD_CONFIG" ]; then
    echo "Ошибка: Не найден конфигурационный файл: $SSHD_CONFIG"
    exit 1
fi

echo "Запускаем SSH-сервер..."
echo "Используется конфигурация: $SSHD_CONFIG"
echo "Для остановки нажмите Ctrl+C"

# -D: Не отключаться от терминала и не демонизироваться
# -e: Логировать ошибки в stderr вместо syslog
# -f: Указать путь к конфигурационному файлу
sshd -D -e -f $SSHD_CONFIG

# Этот код выполнится только если sshd сам завершится (что маловероятно)
echo "SSH-сервер завершил работу."
