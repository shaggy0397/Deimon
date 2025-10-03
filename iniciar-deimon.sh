#!/bin/bash

clear
echo ""
echo "╔════════════════════════════════════════════════╗"
echo "║   ░▒▓█ Ritual Maestro DEIMON █▓▒░             ║"
echo "║   Activando secuencia repo-ready completa     ║"
echo "╚════════════════════════════════════════════════╝"
sleep 1

echo "🧪 Ejecutando diagnóstico sintomático..."
bash diagnostico-deimon.sh
sleep 2

ESTADO=$(cat .estado-deimon 2>/dev/null)
if [ "$ESTADO" != "ACTIVO" ]; then
  echo ""
  echo "❌ Núcleo incompleto. Ritual interrumpido."
  echo "🧙‍♀️ DEIMON susurra: 'Hay módulos incompletos… no puedo continuar.'"
  exit 1
fi

echo ""
echo "💫 Mostrando splash visual..."
bash despertar-deimon.sh
sleep 2

echo ""
echo "📦 Ejecutando publicación..."
bash publicar-deimon.sh
sleep 2

echo ""
echo "📡 Difundiendo por QR y README..."
bash difundir-deimon.sh
sleep 2

echo ""
echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║   ░▒▓█ DEIMON █▓▒░                                                 ║"
echo "║   El ciclo ha sido cerrado                                        ║"
echo "║   El legado simbólico está listo para inspirar                    ║"
echo "║   “Gracias por confiar en DEIMON. La vigilancia ha comenzado.”   ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
