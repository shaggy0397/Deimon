#!/data/data/com.termux/files/usr/bin/bash

echo "🧠 Diagnóstico HTTP 302 Hotmart..."

# Token codificado (ejemplo táctil)
basic="Basic TU_CLIENTE_GENERADO"

# Endpoint usado
endpoint="https://api.hotmart.com/products"

# Solicitud
response=$(curl -i -s -X POST "$endpoint" \
  -H "Authorization: $basic" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "User-Agent: Mozilla/5.0" \
  -d "grant_type=client_credentials")

# Diagnóstico visual
codigo=$(echo "$response" | grep HTTP | tail -n1 | awk '{print $2}')
location=$(echo "$response" | grep -i location | cut -d' ' -f2)

echo "╔════════════════════════════════════╗"
echo "║ 🧠 Diagnóstico HTTP                ║"
echo "║ 🔐 Authorization: $basic          ║"
echo "║ 📡 Endpoint: $endpoint            ║"
echo "║ 📥 Código HTTP: $codigo           ║"
echo "║ 🔁 Redirección: $location         ║"
echo "╚════════════════════════════════════╝"
