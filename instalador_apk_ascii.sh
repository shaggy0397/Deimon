#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🎯 Instalador APK repo-ready desde Termux"
echo "────────────────────────────────────────────"

APK=$(find . -type f -name "*.apk" | head -n 1)

if [ -z "$APK" ]; then
  echo "❌ No se encontró ningún archivo APK en esta carpeta"
  exit 1
fi

BYTES=$(stat -c%s "$APK")
if [ "$BYTES" -lt 102400 ]; then
  echo "⚠️ APK demasiado pequeño ($BYTES bytes). Posible error de build"
  exit 1
fi

echo "📦 APK detectado: $APK"
echo "📏 Tamaño: $(du -h "$APK" | cut -f1)"
echo "🔐 Validando permisos de lectura..."
ls -l "$APK"

echo "────────────────────────────────────────────"
echo "🚀 Iniciando instalación local del APK..."
echo "────────────────────────────────────────────"
echo "     _______  _______  __   __  _______ "
echo "    |       ||   _   ||  | |  ||       |"
echo "    |    ___||  |_|  ||  |_|  ||  _____|"
echo "    |   |___ |       ||       || |_____ "
echo "    |    ___||       ||       ||_____  |"
echo "    |   |___ |   _   ||   _   | _____| |"
echo "    |_______||__| |__||__| |__||_______|"
echo "────────────────────────────────────────────"

pm install -r "$APK"

if [ $? -eq 0 ]; then
  echo "✅ Instalación completada con éxito"
else
  echo "❌ Error durante la instalación"
fi

echo "────────────────────────────────────────────"
echo "🏁 Fin del ciclo repo-ready de instalación"
