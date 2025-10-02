#!/data/data/com.termux/files/usr/bin/bash

echo ""
echo "🚀 Iniciando publicación de DigitalMind OS..."

# Ruta base
cd ~/digitalmind || {
  echo "❌ Carpeta ~/digitalmind no encontrada"
  exit 1
}

# Verificar configuración de Git
name=$(git config --global user.name)
email=$(git config --global user.email)

if [[ -z "$name" || -z "$email" ]]; then
  echo "⚠️ Git no está configurado. Configurando ahora..."
  git config --global user.name "Mario"
  git config --global user.email "mario@deimon.local"
  echo "✅ Git configurado como Mario <mario@deimon.local>"
fi

# Inicializar repositorio si no existe
if [[ ! -d .git ]]; then
  echo "📦 Inicializando repositorio..."
  git init
fi

# Agregar remoto si no existe
remote=$(git remote get-url origin 2>/dev/null)
if [[ -z "$remote" ]]; then
  echo "🔗 Agregando remoto..."
  git remote add origin https://github.com/shaggy0397/digitalmind-os.git
fi

# Agregar archivos y hacer commit
echo "📁 Agregando archivos..."
git add .
git commit -m "Genesis Drop: DigitalMind OS v1.0"

# Empujar a GitHub
echo "📤 Empujando a GitHub..."
git push -u origin master || echo "⚠️ Si el repo es privado, usa tu token en el remoto"

echo ""
echo "🎉 DigitalMind OS publicado correctamente"
echo "🌐 Verifica en: https://github.com/shaggy0397/digitalmind-os"
