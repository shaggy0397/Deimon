#!/data/data/com.termux/files/usr/bin/bash

echo "📊 Generando resumen global repo-ready..."

base="/storage/emulated/0/1A/Appinven/dist/Hotmart"
logdir="/storage/emulated/0/1A/Appinven/logs"
resumen="$logdir/resumen-global.txt"

# 🛡️ Crear carpeta logs antes de escribir
mkdir -p "$logdir"

# 🧾 Iniciar archivo resumen
{
echo "╔════════════════════════════════════════╗"
echo "║     🧠 Resumen Global de Productos     ║"
echo "╠════════════════════════════════════════╣"
} > "$resumen"

# 🔍 Recorrer productos
for carpeta in "$base"/*; do
  [ -d "$carpeta" ] || continue
  nicho=$(basename "$carpeta")
  estado="$carpeta/estado.txt"

  echo "🧠 Producto: $nicho"
  echo "║ 🔍 $nicho" >> "$resumen"

  if [ -f "$estado" ]; then
    grep "❌" "$estado" >> "$resumen"
    grep "⚠️" "$estado" >> "$resumen"
    grep "✅" "$estado" >> "$resumen"
    grep "🔁" "$estado" >> "$resumen"
    grep "📤" "$estado" >> "$resumen"
  else
    echo "║ ❌ No se encontró estado.txt" >> "$resumen"
  fi

  echo "╠────────────────────────────────────────╣" >> "$resumen"
done

echo "╚════════════════════════════════════════╝" >> "$resumen"

# 📄 Mostrar resumen táctil
cat "$resumen"
echo "📄 Resumen guardado en: $resumen"
