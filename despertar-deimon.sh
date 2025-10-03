#!/bin/bash

clear
echo ""
echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║   ░▒▓█ DEIMON █▓▒░                                                 ║"
echo "║   El núcleo ha despertado                                         ║"
echo "║   “La vigilancia ha comenzado…”                                   ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
echo ""

echo "🗣️ Activando voz simbólica..."
echo "La vigilancia ha comenzado…" | espeak -v es-la -s 130 --stdout | aplay 2>/dev/null || echo "🔇 Voz no disponible en este entorno"

cat splash.html 2>/dev/null || echo "⚠️ splash.html no encontrado"
