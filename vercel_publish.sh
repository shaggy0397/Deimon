#!/data/data/com.termux/files/usr/bin/bash

# ╔════════════════════════════════════════════╗
# ║   🚀 Publicar PWA en Vercel desde Termux   ║
# ╠════════════════════════════════════════════╣

echo -e "\n🔍 Instalando Vercel CLI..."
npm install -g vercel

echo -e "\n📁 Validando carpeta con index.html y manifest.json..."
ls | grep index.html || echo "❌ Falta index.html"
ls | grep manifest.json || echo "❌ Falta manifest.json"

echo -e "\n🔐 Autenticando en Vercel (requiere navegador)..."
vercel login

echo -e "\n🚀 Publicando carpeta actual como sitio..."
vercel --prod --confirm

echo -e "\n✅ Sitio publicado. Copia la URL del manifest.json:"
echo -e "👉 https://TU-SITIO.vercel.app/manifest.json"

echo -e "\n📦 Usa esa URL en Bubblewrap o PWABuilder para generar tu APK repo-ready."
