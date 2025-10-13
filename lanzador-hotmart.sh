#!/data/data/com.termux/files/usr/bin/bash

echo "📂 Abriendo carpeta del producto..."
cd /storage/emulated/0/1A/Appinven/dist/Hotmart/General
ls

echo "📋 Copiando link simbólico al portapapeles..."
echo "https://hotmart.com/producto-general" | termux-clipboard-set

echo "🔗 Generando QR para compartir..."
qrencode -t ANSIUTF8 "https://hotmart.com/producto-general"

echo "✅ Lanzador repo-ready ejecutado con éxito"
