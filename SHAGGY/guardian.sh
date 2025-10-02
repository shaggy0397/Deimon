#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Validando SHAGGY Digital Mind..."

# Validar archivos base
for file in index.html manifest.json sw.js; do
  if [ ! -f "$file" ]; then
    echo "❌ Falta $file"
  else
    echo "✅ $file presente"
  fi
done

# Validar carpeta de íconos
if [ -d "assets" ]; then
  echo "📁 Carpeta assets encontrada"
  for icon in icon-192.png icon-512.png; do
    if [ ! -f "assets/$icon" ]; then
      echo "❌ Falta $icon"
    else
      echo "✅ $icon listo"
    fi
  done
else
  echo "❌ Carpeta assets no encontrada"
fi

# Validar referencia en index.html
if grep -q "manifest.json" index.html && grep -q "sw.js" index.html; then
  echo "🔗 Referencias a manifest y SW detectadas"
else
  echo "⚠️ Verifica que el <head> incluya manifest y SW"
fi

# Validar instalación de http-server
if command -v http-server >/dev/null 2>&1; then
  echo "🧩 http-server instalado"
else
  echo "❌ http-server no está instalado"
fi

echo "✅ Validación completa. Ejecuta: http-server -p 8080"
