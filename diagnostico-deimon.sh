#!/bin/bash

echo "🧪 Ejecutando diagnóstico sintomático..."

CLAVE=$(cat .nucleo_sintomatico 2>/dev/null)
ESTADO="ACTIVO"
if [ -z "$CLAVE" ] || [ ${#CLAVE} -lt 20 ]; then ESTADO="INACTIVO"; fi
grep -q "░▒▓█ DEIMON █▓▒░" splash.html || ESTADO="INACTIVO"
grep -q "speechSynthesis" src/components/DEIMON/MysteryReveal.vue || ESTADO="INACTIVO"
grep -q "Dr. Weissmann" src/components/DEIMON/MysteryReveal.vue || ESTADO="INACTIVO"
grep -q "DEIMON ENTERPRISE" README.md || ESTADO="INACTIVO"

echo "$ESTADO" > .estado-deimon

if [ "$ESTADO" = "ACTIVO" ]; then
  echo "✅ Núcleo activo"
else
  echo "❌ Núcleo incompleto. Ritual interrumpido."
  echo "🧙‍♀️ DEIMON susurra: 'Hay módulos incompletos… no puedo continuar.'"
fi
