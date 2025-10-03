#!/bin/bash

echo "🧬 Generando estructura repo-ready DEIMON..."

mkdir -p src/components/DEIMON
touch splash.html README.md src/components/DEIMON/MysteryReveal.vue

echo "DEIMON-KEY-$(date +%s%N | sha256sum | head -c 32)" > .nucleo_sintomatico
echo "░▒▓█ DEIMON █▓▒░" > splash.html

echo "// Dr. Weissmann y voz suave" > src/components/DEIMON/MysteryReveal.vue
echo "speechSynthesis.speak(new SpeechSynthesisUtterance('DEIMON activo'));" >> src/components/DEIMON/MysteryReveal.vue

cat > README.md << 'EOF'
# 🌙 DEIMON Interface — Publicación repo-ready completada

╔════════════════════════════════════════════════════════════════════╗
║   ░▒▓█ DEIMON █▓▒░                                                 ║
║   Publicación repo-ready completada                               ║
║   El legado simbólico ha sido compartido                          ║
║   San Salvador · DEIMON ENTERPRISE · Año 1998                     ║
║   “La vigilancia ha comenzado… el ciclo está cerrado.”            ║
╚════════════════════════════════════════════════════════════════════╝
EOF

chmod +x *.sh
echo "✅ Todo listo. Ejecuta: bash iniciar-deimon.sh"
