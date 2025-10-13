#!/bin/bash

# === CONFIGURACIÓN ===
GITHUB_USER="shaggy0397"
GITHUB_TOKEN="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"
REPO_NAME="deimon-pwa"
BRANCH="main"
REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME"
DEPLOY_URL="https://$GITHUB_USER.github.io/$REPO_NAME"

# === CREAR REPOSITORIO EN GITHUB SI NO EXISTE ===
echo "🔍 Verificando existencia del repositorio..."
EXISTE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$GITHUB_USER/$REPO_NAME | grep -c '"id":')
if [ "$EXISTE" -eq 0 ]; then
  echo "🚀 Repositorio no existe. Creando..."
  curl -s -H "Authorization: token $GITHUB_TOKEN" \
       -d "{\"name\":\"$REPO_NAME\", \"private\":false}" \
       https://api.github.com/user/repos
else
  echo "✅ Repositorio ya existe."
fi

# === PREPARAR CARPETA ===
mkdir -p "$REPO_NAME/icons"
cd "$REPO_NAME"

# === RENOMBRAR HTML SI ES NECESARIO ===
if [ -f "main.html" ] && [ ! -f "index.html" ]; then
  mv main.html index.html
  echo "📄 Renombrado main.html → index.html"
fi

# === CREAR ARCHIVOS FALTANTES ===
touch .nojekyll
[ ! -f "index.html" ] && echo "<!DOCTYPE html><html><head><title>DEIMON</title></head><body>Hola DEIMON</body></html>" > index.html
[ ! -f "manifest.json" ] && echo '{ "name": "DEIMON", "short_name": "DEIMON", "start_url": "index.html", "display": "standalone", "theme_color": "#111827", "background_color": "#111827", "icons": [{ "src": "icons/icon-192.png", "sizes": "192x192", "type": "image/png" }, { "src": "icons/icon-512.png", "sizes": "512x512", "type": "image/png" }] }' > manifest.json
[ ! -f "sw.js" ] && echo "self.addEventListener('fetch', e => e.respondWith(fetch(e.request)))" > sw.js
[ ! -f "README.md" ] && echo "# DEIMON PWA\nInstalable desde GitHub Pages." > README.md

# === CREAR ÍCONOS PLACEHOLDER SI FALTAN ===
[ ! -f "icons/icon-192.png" ] && curl -s -o icons/icon-192.png "https://placehold.co/192x192/111827/FFFFFF?text=D"
[ ! -f "icons/icon-512.png" ] && curl -s -o icons/icon-512.png "https://placehold.co/512x512/111827/FFFFFF?text=DEIMON"

# === SUBIDA A GITHUB ===
git init
git remote add origin "https://$GITHUB_USER:$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git"
git checkout -b $BRANCH
git add .
git commit -m "Deploy automático DEIMON repo-ready"
git push -u origin $BRANCH --force

# === RITUAL DE CIERRE ===
echo -e "\n🧠 DEIMON PWA desplegado con éxito:"
echo "🌐 $DEPLOY_URL"
echo -e "\nASCII RITUAL:"
echo "      .----. "
echo "     / .-'-.\\"
echo "     | | O O|"
echo "     \\ \\___/ /"
echo "      '-.__.-'"
echo "     FIN RITUAL ✅"
