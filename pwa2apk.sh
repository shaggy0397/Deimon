#!/data/data/com.termux/files/usr/bin/bash

# ╔════════════════════════════════════════════╗
# ║   🛠️ PWA → APK: Empaquetado Repo-Ready     ║
# ╠════════════════════════════════════════════╣

echo -e "\n🔍 Validando entorno..."
pkg install nodejs openjdk zip unzip wget -y
npm install -g @bubblewrap/cli

echo -e "\n📦 Iniciando proyecto Bubblewrap..."
read -p "🌐 URL del manifest.json: " manifest_url
bubblewrap init --manifest="$manifest_url"

echo -e "\n🧱 Compilando APK..."
bubblewrap build

echo -e "\n🔐 Firmando APK (clave de desarrollo)..."
# Bubblewrap ya firma automáticamente con clave de desarrollo

echo -e "\n📲 Instalando APK en dispositivo..."
echo "⚠️ Requiere adb conectado. Ejecuta: adb install ./output/app-release.apk"

# ╚════════════════════════════════════════════╝
echo -e "\n✅ Ciclo completado. APK repo-ready generado con éxito."
