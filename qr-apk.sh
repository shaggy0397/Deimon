#!/data/data/com.termux/files/usr/bin/bash
# 📸 qr-apk.sh — Genera QR del APK y copia ruta al portapapeles táctil

echo "🔍 Buscando APK en carpeta táctil..."
APK_PATH=$(find /storage/emulated/0/1A/Appinven -name "*.apk" | head -n 1)

if [ -z "$APK_PATH" ]; then
  echo "❌ No se encontró ningún APK en /storage/emulated/0/1A/Appinven"
  exit 1
fi

echo "✅ APK detectado:"
echo "$APK_PATH"

# 📋 Copiar ruta al portapapeles táctil
echo "$APK_PATH" | termux-clipboard-set
echo "📋 Ruta copiada al portapapeles táctil"

# 📸 Generar QR
echo "🧪 Generando QR..."
qrencode -t UTF8 <<< "$APK_PATH"

# 🎨 Arte ASCII final
echo "
.-.   .-.   .-.   .-.   .-.   .-.
| Q | | R | | ✔ | | A | | P | | K |
'-'   '-'   '-'   '-'   '-'   '-'
🎯 QR táctil listo para compartir
"
