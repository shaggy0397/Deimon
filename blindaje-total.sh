#!/data/data/com.termux/files/usr/bin/bash
# 🧙‍♂️ blindaje-total.sh — Revisión y regeneración repo-ready

FECHA=$(date "+%Y-%m-%d %H:%M:%S")
LOG="/storage/emulated/0/1A/Appinven/log-blindaje-total.txt"
DIST="/storage/emulated/0/1A/Appinven/dist"
SCRIPTS=("validar-jdk.sh" "verificar-origen.sh" "blindar-dist.sh" "verificar-apk.sh" "generar-readme.sh" "compartir-repo.sh" "publicar-netlify.sh" "instalador-local.sh")

echo "🧙‍♂️ Iniciando blindaje sintomático total..."
echo "$FECHA 🧙‍♂️ Blindaje iniciado" >> "$LOG"

# 📦 Verificar archivos clave en dist/
ARCHIVOS=("index.html" "manifest.json" "service-worker.js" "favicon.ico")
FALTANTES=()

for archivo in "${ARCHIVOS[@]}"; do
  if [ ! -f "$DIST/$archivo" ]; then
    echo "⚠️ Archivo faltante en dist/: $archivo"
    echo "$FECHA ⚠️ Archivo faltante: $archivo" >> "$LOG"
    FALTANTES+=("$archivo")
  fi
done

# 🧠 Si hay faltantes, invocar regeneración
if [ ${#FALTANTES[@]} -gt 0 ]; then
  echo "🔧 Ejecutando regeneración sintomática..."
  bash ~/regenerar-dist.sh
fi
# 📜 Verificar scripts guardianes
for script in "${SCRIPTS[@]}"; do
  if [ ! -f ~/"$script" ]; then
    echo "⚠️ Script faltante: $script"
    echo "$FECHA ⚠️ Script faltante: $script" >> "$LOG"
    # Aquí puedes agregar regeneración automática si quieres que los scripts se reconstruyan
    # Por ahora solo deja huella
  fi
done

# 📦 Verificar archivos clave en dist/
ARCHIVOS=("index.html" "manifest.json" "service-worker.js" "favicon.ico")

for archivo in "${ARCHIVOS[@]}"; do
  if [ ! -f "$DIST/$archivo" ]; then
    echo "⚠️ Archivo faltante en dist/: $archivo"
    echo "$FECHA ⚠️ Archivo faltante: $archivo" >> "$LOG"
    # Aquí puedes agregar regeneración automática si tienes scripts que los reconstruyan
  fi
done

# ✅ Finalización
echo "$FECHA ✅ Blindaje completado" >> "$LOG"
echo "
╔════════════════════════════════════╗
║  ✅ Blindaje sintomático completado ║
║  Revisión de carpetas y scripts ✔️ ║
╚════════════════════════════════════╝
"
