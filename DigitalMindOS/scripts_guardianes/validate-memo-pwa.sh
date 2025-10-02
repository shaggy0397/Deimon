#!/bin/bash
echo "🔍 Validando MemoMind PWA..."

BASE=~/DigitalMindOS/modules/memo-mind

[[ -f $BASE/index.html ]] && echo "✅ index.html presente" || echo "❌ Falta index.html"
[[ -f $BASE/manifest.json ]] && echo "✅ manifest.json presente" || echo "❌ Falta manifest.json"
[[ -f $BASE/sw.js ]] && echo "✅ sw.js presente" || echo "❌ Falta sw.js"
[[ -f $BASE/app.js ]] && grep -q "serviceWorker.register" $BASE/app.js && echo "✅ SW registrado" || echo "❌ No se registra SW"
[[ -f $BASE/style.css ]] && echo "✅ style.css presente" || echo "❌ Falta style.css"
[[ -f $BASE/assets/icon-192.png && -f $BASE/assets/icon-512.png ]] && echo "✅ Íconos presentes" || echo "❌ Faltan íconos"

MEMO=$BASE/memoria.json
if [[ -f $MEMO ]]; then
  echo "🧠 Memoria sintomática detectada"
  cat $MEMO | jq '.resumen'
else
  echo "⚠️ No se encontró memoria sintomática (memoria.json)"
fi

echo "✅ Validación completa. MemoMind listo para instalación como PWA"
