#!/bin/bash
echo "🚀 Lanzando MemoMind en entorno local..."

cd ~/DigitalMindOS/modules/memo-mind
python3 -m http.server 8080

echo "🌐 Accede a http://localhost:8080 desde tu navegador móvil"
