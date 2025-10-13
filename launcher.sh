#!/data/data/com.termux/files/usr/bin/bash
# 🧙‍♂️ launcher.sh — Menú táctil para ejecutar tu app desde Termux

clear
echo "
╔════════════════════════════════════╗
║   🚀 Appinven Launcher Repo-Ready   ║
╠════════════════════════════════════╣
║  1️⃣ Validar entorno completo        ║
║  2️⃣ Regenerar archivos clave        ║
║  3️⃣ Ejecutar ritual repo-ready      ║
║  4️⃣ Empaquetar entorno (.tar.gz)    ║
║  5️⃣ Compartir bundle táctil         ║
║  6️⃣ Instalar APK local              ║
║  7️⃣ Publicar en Netlify             ║
║  0️⃣ Salir                           ║
╚════════════════════════════════════╝
"

read -p "🔢 Elige una opción: " opcion

case $opcion i
1)
  echo "🧠 Validando entorno repo-ready..."
  ~/verificar-dependencias.sh
  echo -e "\n───────────────\n"
  ~/listar-archivos.sh
  echo -e "\n🎨 Validación completa. Revisa arte ASCII y logs táctiles."
  ;;
  2) bash ~/regenerar-dist.sh ;;
  3) bash ~/ritual-autocuracion.sh ;;
  4) bash ~/crear-bundle.sh ;;
  5) bash ~/compartir-bundle.sh ;;
  6) bash ~/instalador-local.sh ;;
  7) bash ~/publicar-netlify.sh ;;
  0) echo "👋 Cerrando launcher. Hasta el próximo ritual." ;;
  *) echo "❌ Opción inválida. Intenta de nuevo." ;;
esa
