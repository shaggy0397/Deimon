#!/bin/bash
clear

echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
echo "🧠 MENÚ TÁCTIL REPO-READY HOTMART"
echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
echo "1️⃣ Generar lote completo"
echo "2️⃣ Regenerar faltantes"
echo "3️⃣ Validar entorno"
echo "4️⃣ Compartir por QR"
echo "5️⃣ Publicar por API"
echo "6️⃣ Salir"
echo "7️⃣ Instalar APK local"
echo "──────────────────────────────────────"
read -p "🧩 Elige una opción: " opcion

case $opcion in
  1)
    echo "📚 Generando lote completo..."
    bash generar_lote.sh
    ;;
  2)
    echo "🔁 Regenerando ebooks faltantes..."
    bash regenerar_faltantes.sh
    ;;
  3)
    echo "🧪 Validando entorno repo-ready..."
    bash diagnostico.sh
    ;;
  4)
    echo "📲 Compartiendo último ebook por QR..."
    bash compartir.sh
    ;;
  5)
    echo "🚀 Publicando por API con token..."
    bash publicar.sh
    ;;
  6)
    echo "👋 Cerrando menú táctil. Hasta la próxima."
    exit 0
    ;;
7)
    echo "📲 Instalando APK local por nicho..."
    bash instalar_apk.sh
    ;;
  *)
    echo "❌ Opción inválida. Ejecuta de nuevo."
    ;;
esac
