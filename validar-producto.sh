#!/data/data/com.termux/files/usr/bin/bash

producto="$1"
echo "🧠 Validando producto: $producto"

base="/storage/emulated/0/1A/Appinven/dist/Hotmart"
readme="$base/$producto/README.txt"
zip="$base-$producto.zip"
estado="$base/$producto/estado.txt"

mkdir -p "$(dirname "$estado")"

# Validaciones
titulo=$(grep "Título:" "$readme" | cut -d':' -f2 | xargs)
cta=$(grep "CTA:" "$readme" | cut -d':' -f2 | xargs)
zip_ok="❌"
readme_ok="❌"

[ -f "$readme" ] && readme_ok="✅"
[ -f "$zip" ] && zip_ok="✅"

# Guardar estado táctil
echo "🧠 Producto: $producto" > "$estado"
echo "📘 README: $readme_ok" >> "$estado"
echo "📦 ZIP: $zip_ok" >> "$estado"
echo "🎯 Título: $titulo" >> "$estado"
echo "📢 CTA: $cta" >> "$estado"

# Arte ASCII
echo "╔════════════════════════════════════╗"
echo "║ 🧠 Validación de Producto          ║"
echo "║ 📘 README: $readme_ok              ║"
echo "║ 📦 ZIP: $zip_ok                    ║"
echo "║ 🎯 Título: $titulo                 ║"
echo "║ 📢 CTA: $cta                       ║"
echo "╚════════════════════════════════════╝"
