#!/data/data/com.termux/files/usr/bin/bash
# ╔════════════════════════════════════════════════════════════════════╗
# ║     🚀 DEIMON deploy - Netlify + QR + autocopia repo-ready        ║
# ║   Detecta ruta externa, se autocopia, genera QR y deploy.log      ║
# ╚════════════════════════════════════════════════════════════════════╝

ORIGEN="$1"
DESTINO="$HOME/.deimon-deploy"
mkdir -p "$DESTINO"

# ─── Detectar si está en ruta externa ───────────────────────────────
if [[ "$ORIGEN" == /storage/* ]]; then
  echo "📦 Ruta externa detectada: $ORIGEN"
  echo "📁 Copiando proyecto a entorno seguro: $DESTINO"
  cp -r "$ORIGEN"/* "$DESTINO/"
  RUTA="$DESTINO"
else
  RUTA="$ORIGEN"
fi

cd "$RUTA"

# ─── Verificar netlify-cli ──────────────────────────────────────────
if ! command -v netlify &> /dev/null; then
  echo "❌ netlify-cli no está instalado. Ejecuta: npm install -g netlify-cli"
  exit 1
fi

# ─── Verificar sesión ───────────────────────────────────────────────
netlify status || netlify login

# ─── Ejecutar deploy ────────────────────────────────────────────────
URL=$(netlify deploy --dir="$RUTA" --prod --message "Deploy repo-ready desde Termux" | grep -oE "https://[a-zA-Z0-9./_-]*\.netlify\.app" | tail -n1)

if [ -n "$URL" ]; then
  echo "✅ Deploy completado: $URL"
  echo "🎯 Generando QR..."
  echo "$URL" | qrencode -t UTF8
  echo "$URL" > "$RUTA/deploy.log"
  termux-clipboard-set "$URL" && echo "📋 URL copiada al portapapeles"

  # ─── Crear README simbólico ───────────────────────────────────────
  FECHA=$(date +"%Y-%m-%d %H:%M")
  cat > "$RUTA/README.md" <<EOF
# 🧠 Deploy repo-ready

**Fecha:** $FECHA  
**URL:** [$URL]($URL)

Este proyecto fue blindado y desplegado desde Termux con validación sintomática, QR visual y portapapeles táctil.
EOF
  echo "📄 README.md generado con fecha y URL"
else
  echo "⚠️ No se pudo obtener la URL del deploy"
fi
