#!/data/data/com.termux/files/usr/bin/bash

echo ""
echo "🧠 Instalando DigitalMind OS — DEIMON ENTERPRISE"
echo "🔍 Preparando entorno..."

# 1. Crear carpeta y clonar desde GitHub
mkdir -p ~/digitalmind
cd ~/digitalmind || exit
echo "📦 Clonando repositorio..."
git clone https://github.com/deimon-enterprise/digitalmind-os . || {
  echo "❌ Error al clonar. Verifica la URL o conexión."
  exit 1
}

# 2. Instalar dependencias
echo ""
echo "🔧 Instalando paquetes necesarios..."
pkg update -y && pkg upgrade -y
for pkg in termux-api python git tar; do
  command -v "$pkg" &>/dev/null || pkg install "$pkg" -y
done

# 3. Instalar módulos Python
echo ""
echo "🐍 Instalando módulos Python..."
pip install --upgrade pip
pip install SpeechRecognition wheel
pip install pyaudio || echo "⚠️ PyAudio falló, se usará termux-speech-to-text como alternativa"

# 4. Asignar permisos
echo ""
echo "🔐 Asignando permisos de ejecución..."
chmod +x *.sh

# 5. Crear acceso directo tipo DEIMON
echo ""
echo "🚀 Creando acceso directo..."
mkdir -p ~/.deimon/favorites
ln -sf ~/digitalmind/launcher.sh ~/.deimon/favorites/digitalmind

# 6. Confirmación final
echo ""
echo "🎉 DigitalMind OS instalado correctamente"
echo "👉 Ejecuta: bash ~/digitalmind/launcher.sh"
