#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🔍 Verificador y commit forzado de manifest.json"
echo "────────────────────────────────────────────"

MANIFEST="manifest.json"
MANIFEST_URL="https://raw.githubusercontent.com/shaggy0397/Pwa-app11/main/$MANIFEST"
LOG="verificacion_manifest_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Verificar existencia local
if [ ! -f "$MANIFEST" ]; then
  echo "❌ No se encontró $MANIFEST en la carpeta actual"
  exit 1
fi
echo "✅ $MANIFEST existe localmente"

# Paso 2: Verificar si está en el commit remoto
echo "🔍 Verificando si está en origin/main..."
git fetch origin
git ls-tree -r origin/main --name-only | grep -q "$MANIFEST"

if [ $? -eq 0 ]; then
  echo "✅ $MANIFEST ya está en el commit remoto" | tee -a "$LOG"
else
  echo "❌ $MANIFEST no está en el commit remoto, forzando inclusión..." | tee -a "$LOG"
  git add "$MANIFEST"
  git commit -m "🧩 Forzando inclusión de manifest.json en raíz"
  git push origin main
fi

# Paso 3: Validar publicación en GitHub
echo "🔍 Validando publicación en GitHub..."
curl -s --head "$MANIFEST_URL" | head -n 1 | grep "200 OK" > /dev/null

if [ $? -eq 0 ]; then
  echo "✅ manifest.json publicado correctamente" | tee -a "$LOG"
else
  echo "❌ manifest.json no está accesible públicamente" | tee -a "$LOG"
fi

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
