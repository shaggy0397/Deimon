#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🔗 Vinculador repo-ready: GitHub remoto"
echo "────────────────────────────────────────────"

echo "📁 Carpeta actual: $(pwd)"
echo "📝 Ingresa la URL de tu repositorio GitHub:"
read REPO_URL

# Detectar si origin ya existe
if git remote | grep -q origin; then
  echo "⚠️ Remoto 'origin' ya existe. Reemplazando..."
  git remote set-url origin "$REPO_URL"
else
  echo "✅ Agregando remoto 'origin' por primera vez..."
  git remote add origin "$REPO_URL"
fi

# Confirmar rama principal
git branch -M main

# Agregar archivos y hacer commit
git add .
git commit -m "🚀 Subida repo-ready: PWA lista para empaquetado como APK"

# Push táctico
git push -u origin main

echo "────────────────────────────────────────────"
echo "🎯 Push completado. Repositorio vinculado y actualizado"
