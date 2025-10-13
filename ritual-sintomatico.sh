#!/data/data/com.termux/files/usr/bin/bash
# 🧙‍♂️ ritual-sintomatico.sh — Validación total antes de empaquetar

echo "
╔════════════════════════════════════╗
║  🧠 Iniciando validación sintomática  ║
╚════════════════════════════════════╝
"

# 🛡️ Validar JDK
echo "🔍 Validando JDK..."
bash ~/validar-jdk.sh || exit 1

# 🧠 Verificar origen (Netlify + manifest)
echo "🧠 Verificando origen remoto..."
bash ~/verificar-origen.sh || exit 1

# 🔐 Validar archivos clave en dist/
echo "🔐 Validando archivos clave en dist..."
bash ~/blindar-dist.sh || exit 1

# 🧪 Validar APK generado
echo "🧪 Validando APK generado..."
bash ~/verificar-apk.sh || exit 1

# 📦 Si todo pasó, permitir empaquetado
echo "
╔════════════════════════════════════╗
║  ✅ Validación completa ✔️         ║
║  Puedes empaquetar y compartir     ║
╚════════════════════════════════════╝
"
