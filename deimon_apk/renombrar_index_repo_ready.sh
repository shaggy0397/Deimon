#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🧩 Renombrador repo-ready: dei.html → index.html"
echo "────────────────────────────────────────────"

ORIG="dei.html"
DEST="index.html"
LOG="renombrador_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Verificar existencia
if [ ! -f "$ORIG" ]; then
  echo "❌ No se encontró $ORIG en la carpeta actual" | tee -a "$LOG"
  exit 1
fi

# Paso 2: Renombrar
mv "$ORIG" "$DEST"
echo "✅ Renombrado: $ORIG → $DEST" | tee -a "$LOG"

# Paso 3: Git add + commit + push
git add "$DEST"
git rm "$ORIG"
git commit -m "🧩 Renombrando dei.html como index.html para compatibilidad PWA"
git push origin main

# Paso 4: Confirmar publicación
URL="https://shaggy0397.github.io/Pwa-app11/"
echo "🔍 Espera unos segundos y abre: $URL" | tee -a "$LOG"

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
