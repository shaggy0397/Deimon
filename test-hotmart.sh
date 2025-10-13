#!/data/data/com.termux/files/usr/bin/bash

echo "🔐 Validando credenciales Hotmart..."

log="/storage/emulated/0/1A/Appinven/logs/test-hotmart.log"
mkdir -p "$(dirname "$log")"

response=$(curl -s -X POST https://api.hotmart.com/security/oauth/token \
  -H "Authorization: Basic ZmViYTBkOTAtOWY3My00Y2IyLWJkM2MtNDRiNzk3NzNiMzZlOmNlMWFkM2I5LWEyYTItNDYwZC1hNjhiLWU4ZGI2ZDY3NjJiOQ==" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "User-Agent: Mozilla/5.0" \
  -d "grant_type=client_credentials")

echo "$response" > "$log"

access_token=$(echo "$response" | grep -o '"access_token":"[^"]*' | cut -d':' -f2 | tr -d '"')

if [ -z "$access_token" ]; then
  echo "❌ Token no obtenido. Verifica credenciales o tipo de flujo."
  echo "📜 Log guardado en: $log"
  echo "╔════════════════════════════╗"
  echo "║ ❌ Error en autenticación  ║"
  echo "║ 🔍 Verifica client_id      ║"
  echo "║ 🔐 Revisa flujo OAuth2     ║"
  echo "╚════════════════════════════╝"
else
  echo "✅ Token obtenido: ${access_token:0:10}... (oculto)"
  echo "📜 Log guardado en: $log"
  echo "╔════════════════════════════╗"
  echo "║ 🔐 Token válido confirmado ║"
  echo "║ 🧠 Listo para publicar      ║"
  echo "╚════════════════════════════╝"
fi
