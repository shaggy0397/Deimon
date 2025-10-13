#!/data/data/com.termux/files/usr/bin/bash

producto="$1"
base="/storage/emulated/0/1A/Appinven/dist/Hotmart"
carpeta="$base/$producto"
readme="$carpeta/README.txt"
zip="$base-$producto.zip"

echo "🧠 Generando producto: $producto"
mkdir -p "$carpeta"

# Crear README simbólico
cat <<EOF > "$readme"
Título: $producto
CTA: ¡Domina la automatización repo-ready y publica en Hotmart como un hacker táctil!
EOF

# Crear ZIP táctil
zip -r "$zip" "$carpeta" > /dev/null

# Arte ASCII
echo "╔════════════════════════════════════╗"
echo "║ 🧠 Producto generado               ║"
echo "║ 📘 README: $readme                 ║"
echo "║ 📦 ZIP: $zip                       ║"
echo "║ 🎯 Título: $producto               ║"
echo "╚════════════════════════════════════╝"
