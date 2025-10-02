#!/data/data/com.termux/files/usr/bin/bash

clear

# Arte ASCII de bienvenida
cat <<EOF
╔════════════════════════════════════════════════════╗
║ 🚀 INSTALADOR DIGITALMIND OS — DEIMON ENTERPRISE  ║
╠════════════════════════════════════════════════════╣
║ Clonando, validando y lanzando la suite visual... ║
╚════════════════════════════════════════════════════╝
EOF
echo ""

# Validar entorno Termux
if [[ ! -d /data/data/com.termux/files/home ]]; then
  echo "❌ Este script solo funciona en Termux"
  exit 1
fi

# Clonar repositorio
echo "📦 Clonando DigitalMind OS..."
git clone https://github.com/shaggy0397/Digitalmind--os.git ~/digitalmind 2>/dev/null

# Validar clonación
if [[ ! -d ~/digitalmind ]]; then
  echo "❌ Error al clonar. Verifica la URL o la conexión."
  exit 1
fi

# Asignar permisos
chmod +x ~/digitalmind/*.sh
chmod +x ~/digitalmind/modules/*.sh 2>/dev/null
chmod +x ~/digitalmind/scripts/*.sh 2>/dev/null

# Lanzar copiloto modular
echo ""
echo "🧠 Lanzando DigitalMind OS..."
bash ~/digitalmind/digitalmind-live.sh
