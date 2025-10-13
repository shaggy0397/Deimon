#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🚀 Empaquetador DEIMON → APK con Bubblewrap"
echo "────────────────────────────────────────────"

SITE_URL="https://shaggy0397.github.io/Pwa-app11/"
LOG="bubblewrap_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Instalar Bubblewrap si no está
echo "🔧 Instalando Bubblewrap..."
npm install -g @bubblewrap/cli

# Paso 2: Inicializar proyecto
echo "📦 Inicializando proyecto desde $SITE_URL..."
bubblewrap init --manifest "$SITE_URL/manifest.json"

# Paso 3: Construir APK
echo "🔨 Construyendo APK..."
bubblewrap build

# Paso 4: Detectar APK generado
APK=$(find . -type f -name "*.apk" | head -n 1)
if [ -n "$APK" ]; then
  TAMANO=$(du -h "$APK" | cut -f1)
  echo "✅ APK generado: $APK ($TAMANO)" | tee -a "$LOG"
  echo "📦 Comando táctico para instalación local:" >> "$LOG"
  echo "am start -a android.intent.action.VIEW -d \"file://$(realpath "$APK")\" -t \"application/vnd.android.package-archive\"" >> "$LOG"
else
  echo "❌ No se encontró el archivo APK generado" | tee -a "$LOG"
fi

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
