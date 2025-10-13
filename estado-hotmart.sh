#!/data/data/com.termux/files/usr/bin/bash

echo "📊 Dashboard repo-ready Hotmart"
base="/storage/emulated/0/1A/Appinven/dist/Hotmart"

find "$base" -name "estado.txt" | while read estado; do
  producto=$(basename "$(dirname "$estado")")
  titulo=$(grep "Título:" "$estado" | cut -d':' -f2 | xargs)
  readme=$(grep "README:" "$estado" | cut -d':' -f2 | xargs)
  zip=$(grep "ZIP:" "$estado" | cut -d':' -f2 | xargs)
  cta=$(grep "CTA:" "$estado" | cut -d':' -f2 | xargs)

  echo "╔════════════════════════════════════╗"
  echo "║ 🧠 Producto: $producto             ║"
  echo "║ 🎯 Título: $titulo                 ║"
  echo "║ 📘 README: $readme                 ║"
  echo "║ 📦 ZIP: $zip                       ║"
  echo "║ 📢 CTA: $cta                       ║"
  echo "╚════════════════════════════════════╝"
done
