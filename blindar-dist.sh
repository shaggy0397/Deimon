#!/data/data/com.termux/files/usr/bin/bash
# 🔐 blindar-dist.sh — Valida archivos clave antes del deploy

DIST="/storage/emulated/0/1A/Appinven/dist"
LOG="$DIST/log-validacion-dist.txt"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

ARCHIVOS=("index.html" "manifest.json" "service-worker.js" "favicon.ico")
FALTANTES=()

echo "🔍 Validando archivos clave en: $DIST"

for archivo in "${ARCHIVOS[@]}"; do
  if [ ! -f "$DIST/$archivo" ]; then
    FALTANTES+=("$archivo")
  fi
done

if [ ${#FALTANTES[@]} -eq 0 ]; then
  echo "$FECHA ✅ Todos los archivos clave están presentes" >> "$LOG"
  echo "
  ╔════════════════════════════════╗
  ║  🔐 Validación dist completada  ║
  ║  Archivos clave detectados ✔️  ║
  ╚════════════════════════════════╝
  "
else
  echo "$FECHA ❌ Faltan archivos: ${FALTANTES[*]}" >> "$LOG"
  echo "
  ⚠️ Archivos faltantes detectados:
  ${FALTANTES[*]}
  "
  echo "🧾 Log actualizado en: $LOG"
  exit 1
fi
