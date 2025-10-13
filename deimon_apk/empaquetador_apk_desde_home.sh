#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🚀 Empaquetador DEIMON → APK repo-ready"
echo "📍 Entorno: $HOME/deimon_apk"
echo "────────────────────────────────────────────"

MANIFEST_URL="https://shaggy0397.github.io/Pwa-app11/manifest.json"
CORDOVA_DIR="cordova"
LOG="empaquetado_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Entrar al entorno limpio
cd "$HOME/deimon_apk" || exit

# Paso 2: Validar acceso al manifest
echo "🔍 Validando acceso público al manifest..."
curl -s --head "$MANIFEST_URL" | head -n 1 | grep "200 OK" > /dev/null
if [ $? -ne 0 ]; then
  echo "❌ El manifest.json no está accesible públicamente" | tee -a "$LOG"
  exit 1
fi
echo "✅ manifest.json accesible" | tee -a "$LOG"

# Paso 3: Eliminar carpeta cordova si existe y no está vacía
if [ -d "$CORDOVA_DIR" ] && [ "$(ls -A $CORDOVA_DIR)" ]; then
  echo "⚠️ Carpeta cordova bloqueando empaquetado. Eliminando..." | tee -a "$LOG"
  rm -rf "$CORDOVA_DIR"
  echo "✅ Carpeta cordova eliminada" | tee -a "$LOG"
fi

# Paso 4: Ejecutar empaquetado con PWABuilder CLI
echo "🚧 Iniciando empaquetado..."
npx pwabuilder "$MANIFEST_URL" --platform android

if [ $? -ne 0 ]; then
  echo "❌ Error durante el empaquetado" | tee -a "$LOG"
  exit 1
fi

# Paso 5: Detectar APK generado
APK=$(find . -type f -name "*.apk" | head -n 1)
if [ -n "$APK" ]; then
  TAMANO=$(du -h "$APK" | cut -f1)
  echo "✅ APK generado: $APK ($TAMANO)" | tee -a "$LOG"
  echo "────────────────────────────────────────────" >> "$LOG"
  echo "📦 Comando táctico para instalación local:" >> "$LOG"
  echo "am start -a android.intent.action.VIEW -d \"file://$(realpath "$APK")\" -t \"application/vnd.android.package-archive\"" >> "$LOG"
else
  echo "❌ No se encontró el archivo APK generado" | tee -a "$LOG"
fi

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
