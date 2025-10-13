#!/bin/bash
clear
echo "📡 Simulación de publicación masiva"
for zip in /storage/emulated/0/DEIMON_CORE/publicacion/*.zip; do
  nombre=$(basename "$zip")
  echo "✅ Simulado: $nombre enviado a Hotmart" >> /storage/emulated/0/DEIMON_CORE/logs/log-publicacion-lote.txt
done
