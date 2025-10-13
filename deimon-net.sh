#!/data/data/com.termux/files/usr/bin/bash
# ╔════════════════════════════════════════════════════════════════════╗
# ║ 🧠 DEIMON NET - Validación, generación y deploy repo-ready        ║
# ║ Detecta errores, genera archivos faltantes y despliega con QR     ║
# ╚════════════════════════════════════════════════════════════════════╝

ORIGEN="$1"
DESTINO="$HOME/.deimon-deploy"
mkdir -p "$DESTINO"

# ─── Autocopia si está en ruta externa ───────────────────────────────
if [[ "$ORIGEN" == /storage/* ]]; then
  echo "📦 Ruta externa detectada: $ORIGEN"
  cp -r "$ORIGEN"/* "$DESTINO/"
  RUTA="$DESTINO"
else
  RUTA="$ORIGEN"
fi

cd "$RUTA"

# ─── Validar y generar manifest.json ─────────────────────────────────
if [ ! -f "manifest.json" ]; then
  echo "🛠 Generando manifest.json..."
  cat > manifest.json <<EOF
{
  "name": "SHAGGY digital mind",
  "short_name": "SHAGGY",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#111827",
  "theme_color": "#111827",
  "icons": [
    { "src": "icon-192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "icon-512.png", "sizes": "512x512", "type": "image/png" }
  ]
}
EOF
fi

# ─── Validar y generar sw.js ─────────────────────────────────────────
if [ ! -f "sw.js" ]; then
  echo "🛡️ Generando sw.js blindado..."
  cat > sw.js <<'EOF'
const CACHE_NAME = 'shaggy-cache-v1';
const CACHE_ASSETS = [
  '/',
  '/index.html',
  '/manifest.json',
  '/tailwind.min.css',
  '/icon-192.png',
  '/icon-512.png'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(CACHE_ASSETS))
      .catch(err => console.error('❌ Error al cachear:', err))
  );
});

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys => {
      return Promise.all(keys.map(key => {
        if (key !== CACHE_NAME) return caches.delete(key);
      }));
    })
  );
});

self.addEventListener('fetch', event => {
  const url = event.request.url;
  if (url.includes('/api/') || url.includes('/gemini/')) return;

  event.respondWith(
    caches.match(event.request).then(cachedResponse => {
      if (cachedResponse && cachedResponse.ok && isResourceValid(cachedResponse)) {
        return cachedResponse;
      }
      return fetch(event.request).catch(() => new Response(null, { status: 408 }));
    })
  );
});

function isResourceValid(response) {
  return response.status === 200 || response.status === 304;
}
EOF
fi

# ─── Validar y descargar íconos ──────────────────────────────────────
[ -f "icon-192.png" ] || curl -o icon-192.png https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/AppIcon_192.png
[ -f "icon-512.png" ] || curl -o icon-512.png https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/AppIcon_512.png

# ─── Validar registro de sw.js en index.html ─────────────────────────
if ! grep -q "navigator.serviceWorker.register('/sw.js')" index.html; then
  echo "🔗 Registrando sw.js en index.html..."
  sed -i '/<\/body>/i\<script>\nif ("serviceWorker" in navigator) {\n navigator.serviceWorker.register("/sw.js")\n .then(reg => console.log("✅ SW registrado:", reg))\n .catch(err => console.error("❌ Error al registrar SW:", err));\n}\n</script>' index.html
fi

# ─── Validación sintomática ──────────────────────────────────────────
LOG="errors.log"
QR="errors.png"
> "$LOG"

jq . manifest.json &>/dev/null || echo "🛑 manifest.json inválido" >> "$LOG"
grep -q 'sw.js' index.html || echo "🛑 index.html no registra sw.js" >> "$LOG"
[ -f "sw.js" ] || echo "🛑 Falta sw.js" >> "$LOG"
[ -f "icon-192.png" ] || echo "🛑 Falta icon-192.png" >> "$LOG"
[ -f "icon-512.png" ] || echo "🛑 Falta icon-512.png" >> "$LOG"

if [ -s "$LOG" ]; then
  echo "⚠️ Errores detectados:"
  cat "$LOG"
  cat "$LOG" | qrencode -o "$QR"
else
  echo "✅ Todo validado correctamente"
fi

# ─── Deploy en Netlify ───────────────────────────────────────────────
URL=$(netlify deploy --dir="$RUTA" --prod --message "Deploy blindado SHAGGY" | grep -oE "https://[a-zA-Z0-9./_-]*\.netlify\.app" | tail -n1)

if [ -n "$URL" ]; then
  echo "✅ Deploy completado: $URL"
  echo "$URL" > deploy.log
  termux-clipboard-set "$URL"
  qrencode -o qr.png "$URL"

  FECHA=$(date +"%Y-%m-%d %H:%M")
  cat > README.md <<EOF
# 🧠 SHAGGY digital mind - Deploy repo-ready

**Fecha:** $FECHA  
**URL:** [$URL]($URL)

Este proyecto fue blindado automáticamente con validación sintomática, generación de archivos faltantes, QR visual y deploy táctil desde Termux.

╔════════════════════════════════════════════════════════════╗
║ 🧠 DEIMON NET - Deploy blindado completado                ║
║ 🌐 $URL                                                   ║
╚════════════════════════════════════════════════════════════╝
EOF
else
  echo "❌ No se pudo obtener la URL del deploy"
fi

# ─── Copiar de regreso a carpeta original ──────────────────────────
if [[ "$ORIGEN" == /storage/* ]]; then
  echo "📂 Devolviendo archivos blindados a $ORIGEN"
  cp -r "$RUTA"/* "$ORIGEN/"
fi
