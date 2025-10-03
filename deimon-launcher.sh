#!/bin/bash

# Lanzador táctil repo-ready
echo "🌙 DEIMON Launcher activo"
echo "Selecciona una opción:"
echo "1) Generar estructura"
echo "2) Diagnóstico sintomático"
echo "3) Splash visual"
echo "4) Publicar módulo"
echo "5) Difundir QR"
echo "6) Ritual completo"
echo "0) Salir"
read -p "👉 Opción: " OPCION

case $OPCION in
  1) bash generar-deimon.sh ;;
  2) bash diagnostico-deimon.sh ;;
  3) bash despertar-deimon.sh ;;
  4) bash publicar-deimon.sh ;;
  5) bash difundir-deimon.sh ;;
  6) bash iniciar-deimon.sh ;;
  0) echo "🧙‍♀️ Ritual cancelado. DEIMON permanece en silencio." ;;
  *) echo "❌ Opción inválida. Intenta de nuevo." ;;
esac
