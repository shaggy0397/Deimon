#!/data/data/com.termux/files/usr/bin/bash

echo "🌌 BLINDANDO SH4C3Y - PWA REPO-READY 🌌"

echo "🔍 Validando index.html..."
test -f index.html && echo "✅ index.html OK" || echo "❌ FALTA index.html"

echo "🔍 Validando manifest.json..."
if test -f manifest.json; then
  echo "✅ manifest.json OK"
  grep -q '"start_url":' manifest.json && echo "🔎 start_url detectado" || echo "⚠️ FALTA start_url"
  grep -q '"display":' manifest.json && echo "🔎 display detectado" || echo "⚠️ FALTA display"
else
  echo "❌ FALTA manifest.json"
fi

echo "🔍 Validando íconos..."
grep -q '"icons":' manifest.json && echo "✅ icons OK" || echo "⚠️ FALTA icons"

echo "🛠️ Generando archivo _redirects..."
echo "/*    /index.html   200" > _redirects
echo "✅ _redirects creado"

echo "📦 Validando carpeta de publicación..."
[ -d dist ] && echo "✅ dist OK" || echo "⚠️ No se encontró carpeta dist"

echo "🎯 Blindaje completo. Listo para deploy repo-ready en Netlify."
