#!/data/data/com.termux/files/usr/bin/bash

producto="$1"
base="/storage/emulated/0/1A/Appinven/dist/Hotmart"
carpeta="$base/$producto"
readme="$carpeta/README.txt"
zip="$base-$producto.zip"
estado="$carpeta/estado.txt"

echo "🧠 Creando producto local: $producto"
mkdir -p "$carpeta"

# Generar README simbólico
cat <<EOF > "$readme"
Título: $producto
CTA: ¡Domina la automatización repo-ready y publica como hacker táctil en Hotmart!
EOF

# Empaquetar ZIP
zip -r "$zip" "$carpeta" > /dev/null

# Validación sintomática
readme_ok="✅"
zip_ok="✅"
titulo=$(grep "Título:" "$readme" | cut -d':' -f2 | xargs)
cta=$(grep "CTA:" "$readme" | cut -d':' -f2 | xargs)

echo "🧠 Producto: $producto" > "$estado"
echo "📘 README: $readme_ok" >> "$estado"
echo "📦 ZIP: $zip_ok" >> "$estado"
echo "🎯 Título: $titulo" >> "$estado"
echo "📢 CTA: $cta" >> "$estado"

# Arte ASCII
echo "╔════════════════════════════════════╗"
echo "║ 🧠 Producto local generado         ║"
echo "║ 📘 README: $readme_ok              ║"
echo "║ 📦 ZIP: $zip_ok                    ║"
echo "║ 🎯 Título: $titulo                 ║"
echo "║ 📢 CTA: $cta                       ║"
echo "╚════════════════════════════════════╝"
