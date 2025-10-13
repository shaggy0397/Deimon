#!/data/data/com.termux/files/usr/bin/bash
# 📦 crear-bundle.sh — Empaqueta entorno repo-ready completo

DESTINO="/storage/emulated/0/1A/Compartido"
ORIGEN="/storage/emulated/0/1A/Appinven"
FECHA=$(date "+%Y%m%d-%H%M")
BUNDLE="$DESTINO/Appinven-bundle-$FECHA.tar.gz"

echo "📦 Iniciando empaquetado simbólico..."
mkdir -p "$DESTINO"

tar -czvf "$BUNDLE" \
  "$ORIGEN/dist" \
  "$ORIGEN/README.md" \
  "$ORIGEN/log-blindaje-total.txt" \
  "$ORIGEN/log-reconstruccion.txt" \
  "$ORIGEN/log-generacion.txt" \
  ~/validar-jdk.sh \
  ~/verificar-origen.sh \
  ~/blindar-dist.sh \
  ~/verificar-apk.sh \
  ~/generar-readme.sh \
  ~/compartir-repo.sh \
  ~/publicar-netlify.sh \
  ~/instalador-local.sh \
  ~/blindaje-total.sh \
  ~/regenerar-dist.sh \
  ~/ritual-autocuracion.sh \
  ~/generar-entorno-repo-ready.sh

echo "
╔════════════════════════════════════╗
║  ✅ Bundle repo-ready creado ✔️     ║
║  Archivo: $BUNDLE
╚════════════════════════════════════╝
"
