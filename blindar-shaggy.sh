#!/bin/bash

echo "🔧 Iniciando blindaje repo-ready de Shaggy digital mind..."

# 1. Validación sintomática
echo "🧠 Validando duplicados en index.html..."
grep -Eo '\b(\w+)\b \1\b' index.html && echo "⚠️ Duplicado detectado en transcripción" && exit 1

# 2. Verificación de íconos
echo "🎨 Verificando íconos..."
mkdir -p icons
[ -f icons/icon-192.png ] || convert -size 192x192 xc:#00BFFF icons/icon-192.png
[ -f icons/icon-512.png ] || convert -size 512x512 xc:#00BFFF icons/icon-512.png

# 3. Generar manifest.json
echo "📦 Creando manifest.json..."
cat <<EOF > manifest.json
{
  "name": "Shaggy digital mind",
  "short_name": "Shaggy",
  "start_url": "./index.html",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#00BFFF",
  "icons": [
    {
      "src": "icons/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icons/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
EOF

# 4. Generar service-worker.js
echo "⚙️ Creando service-worker.js..."
cat <<EOF > service-worker.js
self.addEventListener('install', e => {
  e.waitUntil(
    caches.open('shaggy-cache').then(cache => {
      return cache.addAll([
        './',
        './index.html',
        './manifest.json',
        './icons/icon-192.png',
        './icons/icon-512.png'
      ]);
    })
  );
});
self.addEventListener('fetch', e => {
  e.respondWith(
    caches.match(e.request).then(response => response || fetch(e.request))
  );
});
EOF

# 5. Generar QR de instalación
echo "📲 Generando QR..."
qrencode -o qr.png "https://Mario-moz.github.io/DEIMON-/"

# 6. Inicializar y subir a GitHub
echo "🚀 Publicando en GitHub..."
echo "# DEIMON-" >> README.md
git init
git remote remove origin 2>/dev/null
git remote add origin https://github.com/Mario-moz/DEIMON-.git
git add .
git commit -m "Versión blindada repo-ready de Shaggy"
git branch -M main
git push -u origin main

# 7. Activar GitHub Pages desde rama main
echo "🌐 Activando GitHub Pages desde rama main..."
echo "✅ Ve a Settings → Pages y selecciona 'main' como fuente de publicación."

echo "✅ Blindaje completado. App publicada en DEIMON-. QR generado en qr.png"
