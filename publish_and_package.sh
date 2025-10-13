#!/data/data/com.termux/files/usr/bin/bash

# ╔════════════════════════════════════════════╗
# ║   🌐 Publicar PWA en Netlify desde Termux  ║
# ╠════════════════════════════════════════════╣

echo -e "\n🔍 Instalando Netlify CLI..."
npm install -g netlify-cli

echo -e "\n📁 Validando carpeta con index.html y manifest.json..."
ls | grep index.html || echo "❌ Falta index.html"
ls | grep manifest.json || echo "❌ Falta manifest.json"

echo -e "\n🔐 Autenticando en Netlify (requiere navegador)..."
netlify login

echo -e "\n🚀 Publicando carpeta actual como sitio..."
netlify deploy --prod --dir=. --message="PWA repo-ready desde Termux"

echo -e "\n✅ Sitio publicado. Copia la URL del manifest.json:"
echo -e "👉 https://TU-SITIO.netlify.app/manifest.json"

echo -e "\n📦 Usa esa URL en Bubblewrap o PWABuilder para generar tu APK."
