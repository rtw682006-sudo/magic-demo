#!/bin/bash
# Обновление сайта на Render: коммит + пуш. Render подхватит сам.
set -e
cd "$(dirname "$0")"

if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "${1:-Обновление сайта $(date '+%d.%m.%Y %H:%M')}"
  git push
  echo
  echo "Отправлено. Render соберёт сайт за минуту — статус на dashboard.render.com"
else
  echo "Изменений нет — обновлять нечего"
fi
