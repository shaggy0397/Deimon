#!/data/data/com.termux/files/usr/bin/bash
# 📲 instalador-local.sh — Instala el APK táctil desde Termux

APK="/storage/emulated/0/1A/Appinven/dist/Appinven.apk"

echo "🔍 Buscando APK en: $APK"

if [ ! -f "$APK" ]; then
  echo "❌ APK no encontrado. Ejecuta empaquetar-pwa.sh primero."
  exit 1
fi

echo "📲 Lanzando instalador táctil..."

am start -a android.intent.action.VIEW -d "file://$APK" -t "application/vnd.android.package-archive"

echo "
╔════════════════════════════════════╗
║  📲 Instalación iniciada ✔️         ║
║  Confirma desde el instalador      ║
╚════════════════════════════════════╝
"
