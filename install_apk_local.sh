#!/data/data/com.termux/files/usr/bin/bash

# ╔════════════════════════════════════════════╗
# ║   📲 Instalación local de APK repo-ready   ║
# ╠════════════════════════════════════════════╣

echo -e "\n📁 Ingresar ruta del APK a instalar:"
read -p "👉 " apk_path

echo -e "\n📦 Copiando APK a /sdcard/..."
cp "$apk_path" /sdcard/app-release.apk

echo -e "\n🚀 Abriendo instalador nativo..."
termux-open /sdcard/app-release.apk

# ╚════════════════════════════════════════════╝
echo -e "\n✅ Instalación iniciada. Confirma en pantalla."
