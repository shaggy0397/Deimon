#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Iniciando validación repo-ready para instalación de APK sin PC..."
echo "📁 Carpeta actual: $(pwd)"
echo "────────────────────────────────────────────"

check_file() {
  if [ -f "$1" ]; then
    echo "✅ $1 encontrado"
  else
    echo "❌ $1 faltante"
  fi
}

check_file "AndroidManifest.xml"
check_file "build.gradle"
check_file "package.json"
check_file "index.html"
check_file "manifest.json"

APK=$(find . -type f -name "*.apk" | head -n 1)
if [ -n "$APK" ]; then
  SIZE=$(du -h "$APK" | cut -f1)
  echo "📦 APK encontrado: $APK ($SIZE)"
else
  echo "⚠️ No se encontró ningún archivo APK"
fi

if [ -n "$APK" ]; then
  BYTES=$(stat -c%s "$APK")
  if [ "$BYTES" -gt 102400 ]; then
    echo "✅ Tamaño del APK es suficiente"
  else
    echo "❌ APK demasiado pequeño, posible error de build"
  fi
fi

echo "🔐 Validando permisos..."
find . -type f -name "*.sh" -exec ls -l {} \;

if grep -q '"display": "standalone"' manifest.json 2>/dev/null; then
  echo "🧩 PWA detectada y lista para empaquetado"
else
  echo "⚠️ manifest.json no indica PWA standalone"
fi

echo "────────────────────────────────────────────"
echo "🎯 Validación completada. Listo para subir a GitHub si todo está ✅"
