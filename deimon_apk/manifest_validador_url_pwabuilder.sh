#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🧩 Validación y publicación de manifest.json"
echo "────────────────────────────────────────────"

# Validar existencia
if [ ! -f "manifest.json" ]; then
  echo "❌ manifest.json no encontrado"
  exit 1
fi

# Validar campos clave
echo "🔍 Validando campos esenciales..."
grep '"name"' manifest.json
grep '"start_url"' manifest.json
grep '"display"' manifest.json
grep '"icons"' manifest.json

# Confirmar modo standalone
if grep -q '"display": "standalone"' manifest.json; then
  echo "✅ PWA confirmada como standalone"
else
  echo "⚠️ El display no está configurado como standalone"
fi

# Publicar en GitHub
echo "🚀 Publicando manifest.json en GitHub..."
git init
git add manifest.json
git commit -m "🧩 Publicación repo-ready de manifest.json para empaquetado PWA"
git branch -M main

echo "📝 Ingresa la URL de tu repositorio GitHub:"
read REPO_URL

git remote add origin "$REPO_URL"
git push -u origin main

# Generar URL pública
RAW_URL=$(echo "$REPO_URL" | sed 's/github.com/raw.githubusercontent.com/')/main/manifest.json

echo "────────────────────────────────────────────"
echo "🌐 URL pública generada:"
echo "$RAW_URL"

# Comando listo para PWABuilder
echo "────────────────────────────────────────────"
echo "📦 Comando para empaquetar desde Termux:"
echo "pwabuilder \"$RAW_URL\" --android"
echo "────────────────────────────────────────────"
