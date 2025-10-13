#!/data/data/com.termux/files/usr/bin/bash

base="/storage/emulated/0/1A/Appinven"
dist="$base/dist"
logs="$base/logs"
estado="$base/estado.txt"
pub="$dist/estado-publicacion.txt"

echo "🧠 Escaneando entorno repo-ready..."

# Productos ZIP
echo "📦 Productos ZIP encontrados:"
find "$dist" -name "Hotmart-*.zip" -exec basename {} \;

# README visual
echo -e "\n📜 README visual:"
find "$dist" -name "README.txt" -exec basename {} \;

# Estado táctil
echo -e "\n📄 estado.txt:"
[[ -f "$estado" ]] && cat "$estado" || echo "❌ No encontrado"

# Log de entregas
echo -e "\n📜 entregas.log:"
[[ -f "$logs/entregas.log" ]] && tail -n 5 "$logs/entregas.log" || echo "❌ No encontrado"

# Publicación
echo -e "\n📜 estado-publicacion.txt:"
[[ -f "$pub" ]] && tail -n 5 "$pub" || echo "❌ No encontrado"

# Arte ASCII
echo -e "\n╔════════════════════════════════════╗"
echo "║ 🧠 Archivos táctiles detectados     ║"
echo "║ 📦 ZIPs: $(ls "$dist"/Hotmart-*.zip 2>/dev/null | wc -l)               ║"
echo "║ 📜 Logs: $(ls "$logs" 2>/dev/null | wc -l)                             ║"
echo "║ 📄 Estado: $( [[ -f "$estado" ]] && echo '✅' || echo '❌' )            ║"
echo "╚════════════════════════════════════╝"
