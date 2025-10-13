#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🧩 Validador de íconos en manifest.json"
echo "────────────────────────────────────────────"

MANIFEST="manifest.json"
LOG="iconos_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Verificar existencia local
if [ ! -f "$MANIFEST" ]; then
  echo "❌ No se encontró $MANIFEST en la carpeta actual"
  exit 1
fi
echo "✅ $MANIFEST existe localmente"

# Paso 2: Validar íconos
echo "🔍 Analizando íconos..."
ICONOS=$(jq '.icons' "$MANIFEST")

if [ -z "$ICONOS" ]; then
  echo "❌ No se encontraron íconos en el manifest"
  exit 1
fi

jq -c '.icons[]' "$MANIFEST" | while read -r icon; do
  SRC=$(echo "$icon" | jq -r '.src')
  SIZES=$(echo "$icon" | jq -r '.sizes')
  TYPE=$(echo "$icon" | jq -r '.type')
  PURPOSE=$(echo "$icon" | jq -r '.purpose')

  echo "────────────────────────────" >> "$LOG"
  echo "🖼️ Icono: $SRC" >> "$LOG"

  if echo "$SRC" | grep -q "google.com/search"; then
    echo "❌ URL inválida: apunta a búsqueda" >> "$LOG"
  elif echo "$SRC" | grep -q "placehold.co"; then
    echo "✅ URL directa detectada" >> "$LOG"
  else
    echo "⚠️ URL no reconocida, revisar manualmente" >> "$LOG"
  fi

  if [ "$SIZES" != "null" ] && [ "$TYPE" != "null" ] && [ "$PURPOSE" != "null" ]; then
    echo "✅ Propiedades completas: sizes, type, purpose" >> "$LOG"
  else
    echo "❌ Faltan propiedades en el icono" >> "$LOG"
  fi
done

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"

