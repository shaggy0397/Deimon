#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "📦 Empaquetador DEIMON → APK repo-ready"
echo "────────────────────────────────────────────"

MANIFEST_URL="https://raw.githubusercontent.com/shaggy0397/Pwa-app11/main/manifest.json"

echo "🔍 Validando acceso a manifest.json..."
curl -s --head "$MANIFEST_URL" | head -n 1 | grep "200 OK" > /dev/null

if [ $? -ne 0 ]; then
  echo "❌ No se pudo acceder al manifest.json. Verifica la URL"
  exit 1
fi

echo "✅ manifest.json accesible"
echo "🚀 Iniciando empaquetado con PWABuilder CLI"
echo "────────────────────────────────────────────"
echo "     _______  _______  __   __  ___   _______ "
echo "    |       ||       ||  | |  ||   | |       |"
echo "    |  _____||   _   ||  |_|  ||   | |  _____|"
echo "    | |_____ |  | |  ||       ||   | | |_____ "
echo "    |_____  ||  |_|  ||       ||   | |_____  |"
echo "     _____| ||       ||   _   ||   |  _____| |"
echo "    |_______||_______||__| |__||___| |_______|"
echo "────────────────────────────────────────────"

npx pwabuilder "$MANIFEST_URL" --platform android

if [ $? -eq 0 ]; then
  echo "✅ APK generado exitosamente"
else
  echo "❌ Error durante el empaquetado"
  exit 1
fi

echo "🔍 Buscando APK generado..."
APK=$(find . -type f -name "*.apk" | head -n 1)

if [ -n "$APK" ]; then
  echo "📦 APK encontrado: $APK ($(du -h "$APK" | cut -f1))"
  echo "🚀 Puedes instalarlo con:"
  echo "am start -a android.intent.action.VIEW -d \"file://$(realpath "$APK")\" -t \"application/vnd.android.package-archive\""
else
  echo "❌ No se encontró el archivo APK generado"
fi

echo "────────────────────────────────────────────"
echo "🏁 Fin del empaquetado repo-ready DEIMON"
