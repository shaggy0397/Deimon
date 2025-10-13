#!/data/data/com.termux/files/usr/bin/bash
# 📦 compartir-repo.sh — Empaqueta entorno repo-ready en ZIP táctil

ORIGEN="/storage/emulated/0/1A/Appinven"
DESTINO="/storage/emulated/0/1A/Compartido"
ZIP="$DESTINO/Appinven-$(date '+%Y%m%d-%H%M').zip"

echo "📦 Empaquetando entorno repo-ready..."

mkdir -p "$DESTINO"

zip -r "$ZIP" "$ORIGEN" -x "*.zip" "*.apk" "*.DS_Store" "*.log" "*.tmp"

echo "
╔════════════════════════════════════╗
║  ✅ Repo empaquetado en ZIP ✔️     ║
║  Listo para compartir o subir      ║
╚════════════════════════════════════╝
"

echo "📁 Archivo generado: $ZIP"
