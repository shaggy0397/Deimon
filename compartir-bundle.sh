#!/data/data/com.termux/files/usr/bin/bash
# 📲 compartir-bundle.sh — Detecta y comparte el bundle repo-ready

DESTINO="/storage/emulated/0/1A/Compartido"
BUNDLE=$(find "$DESTINO" -name "Appinven-bundle-*.tar.gz" -type f -printf "%T@ %p\n" | sort -n | tail -1 | cut -d' ' -f2)

if [ ! -f "$BUNDLE" ]; then
  echo "❌ No se encontró bundle repo-ready en $DESTINO"
  echo "⚠️ Ejecuta crear-bundle.sh primero"
  exit 1
fi

echo "📦 Bundle detectado: $BUNDLE"

# 📜 Mensaje simbólico para compartir
echo "
╔════════════════════════════════════╗
║  📲 Bundle repo-ready listo para compartir ║
╠════════════════════════════════════╣
║  Archivo: $(basename "$BUNDLE")         
║  Ruta: $BUNDLE                     
║  Puedes subirlo a Netlify, Drive o Telegram
╚════════════════════════════════════╝
"

# 🧭 Abrir carpeta en navegador (si lo deseas)
am start -a android.intent.action.VIEW -d "file://$DESTINO"

# (Opcional) Generar QR táctil con Termux:API si tienes instalado `qrencode`
# qrencode -o ~/qr-bundle.png "$(basename "$BUNDLE")"
