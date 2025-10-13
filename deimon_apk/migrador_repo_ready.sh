#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "📦 Migrador repo-ready: app11 → $HOME/deimon_apk"
echo "────────────────────────────────────────────"

ORIG="/storage/emulated/0/app11"
DEST="$HOME/deimon_apk"
LOG="migrador_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Crear carpeta destino si no existe
mkdir -p "$DEST"

# Paso 2: Mover archivos
echo "🚚 Moviendo archivos desde $ORIG..." | tee -a "$LOG"
cp -r "$ORIG"/* "$DEST"/

# Paso 3: Confirmar migración
echo "✅ Archivos migrados a: $DEST" | tee -a "$LOG"
ls "$DEST" | tee -a "$LOG"

# Paso 4: Entrar al nuevo entorno
cd "$DEST"
echo "📍 Ubicación actual: $(pwd)" | tee -a "$LOG"

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
