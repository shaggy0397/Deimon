#!/data/data/com.termux/files/usr/bin/bash

echo "📦 Publicando carpeta repo-ready como PWA"
git init
git add .
git commit -m "🧩 Subida repo-ready: PWA lista para empaquetar como APK"
git branch -M main

echo "📝 Ingresa la URL de tu repositorio GitHub:"
read REPO_URL

git remote add origin "$REPO_URL"
git push -u origin main

echo "🌐 URL pública esperada:"
echo "$REPO_URL/raw/main/manifest.json"
