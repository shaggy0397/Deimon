#!/data/data/com.termux/files/usr/bin/bash

echo "🧪 Simulando evento Hotmart..."

# Carpeta para logs
logdir="/storage/emulated/0/1A/Appinven/logs/simulacion"
mkdir -p "$logdir"

# Datos simbólicos
webhook_url="https://webhook.site/7fc732b6-707d-414b-ae70-1669838e390e"
fecha=$(date +"%Y-%m-%d_%H-%M-%S")
json='{
  "event": "product_created",
  "data": {
    "product": {
      "name": "Curso Repo-Ready",
      "id": "123456789"
    },
    "creator": {
      "name": "Mario",
      "email": "mario@repo.com"
    }
  }
}'

# Enviar evento
response=$(curl -s -X POST "$webhook_url" \
  -H "Content-Type: application/json" \
  -d "$json")

# Guardar log
echo "$json" > "$logdir/evento_$fecha.json"

# Confirmación visual
echo "╔════════════════════════════════════╗"
echo "║ 🧠 Evento simulado enviado         ║"
echo "║ 📦 Tipo: product_created           ║"
echo "║ 📜 Log: evento_$fecha.json         ║"
echo "╚════════════════════════════════════╝"
