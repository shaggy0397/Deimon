#!/data/data/com.termux/files/usr/bin/bash
# ╔════════════════════════════════════════════════════╗
# ║ 💾 SHAGGY GUARDAR — Módulo único repo-ready        ║
# ╚════════════════════════════════════════════════════╝

# 📁 Rutas absolutas
DIR="$HOME/.shaggy"
ARCHIVO="$DIR/notas_guardadas.txt"
HASHFILE="$DIR/.hash_nota"

# 🧠 Validación inicial
mkdir -p "$DIR"
touch "$ARCHIVO" "$HASHFILE"

# 🎨 Interfaz visual
echo -e "\n╔════════════════════════════════╗"
echo -e "║ 💾 GUARDAR NUEVA NOTA EN SHAGGY ║"
echo -e "╚════════════════════════════════╝"
read -p "📝 Escribe tu nota: " nota

# 🚫 Validación sintomática
if [[ -z "$nota" ]]; then
  echo -e "\n⚠️ Nota vacía. Abortando guardado."
  exit 1
fi
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# 📝 Guardado con timestamp
echo "$(date '+%Y-%m-%d %H:%M:%S') - $nota" >> "$ARCHIVO"

# 🔐 Validación SHA
sha256sum "$ARCHIVO" | awk '{print $1}' > "$HASHFILE"

# ✅ Feedback visual
echo -e "\n✅ Nota guardada correctamente."
echo -e "🔐 SHA generado: $(cat "$HASHFILE")"
echo -e "\n📂 Archivo: $ARCHIVO"
echo -e "📄 Última nota:"
tail -n 1 "$ARCHIVO"

# 🧪 Diagnóstico final
echo -e "\n🧠 Diagnóstico sintomático:"
[[ -s "$ARCHIVO" ]] && echo "✔️ Archivo contiene notas." || echo "❌ Archivo vacío."
[[ -s "$HASHFILE" ]] && echo "✔️ SHA generado." || echo "❌ SHA no generado."
