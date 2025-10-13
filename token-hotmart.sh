#!/data/data/com.termux/files/usr/bin/bash

echo "🔐 Solicitando token Hotmart..."

# Carpeta y archivo
token_path="/storage/emulated/0/1A/Appinven/token.txt"
mkdir -p "$(dirname "$token_path")"

# Encabezado Basic generado previamente
basic="Basic ZmViYTBkOTAtOWY3My00Y2IyLWJkM2MtNDRiNzk3NzNiMzZlOmNlMWFkM2I5LWEyYTItNDYwZC1hNjhiLWU4ZGI2ZDY3NjJiOQ=="

# Solicitud
response=$(curl -s -X POST https://api.hotmart.com/security/oauth/token \
  -H "Authorization: $basic" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials")

# Extraer token
token=$(echo "$response" | grep -o '"access_token":"[^"]*' | cut -d':' -f2 | tr -d '"')

if [ -z "$token" ]; then
  echo "❌ Token no obtenido. Verifica credenciales o flujo OAuth2."
else
  echo "$token" > "$token_path"
  echo "╔════════════════════════════════════╗"
  echo "║ 🔐 Token obtenido y guardado      ║"
  echo "║ 📜 Ruta: $token_path              ║"
  echo "║ 🧠 Listo para publicar en Hotmart ║"
  echo "╚════════════════════════════════════╝"
fi

