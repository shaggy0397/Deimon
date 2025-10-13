#!/data/data/com.termux/files/usr/bin/bash
# 🧠 estado-netlify.sh — Detecta si el sitio Netlify está pausado

URL="https://tu-sitio.netlify.app"  # ← reemplaza con tu URL real

echo "🔍 Verificando estado de Netlify: $URL"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" = "200" ]; then
  echo "✅ Sitio activo. Puedes empaquetar."
else
  echo "⚠️ Sitio no responde (HTTP $STATUS)"
  echo "❌ Posible pausa en Netlify o conflicto de deploy"
  exit 1
fi
