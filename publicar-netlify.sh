#!/data/data/com.termux/files/usr/bin/bash
# 🚀 publicar-netlify.sh — Sube ZIP repo-ready a Netlify

ZIP=$(ls /storage/emulated/0/1A/Compartido/Appinven-*.zip | tail -n 1)

if [ ! -f "$ZIP" ]; then
  echo "❌ No se encontró ZIP repo-ready en /Compartido"
  echo "⚠️ Ejecuta compartir-repo.sh primero"
  exit 1
fi

echo "📦 ZIP detectado: $ZIP"
echo "🚀 Iniciando deploy táctil a Netlify..."

netlify deploy --prod --dir=/storage/emulated/0/1A/Appinven/dist --message "Deploy repo-ready desde Termux: $ZIP"

echo "
╔════════════════════════════════════╗
║  🚀 Deploy táctil completado ✔️     ║
║  Netlify actualizado con ZIP blindado ║
╚════════════════════════════════════╝

