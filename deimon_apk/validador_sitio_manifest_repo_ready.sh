#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🔍 Validador repo-ready: Sitio + Manifest.json"
echo "────────────────────────────────────────────"

SITE_URL="https://shaggy0397.github.io/Pwa-app11/"
MANIFEST_URL="${SITE_URL}manifest.json"
LOG="validador_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Validar sitio activo
echo "🌐 Verificando sitio GitHub Pages..."
curl -s --head "$SITE_URL" | head -n 1 | grep "200 OK" > /dev/null

if [ $? -eq 0 ]; then
  echo "✅ Sitio activo: $SITE_URL" | tee -a "$LOG"
else
  echo "❌ Sitio no responde: $SITE_URL" | tee -a "$LOG"
fi

# Paso 2: Validar manifest.json accesible
echo "📦 Verificando manifest.json..."
curl -s --head "$MANIFEST_URL" | head -n 1 | grep "200 OK" > /dev/null

if [ $? -eq 0 ]; then
  echo "✅ manifest.json accesible: $MANIFEST_URL" | tee -a "$LOG"
else
  echo "❌ manifest.json no accesible: $MANIFEST_URL" | tee -a "$LOG"
fi

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
