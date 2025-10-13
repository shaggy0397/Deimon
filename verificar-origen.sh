#!/data/data/com.termux/files/usr/bin/bash
# 🧠 verificar-origen.sh — Valida estado Netlify + manifest.json

SITE="https://tu-sitio.netlify.app"  # ← reemplaza con tu URL real
MANIFEST="$SITE/manifest.json"

echo "🔍 Verificando estado de Netlify..."
STATUS_SITE=$(curl -s -o /dev/null -w "%{http_code}" "$SITE")

if [ "$STATUS_SITE" != "200" ]; then
  echo "❌ Sitio no responde (HTTP $STATUS_SITE)"
  echo "⚠️ Posible pausa o conflicto de deploy"
  exit 1
fi

echo "✅ Sitio activo."

echo "🧪 Verificando manifest.json..."
STATUS_MANIFEST=$(curl -s -o /dev/null -w "%{http_code}" "$MANIFEST")

if [ "$STATUS_MANIFEST" != "200" ]; then
  echo "❌ Manifest no accesible (HTTP $STATUS_MANIFEST)"
  echo "⚠️ Verifica rutas o configuración en Netlify"
  exit 1
fi

echo "
╔════════════════════════════════════╗
║  🧠 Origen validado: Netlify + manifest ✔️  ║
╚════════════════════════════════════╝
"
