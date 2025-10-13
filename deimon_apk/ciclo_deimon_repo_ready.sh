#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🔁 Ciclo maestro DEIMON → APK repo-ready"
echo "────────────────────────────────────────────"

MANIFEST="manifest.json"
MANIFEST_URL="https://raw.githubusercontent.com/shaggy0397/Pwa-app11/main/$MANIFEST"

# Paso 1: Verificar existencia local
if [ ! -f "$MANIFEST" ]; then
  echo "❌ No se encontró $MANIFEST en la carpeta actual"
  exit 1
fi
echo "✅ $MANIFEST existe localmente"

# Paso 2: Agregar y hacer commit si es necesario
if git status | grep -q "$MANIFEST"; then
  echo "📦 Agregando y haciendo commit..."
  git add "$MANIFEST"
  git commit -m "🧩 Añadiendo manifest.json para empaquetado DEIMON"
else
  echo "🔍 $MANIFEST ya está en seguimiento"
fi

# Paso 3: Push táctico
echo "📤 Ejecutando push..."
git push -u origin main

# Paso 4: Validar publicación en GitHub
echo "🔍 Validando acceso público a manifest.json..."
curl -s --head "$MANIFEST_URL" | head -n 1 | grep "200 OK" > /dev/null

if [ $? -ne 0 ]; then
  echo "❌ El manifest.json no está accesible públicamente"
  exit 1
fi
echo "✅ manifest.json publicado correctamente"

# Paso 5: Empaquetado automático
echo "🚀 Iniciando empaquetado con PWABuilder CLI"
npx pwabuilder "$MANIFEST_URL" --platform android

if [ $? -ne 0 ]; then
  echo "❌ Error durante el empaquetado"
  exit 1
fi

# Paso 6: Detectar APK generado
APK=$(find . -type f -name "*.apk" | head -n 1)

if [ -n "$APK" ]; then
  echo "📦 APK generado: $APK ($(du -h "$APK" | cut -f1))"
  echo "🚀 Comando para instalar desde Termux:"
  echo "am start -a android.intent.action.VIEW -d \"file://$(realpath "$APK")\" -t \"application/vnd.android.package-archive\""
else
  echo "❌ No se encontró el archivo APK generado"
fi

echo "────────────────────────────────────────────"
echo "🏁 Ciclo DEIMON cerrado repo-ready"

