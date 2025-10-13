#!/data/data/com.termux/files/usr/bin/bash
# 📦 empaquetar-netlify.sh — Ritual repo-ready completo para SHAGGY digital mind

clear
echo -e "\e[1;35m⛩️  EMPAQUETANDO SHAGGY DIGITAL MIND PARA NETLIFY + PWA\e[0m"
echo -e "\e[0;36mRuta base:\e[0m /storage/emulated/0/1A/api"

cd /storage/emulated/0/1A/api || { echo "❌ Carpeta no encontrada"; exit 1; }

# 🧩 Validar archivos clave
archivos=(index.html manifest.json sw.js _redirects icon-192.png icon-512.png)
faltantes=()

for archivo in "${archivos[@]}"; do
  [ -f "$archivo" ] || faltantes+=("$archivo")
done

if [ ${#faltantes[@]} -gt 0 ]; then
  echo -e "\e[1;31m❌ Faltan archivos clave:\e[0m"
  for f in "${faltantes[@]}"; do echo "  - $f"; done
  exit 1
fi

# 🧠 Validación sintomática
echo -e "\n\e[1;34m🔍 Validando sintomáticamente...\e[0m"

grep -q "theme-color" index.html && echo "✅ index.html incluye theme-color" || echo "⚠️ Falta theme-color"
grep -q "viewport" index.html && echo "✅ index.html incluye viewport" || echo "⚠️ Falta viewport"
grep -q "manifest.json" index.html && echo "✅ index.html enlaza manifest" || echo "⚠️ Falta enlace a manifest"
grep -q "serviceWorker" index.html && echo "✅ index.html registra service worker" || echo "⚠️ Falta registro de SW"
grep -q "start_url" manifest.json && echo "✅ manifest.json tiene start_url" || echo "⚠️ Falta start_url"
grep -q "display" manifest.json && echo "✅ manifest.json tiene display" || echo "⚠️ Falta display"
grep -q "install" sw.js && echo "✅ sw.js tiene evento install" || echo "⚠️ Falta evento install"
grep -q "fetch" sw.js && echo "✅ sw.js tiene evento fetch" || echo "⚠️ Falta evento fetch"
[ -f _redirects ] && echo "✅ _redirects presente" || echo "⚠️ Falta _redirects"

# 📦 Crear carpeta dist/
mkdir -p dist

# 📤 Mover archivos blindados
for archivo in "${archivos[@]}"; do
  cp -f "$archivo" dist/
done

# 📜 Log visual
echo -e "\n\e[1;32m✅ Empaquetado completado. Archivos movidos a dist/\e[0m"
echo -e "\e[0;33mListo para deploy en Netlify.\e[0m"

# 🎨 Arte simbólico
echo -e "\n\e[1;34m─────┤ SHAGGY INSTALABLE ├─────\e[0m"
echo -e "📦 index.html + manifest.json"
echo -e "🛡️  sw.js + _redirects"
echo -e "📱 icon-192.png + icon-512.png"
echo -e "🚀 dist/ listo para Netlify"
echo -e "\e[1;34m───────────────────────────────\e[0m"
