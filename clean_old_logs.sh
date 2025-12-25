#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Использование: $0 /path/to/logs DAYS"
  exit 1
fi

DIR="$1"
DAYS="$2"

FILES=$(find "$DIR" -type f -name "*.log" -mtime +"$DAYS")

if [ -z "$FILES" ]; then
  echo "Файлы для удаления не найдены"
  exit 0
fi

echo "Найдены файлы:"
echo "$FILES"

read -p "Удалить эти файлы? (y/n): " ANSWER

if [ "$ANSWER" = "y" ]; then
  echo "$FILES" | xargs rm
  echo "Файлы удалены"
else
  echo "Удаление отменено"
fi
