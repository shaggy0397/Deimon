#!/data/data/com.termux/files/usr/bin/bash
# 🧪 verificar-apk.sh — Analiza firma, tamaño y versión del APK

APK="/storage/emulated/0/1A/Appinven/dist/Appinven.apk"
LOG="/storage/emulated/0/1A/Appinven/log-apk.txt"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo "🔍 Verificando APK: $APK"

if [ ! -f "$APK" ]; then
  echo "$FECHA ❌ APK no encontrado en: $APK" >> "$LOG"
  echo "⚠️ No se puede validar. Verifica empaquetado."
  exit 1
fi

TAMANO=$(du -h "$APK" | cut -f1)
VERSION=$(aapt dump badging "$APK" 2>/dev/null | grep versionName | cut -d"'" -f2)
FIRMA=$(keytool -printcert -jarfile "$APK" 2>/dev/null | grep "Owner" | cut -d":" -f2)

echo "$FECHA ✅ APK detectado: $APK" >> "$LOG"
echo "📦 Tamaño: $TAMANO" >> "$LOG"
echo "🔖 Versión: $VERSION" >> "$LOG"
echo "🔐 Firma: $FIRMA" >> "$LOG"

echo "
╔════════════════════════════════════╗
║  🧪 Validación APK completada ✔️   ║
║  Tamaño: $TAMANO                   ║
║  Versión: $VERSION                 ║
╚════════════════════════════════════╝
"
