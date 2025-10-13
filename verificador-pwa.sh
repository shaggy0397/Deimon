#!/data/data/com.termux/files/usr/bin/bash
# ╔════════════════════════════════════════════════════════════╗
# ║ 🧠 Verificador PWA - Evitar acceso directo con barra URL   ║
# ╚════════════════════════════════════════════════════════════╝

RUTA="$1"
LOG="verificador.log"
QR="verificador.png"
> "$LOG"

cd "$RUTA" || exit 1

echo "🧪 Verificando PWA en $RUTA..."

# 1. Validar manifest.json
if [ ! -f "manifest.json" ]; then
  echo "🛑 Falta manifest.json" >> "$LOG"
else
  jq . manifest.json &>/dev/null || echo "🛑 manifest.json inválido" >> "$LOG"
  jq -e '.display=="standalone"' manifest.json &>/dev/null || echo "🛑 display no es standalone" >> "$LOG"
  jq -e '.icons[] | select(.sizes=="192x192")' manifest.json &>/dev/null || echo "🛑 Falta icon-192.png en manifest" >> "$LOG"
  jq -e '.icons[] | select(.sizes=="512x512")' manifest.json &>/dev/null || echo "🛑 Falta icon-512.png en manifest" >> "$LOG"
fi

# 2. Validar service worker
if [ ! -f "sw.js" ]; then
  echo "🛑 Falta sw.js" >> "$LOG"
else
  grep -q "self.addEventListener('fetch'" sw.js || echo "⚠️ sw.js no maneja fetch" >> "$LOG"
fi

# 3. Validar index.html
if [ ! -f "index.html" ]; then
  echo "🛑 Falta index.html" >> "$LOG"
else
  grep -q "manifest.json" index.html || echo "🛑 index.html no enlaza manifest.json" >> "$LOG"
  grep -q "theme-color" index.html || echo "⚠️ Falta meta theme-color" >> "$LOG"
  grep -q "serviceWorker.register" index.html || echo "🛑 index.html no registra sw.js" >> "$LOG"
fi

# 4. Resultado
if [ -s "$LOG" ]; then
  echo "⚠️ Errores detectados, la PWA quedará como acceso directo:"
  cat "$LOG"
  cat "$LOG" | qrencode -o "$QR"
  termux-image-viewer "$QR"
else
  echo "✅ Todo correcto: la PWA será instalable sin barra de direcciones"
fi
