#!/data/data/com.termux/files/usr/bin/bash

echo "🔔 Activando receptor de eventos Hotmart..."

# Carpeta para logs
logdir="/storage/emulated/0/1A/Appinven/logs/webhook"
mkdir -p "$logdir"

# Lanzar servidor táctil en puerto 8080
php -S 0.0.0.0:8080 -t "$logdir" > /dev/null 2>&1 &

echo "╔════════════════════════════════════╗"
echo "║ 🧠 Webhook activo en puerto 8080   ║"
echo "║ 📥 Carpeta de logs: $logdir        ║"
echo "║ 📡 Esperando eventos de Hotmart... ║"
echo "╚════════════════════════════════════╝"
