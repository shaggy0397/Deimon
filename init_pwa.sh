#!/data/data/com.termux/files/usr/bin/bash

echo -e "\n🔍 Validando entorno..."
pkg install nodejs openjdk zip unzip wget -y
npm install -g @bubblewrap/cli

echo -e "\n🌐 Ingresar URL del manifest.json:"
read -p "👉 " manifest_url

echo -e "\n📦 Iniciando proyecto Bubblewrap..."
bubblewrap init --manifest="$manifest_url"

echo -e "\n✅ Proyecto inicializado. Usa 'ls' para ver carpeta generada."
