#!/data/data/com.termux/files/usr/bin/bash
# 🔧 regenerar-dist.sh — Reconstruye archivos clave en dist/

DIST="/storage/emulated/0/1A/Appinven/dist"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")
LOG="$DIST/log-reconstruccion.txt"

echo "🔧 Iniciando reconstrucción sintomática en: $DIST"
mkdir -p "$DIST"

# index.html
if [ ! -f "$DIST/index.html" ]; then
  echo "⚙️ Generando index.html base..."
  cat > "$DIST/index.html" <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Appinven</title>
  <link rel="manifest" href="manifest.json">
</head>
<body>
  <h1>Bienvenido a Appinven</h1>
</body>
</html>
EOF
  echo "$FECHA ✅ index.html generado" >> "$LOG"
fi

# manifest.json
if [ ! -f "$DIST/manifest.json" ]; then
  echo "⚙️ Generando manifest.json base..."
  cat > "$DIST/manifest.json" <<EOF
{
  "name": "Appinven",
  "short_name": "Appinven",
  "start_url": "index.html",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#000000",
  "icons": []
}
EOF
  echo "$FECHA ✅ manifest.json generado" >> "$LOG"
fi

# service
