#!/data/data/com.termux/files/usr/bin/bash
# 📦 empaquetar-pwa.sh — Convierte PWA en APK repo-ready

echo "⛩️ Iniciando ritual táctil de empaquetado PWA → APK..."

# 🔍 Validar JDK
JDK_PATH="/data/data/com.termux/files/usr/lib/jvm/openjdk-17"
if [ ! -d "$JDK_PATH" ]; then
  echo "❌ JDK 17 no encontrado en $JDK_PATH"
  echo "🔧 Ejecuta: pkg install openjdk-17"
  exit 1
fi

# 🔍 Validar Bubblewrap
if ! command -v bubblewrap &> /dev/null; then
  echo "❌ Bubblewrap no está instalado"
  echo "🔧 Ejecuta: npm install -g @bubblewrap/cli"
  exit 1
fi

# 🔍 Validar manifest
MANIFEST_URL="https://curious-fenglisu-e5b0b6.netlify.app/manifest.json"
curl --head --silent "$MANIFEST_URL" | grep "200 OK" > /dev/null
if [ $? -ne 0 ]; then
  echo "❌ Manifest no accesible en: $MANIFEST_URL"
  echo "🔧 Verifica que el sitio esté activo en Netlify"
  exit 1
fi

# 🛠️ Inicializar proyecto TWA
echo "📦 Inicializando proyecto TWA..."
bubblewrap init --manifest "$MANIFEST_URL" --jdk "$JDK_PATH"

# 🛠️ Compilar APK
echo "🔨 Compilando APK..."
cd $(ls -d */ | grep -m1 curious-fenglisu)
bubblewrap build

# 📁 Mover APK a ruta táctil
APK_PATH=$(find output -name "*.apk" | head -n 1)
DEST="/storage/emulated/0/1A/Appinven"
mkdir -p "$DEST"
cp "$APK_PATH" "$DEST"

# 🧪 Validación sintomática
echo "✅ APK generado y movido a: $DEST"
ls "$DEST" | grep ".apk"

# 📲 Lanzador táctil
echo "🚀 Lanzando instalador..."
am start -a android.intent.action.VIEW \
  -d "file://$DEST/$(basename $APK_PATH)" \
  -t "application/vnd.android.package-archive"

# 🎨 Arte ASCII final
echo "
.-.  |  ||  | .-. | .-. |  | .-. |  |.'.|  |  .--' ,-.  | .-. |
|  '--' '  ''  | `-' | `-' |  \   --|   .'.   |  |  \ '-'  | '-' '
\`------' \`----' \`---' \`---'\`--'\`----'--'   '--\`--'   \`--\`--|  |-'
                                                           \`--'
🎯 Ritual repo-ready completado. APK táctil listo para instalar.
"

# 🧾 Registrar empaquetado en log visual
LOG="/storage/emulated/0/1A/Appinven/log-empaquetado.txt"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

if [ -f "$DEST/$(basename $APK_PATH)" ]; then
  echo "$FECHA ✅ APK generado en: $DEST/$(basename $APK_PATH)" >> "$LOG"
else
  echo "$FECHA ❌ APK no encontrado en $DEST" >> "$LOG"
fi

echo "🧾 Log actualizado en: $LOG"
