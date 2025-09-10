#!/bin/bash

SSHD_CONFIG="$HOME/.config/ssh/sshd_config"
if [ ! -f "$SSHD_CONFIG" ]; then
    echo "Ошибка: Не найден конфигурационный файл: $SSHD_CONFIG"
    exit 1
fi


# -D: Не отключаться от терминала и не демонизироваться
# -e: Логировать ошибки в stderr вместо syslog
# -f: Указать путь к конфигурационному файлу
sshd -e -f $SSHD_CONFIG &
SSHD_PID=$!
echo "Запущен SSH-сервер(PID=$SSHD_PID)..."
echo "Используется конфигурация: $SSHD_CONFIG"
echo "Для остановки нажмите Ctrl+C"

cleanup() {
    echo "Останавливаем sshd..."
    kill $SSHD_PID 
    wait $SSHD_PID 2>/dev/null
    echo "Успешно остановлен!"
    exit 0
}

trap cleanup SIGINT SIGTERM
# Этот код выполнится только если sshd сам завершится (что маловероятно)
wait $SSHD_PID
echo "SSH-сервер завершил работу."
