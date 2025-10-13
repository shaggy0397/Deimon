#!/data/data/com.termux/files/usr/bin/bash
# 🧙‍♂️ ritual-autocuracion.sh — Validación, regeneración, documentación, empaquetado y deploy

echo "
╔════════════════════════════════════╗
║  🧙‍♂️ Iniciando ritual repo-ready total ║
╚════════════════════════════════════╝
"

# 🛡️ Validar entorno y regenerar si falta algo
bash ~/blindaje-total.sh

# 📘 Generar README visual
bash ~/generar-readme.sh

# 📦 Empaquetar entorno repo-ready
bash ~/compartir-repo.sh

# 🚀 Publicar en Netlify
bash ~/publicar-netlify.sh

echo "
╔════════════════════════════════════╗
║  ✅ Ritual completado ✔️            ║
║  Entorno validado, documentado y   ║
║  publicado en Netlify              ║
╚════════════════════════════════════╝
"
