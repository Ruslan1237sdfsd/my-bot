#!/usr/bin/env bash
# anti_pc_shell.sh — минималистичный TUI-шелл для АНТИ-ПК

while true; do
  clear
  echo "==============================="
  echo "        АНТИ-ПК SHELL         "
  echo "==============================="
  echo "1) Проверить температуру"
  echo "2) Обновить систему"
  echo "3) Запустить браузер (w3m)"
  echo "4) Отключиться / Перезагрузить"
  echo "5) Выход"
  echo -n "Выберите действие [1-5]: "
  read -r choice
  case "$choice" in
    1)
      echo -e "\nТемпература:"
      if command -v sensors >/dev/null; then
        sensors
      else
        echo "apt install lm-sensors"
      fi
      echo -n "Нажмите Enter..."
      read
      ;;
    2)
      echo -e "\nОбновление системы..."
      sudo pacman -Syyu
      echo -n "Нажмите Enter..."
      read
      ;;
    3)
      echo -e "\nЗапуск текстового браузера w3m..."
      w3m https://example.com
      ;;
    4)
      echo -e "\n[1] Перезагрузить  [2] Выключить  [другое] Отмена"
      read -r sub
      if [ "$sub" = "1" ]; then sudo reboot; fi
      if [ "$sub" = "2" ]; then sudo poweroff; fi
      ;;
    5)
      echo -e "\nВыход."
      exit 0
      ;;
    *)
      echo "Неверный выбор!"
      sleep 1
      ;;
  esac
done
