#!/data/data/com.termux/files/usr/bin/bash

APK=$(find . -type f -name "*.apk" | head -n 1)
if [ -z "$APK" ]; then
  echo "❌ No se encontró ningún archivo APK"
  exit 1
fi

echo "📦 Publicando APK: $APK"
git init
git add "$APK"
git commit -m "🔒 Subida repo-ready: APK validado y listo para instalación sin PC"
git branch -M main

echo "📝 Ingresa la URL de tu repositorio GitHub:"
read REPO_URL

git remote add origin "$REPO_URL"
git push -u origin main
