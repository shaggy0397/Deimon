#!/data/data/com.termux/files/usr/bin/bash
# 🛡️ validar-jdk.sh — Detecta JDK 17 en Termux automáticamente

echo "🔍 Buscando JDK 17 en Termux..."

JDK_PATH=$(find /data/data/com.termux/files/usr/lib/jvm/ -type d -name "java-17-openjdk" | head -n 1)

if [ -z "$JDK_PATH" ]; then
  echo "❌ JDK 17 no encontrado en /usr/lib/jvm/"
  echo "🔧 Ejecuta: pkg install openjdk-17"
  exit 1
else
  echo "✅ JDK 17 detectado en:"
  echo "$JDK_PATH"
  echo "
  .-.   .-.   .-.   .-.   .-.   .-.
 /   \ /   \ /   \ /   \ /   \ /   \\
| J | | D | | K | | 1 | | 7 | | ✔ |
 \___/ \___/ \___/ \___/ \___/ \___/
  "
fi
