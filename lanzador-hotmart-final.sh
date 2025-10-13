#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 Lanzador repo-ready para producto Hotmart"

# Ruta del README
readme="/storage/emulated/0/1A/Appinven/dist/Hotmart/General/README.txt"

# 🧠 Validación sintomática profunda
if [ ! -f "$readme" ]; then
  echo "⚠️ README no existe. Activando regenerador..."
  bash /storage/emulated/0/1A/Appinven/scripts/generar-producto-hotmart.sh
elif [ $(wc -l < "$readme") -lt 5 ]; then
  echo "⚠️ README incompleto (<5 líneas). Activando regenerador..."
  bash /storage/emulated/0/1A/Appinven/scripts/generar-producto-hotmart.sh
else
  echo "✅ README válido"
fi

# 📋 Extraer link y nicho desde el README
link=$(grep -o 'https://[^ ]*' "$readme")
nicho=$(grep "Título:" "$readme" | cut -d' ' -f4 | tr -d '\n')

# 📂 Abrir carpeta del producto
cd /storage/emulated/0/1A/Appinven/dist/Hotmart/$nicho
ls

# 📋 Copiar al portapapeles
echo "$link" | termux-clipboard-set
echo "📎 Link copiado al portapapeles: $link"

# 🔳 Generar QR en pantalla
qrencode -t ANSIUTF8 "$link"

# 🖼️ Guardar QR como imagen PNG
mkdir -p /storage/emulated/0/1A/Appinven/qrs
qrencode -o /storage/emulated/0/1A/Appinven/qrs/hotmart-$nicho.png "$link"
echo "🖼️ QR guardado como: hotmart-$nicho.png"

# 🧠 Validación sintomática del ZIP
zipfile="/storage/emulated/0/1A/Appinven/dist/Hotmart-$nicho.zip"
if [ -f "$zipfile" ]; then
  echo "✅ ZIP encontrado: $zipfile"
else
  echo "⚠️ ZIP no encontrado. Reejecutando generador..."
  bash /storage/emulated/0/1A/Appinven/scripts/generar-producto-hotmart.sh
fi

echo "🎯 Lanzador ejecutado con éxito para el nicho: $nicho"
