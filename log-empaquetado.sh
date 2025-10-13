#!/data/data/com.termux/files/usr/bin/bash
# 🧾 log-empaquetado.sh — Registra empaquetado táctil con fecha y ruta

DEST="/storage/emulated/0/1A/Appinven"
LOG="$DEST/log-empaquetado.txt"
APK_PATH=$(find "$DEST" -name "*.apk" | head -n 1)
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

if [ -z "$APK_PATH" ]; then
  echo "❌ No se encontró APK en $DEST"
  echo "$FECHA ❌ APK no encontrado" >> "$LOG"
else
  echo "✅ APK detectado: $APK_PATH"
  echo "$FECHA ✅ APK generado en: $APK_PATH" >> "$LOG"
fi

echo "🧾 Log actualizado en: $LOG"
