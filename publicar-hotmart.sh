#!/data/data/com.termux/files/usr/bin/bash

producto="$1"
base="/storage/emulated/0/1A/Appinven/dist/Hotmart"
readme="$base/$producto/README.txt"
zip="$base-$producto.zip"
log="/storage/emulated/0/1A/Appinven/logs/publicacion-hotmart.log"
token_path="/storage/emulated/0/1A/Appinven/token.txt"

mkdir -p "$(dirname "$log")"

# Extraer datos
titulo=$(grep "Título:" "$readme" | cut -d':' -f2 | xargs)
cta=$(grep "CTA:" "$readme" | cut -d':' -f2 | xargs)
token=$(cat "$token_path")

# Enviar publicación
response=$(curl -s -X POST https://api.hotmart.com/products \
  -H "Authorization: Bearer $token" \
  -F "title=$titulo" \
  -F "description=$cta" \
  -F "file=@$zip")

echo "$response" > "$log"

# Confirmación visual
echo "╔════════════════════════════════════╗"
echo "║ 🚀 Producto enviado a Hotmart      ║"
echo "║ 🎯 Título: $titulo                 ║"
echo "║ 📢 CTA: $cta                       ║"
echo "║ 📦 ZIP: $zip                       ║"
echo "║ 📜 Log: $log                       ║"
echo "╚════════════════════════════════════╝"
