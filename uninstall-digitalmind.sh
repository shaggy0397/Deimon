#!/data/data/com.termux/files/usr/bin/bash

echo ""
echo "🧹 Desinstalando DigitalMind OS..."

# Ruta base
base="/data/data/com.termux/files/home/digitalmind"

# Verificar existencia
if [[ -d "$base" ]]; then
  echo "🧨 Eliminando carpeta del proyecto..."
  rm -rf "$base"
else
  echo "⚠️ Carpeta ~/digitalmind no encontrada"
fi

# Eliminar accesos directos
echo "🧨 Eliminando accesos en sistema DEIMON..."
rm -f ~/.deimon/favorites/digitalmind
rm -f ~/.deimon/modules/digitalmind.sh 2>/dev/null

# Eliminar historial
echo "🧨 Eliminando historial..."
rm -f ~/.deimon/history.log 2>/dev/null

# Confirmación final
echo ""
echo "✅ DigitalMind OS ha sido eliminado completamente"
echo "🧠 Puedes reinstalarlo con: bash setup-digitalmind.sh"
