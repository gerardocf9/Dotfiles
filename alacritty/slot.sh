#!/usr/bin/env bash
set -euo pipefail

# Usa swaymsg si existe, si no i3-msg
MSG_BIN=""
if command -v swaymsg >/dev/null 2>&1; then
  MSG_BIN="swaymsg"
elif command -v i3-msg >/dev/null 2>&1; then
  MSG_BIN="i3-msg"
else
  echo "Necesitas swaymsg o i3-msg instalado." >&2
  exit 1
fi

# Requiere jq para parsear el árbol
if ! command -v jq >/dev/null 2>&1; then
  echo "Instala 'jq' (sudo apt install jq)." >&2
  exit 1
fi

# 1) Descubre qué slots están en uso leyendo marks tipo term:N
USED_SLOTS=$($MSG_BIN -t get_tree \
  | jq -r '.. | objects | select(has("marks")) | .marks[]? | select(test("^term:[0-9]+$")) | capture("term:(?<n>[0-9]+)") | .n' \
  | sort -n | uniq)

# 2) Elige el menor entero positivo libre
slot=1
for n in $USED_SLOTS; do
  if [ "$n" -eq "$slot" ]; then
    slot=$((slot+1))
  else
    break
  fi
done

title="term:$slot"

# 3) Lanza Alacritty con el slot y un título identificable
#    (Wayland: WINIT_UNIX_BACKEND=wayland como ya usas)
env TERMINAL_SLOT="$slot" WINIT_UNIX_BACKEND=wayland \
  alacritty --title "$title" &

# 4) Marca la nueva ventana con term:slot (para que el script la detecte la próxima vez)
#    Espera breve a que aparezca en el árbol
for i in {1..20}; do
  # Intenta marcar por título
  $MSG_BIN "[title=\"$title\"] mark term:$slot" >/dev/null 2>&1 && break
  sleep 0.05
done

# Opcional: mueve el foco a la nueva terminal (suele ser por defecto)
exit 0
