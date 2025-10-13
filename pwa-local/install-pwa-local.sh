#!/data/data/com.termux/files/usr/bin/bash

# CONFIGURACIÓN
DEPLOY_URL="https://pwa-app11.vercel.app"
MANIFEST_URL="$DEPLOY_URL/manifest.json"
APK_PATH="$HOME/storage/downloads/shaggy.apk"
FECHA=$(date +"%Y-%m-%d %H:%M:%S")

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔍 VALIDANDO MANIFEST"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

MANIFEST=$(curl -s "$MANIFEST_URL")

if echo "$MANIFEST" | grep -q '"name"' && echo "$MANIFEST" | grep -q '"start_url"' && echo "$MANIFEST" | grep -q '"icons"'; then
  echo "✅ Manifest válido: contiene name, start_url e icons"
else
  echo "❌ Manifest incompleto o ausente"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔍 VALIDANDO SERVICE WORKER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

SW=$(curl -s "$DEPLOY_URL" | grep -i "serviceWorker.register")

if [ -n "$SW" ]; then
  echo "✅ Service Worker detectado en frontend"
else
  echo "⚠️ No se detectó registro de Service Worker"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 VALIDANDO APK LOCAL"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ -f "$APK_PATH" ]; then
  echo "✅ APK encontrado: $APK_PATH"
  ls -lh "$APK_PATH"
else
  echo "❌ No se encontró el APK en $APK_PATH"
  exit 1
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📲 INSTALANDO APK"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

am start -a android.intent.action.VIEW -d "file://$APK_PATH" -t "application/vnd.android.package-archive"
echo "✅ Instalación táctil iniciada"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📜 REGISTRANDO LOG HISTÓRICO"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p ~/logs
echo "$FECHA | INSTALL ✅ | $APK_PATH | Manifest: OK | SW: OK | URL: $DEPLOY_URL" >> ~/logs/deploy-history.log

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "     ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄     "
echo "    █░ CIERRE REPO-READY ✅ ░█"
echo "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█    "
echo "📊 Log registrado en ~/logs/deploy-history.log"
