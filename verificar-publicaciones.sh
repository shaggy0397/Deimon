#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Verificando estado de productos repo-ready..."

base="/storage/emulated/0/1A/Appinven/dist/Hotmart"
log="/storage/emulated/0/1A/Appinven/logs/publicacion-hotmart.log"

for carpeta in "$base"/*; do
  [ -d "$carpeta" ] || continue
  nicho=$(basename "$carpeta")
  readme="$carpeta/README.txt"
  zipfile="/storage/emulated/0/1A/Appinven/dist/Hotmart-$nicho.zip"
  estado="$carpeta/estado.txt"

  echo "🧠 Producto: $nicho"

  # 🧾 Generar estado.txt con arte ASCII
  echo "╔════════════════════════════╗" > "$estado"
  echo "║ 🧠 Producto: $nicho" >> "$estado"

  # Validar README
  if [ ! -f "$readme" ]; then
    echo "║ ❌ README no encontrado" >> "$estado"
  elif [ $(wc -l < "$readme") -lt 5 ]; then
    echo "║ ⚠️ README incompleto (<5 líneas)" >> "$estado"
  else
    echo "║ ✅ README válido" >> "$estado"
  fi

  # Validar ZIP
  if [ -f "$zipfile" ]; then
    echo "║ ✅ ZIP encontrado" >> "$estado"
  else
    echo "║ ❌ ZIP faltante" >> "$estado"
  fi

  # Validar publicación
  if grep -q "$zipfile" "$log"; then
    echo "║ 🔁 Ya publicado según log" >> "$estado"
  else
    echo "║ 📤 Aún no publicado" >> "$estado"
  fi

  echo "╚════════════════════════════╝" >> "$estado"

  # Mostrar resumen táctil
  cat "$estado"
  echo "📄 Estado guardado en: $estado"
  echo "──────────────────────────────"
done
