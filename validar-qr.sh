#!/bin/bash

echo "🔍 Validando QR repo-ready..."

QR="deimon-qr.png"

# Verificar existencia
if [ ! -f "$QR" ]; then
  echo "❌ No se encontró el archivo '$QR'"
  echo "🧩 Verifica si está en /sdcard/Download o renómbralo correctamente"
  exit 1
fi

# Validar formato PNG
file "$QR" | grep -q "PNG image data"
if [ $? -ne 0 ]; then
  echo "⚠️ El archivo '$QR' no es un PNG válido"
  exit 1
fi

# Mostrar detalles
echo "✅ QR encontrado: $QR"
echo "📁 Ruta absoluta: $(realpath "$QR")"
echo "📦 Tamaño: $(du -h "$QR" | cut -f1)"
echo "🧠 Tipo: $(file "$QR")"

# Mostrar preview si tienes 'imgcat' o 'termimage'
if command -v imgcat &> /dev/null; then
  imgcat "$QR"
elif command -v termimage &> /dev/null; then
  termimage "$QR"
else
  echo "🖼️ No se puede mostrar preview en este entorno"
fi

echo "🧙‍♀️ Validación repo-ready completada."
