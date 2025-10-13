#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Validando carpeta actual: $(pwd)"
echo "────────────────────────────────────────────"

APK=$(find . -type f -name "*.apk" | head -n 1)
MANIFEST=$(find . -type f -name "manifest.json" | head -n 1)

[ -n "$APK" ] && echo "✅ APK encontrado: $APK ($(du -h "$APK" | cut -f1))" || echo "❌ No se encontró APK"
[ -n "$MANIFEST" ] && echo "✅ manifest.json encontrado" || echo "⚠️ No se encontró manifest.json"

echo "🔐 Validando permisos..."
find . -type f -exec ls -l {} \;

echo "────────────────────────────────────────────"
echo "🎯 Validación completada. Listo para subir si todo está ✅"
