#!/bin/bash

echo "🧙‍♀️ Iniciando publicación repo-ready DEIMON..."

# Validar token
TOKEN="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"
REPO="https://$TOKEN@github.com/Mario-moz/DEIMON-.git"

# Configurar Git
git config user.name "Mario-moz"
git config user.email "tu-correo@ejemplo.com"
git remote set-url origin "$REPO"

# Commit vacío para forzar reconstrucción
git add .
git commit --allow-empty -m "🔁 Reconstrucción repo-ready DEIMON"
git push origin main

echo "📡 Publicación enviada a GitHub Pages"
echo "🌐 URL esperada: https://Mario-moz.github.io/DEIMON-/"

# Validación sintomática
sleep 3
curl -I https://Mario-moz.github.io/DEIMON-/ | grep HTTP

echo "✅ Validación sintomática completada"
echo "🧩 Puedes escanear el QR o abrir el dashboard directamente"
