#!/bin/bash
clear
echo "🌐 Ritual de publicación comercial en Hotmart"

# Validaciones iniciales
if [ ! -f "token.txt" ]; then
  echo "❌ Falta token.txt. Ejecuta obtener_token.sh primero"
  exit 1
fi

if [ ! -f "Desarrollo Personal.zip" ]; then
  echo "❌ Falta ZIP por nicho. Ejecuta empaquetar.sh primero"
  exit 1
fi

# Cargar token
token=$(cat token.txt)

# Endpoint Hotmart (sandbox o producción)
endpoint="https://api-sandbox.hotmart.com/payments/api/v1/products"

# Enviar publicación
echo "📦 Publicando producto..."
respuesta=$(curl -s -X POST "$endpoint" \
  -H "Authorization: Bearer $token" \
  -F "file=@Desarrollo Personal.zip")

# Validación sintomática
if echo "$respuesta" | grep -q "success"; then
  echo "✅ Publicación exitosa en Hotmart"
  echo "$respuesta" > log-publicacion.txt
else
  echo "⚠️ Error en la publicación. Verifica token, ZIP o endpoint"
  echo "$respuesta" > log-error.txt
fi
