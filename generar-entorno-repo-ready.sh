#!/data/data/com.termux/files/usr/bin/bash
# 🧙‍♂️ generar-entorno-repo-ready.sh — Valida y genera todos los scripts táctiles

FECHA=$(date "+%Y-%m-%d %H:%M:%S")
LOG="/storage/emulated/0/1A/Appinven/log-generacion.txt"
CARPETA="/storage/emulated/0/1A/Appinven"
mkdir -p "$CARPETA"

echo "🧙‍♂️ Iniciando generación total del entorno repo-ready..."
echo "$FECHA 🧙‍♂️ Generación iniciada" >> "$LOG"

# 📜 Lista de scripts a generar
declare -A SCRIPTS

SCRIPTS["validar-jdk.sh"]="#!/bin/bash\necho '🔍 Validando JDK...'\njavac -version"
SCRIPTS["verificar-origen.sh"]="#!/bin/bash\necho '📁 Verificando carpeta origen...'\nls /storage/emulated/0/1A/Appinven"
SCRIPTS["blindar-dist.sh"]="#!/bin/bash\nmkdir -p /storage/emulated/0/1A/Appinven/dist\necho '🛡️ Carpeta dist blindada'"
SCRIPTS["verificar-apk.sh"]="#!/bin/bash\nls /storage/emulated/0/1A/Appinven/dist/*.apk"
SCRIPTS["generar-readme.sh"]="#!/bin/bash\necho '# Appinven' > /storage/emulated/0/1A/Appinven/README.md\necho '📘 README generado'"
SCRIPTS["compartir-repo.sh"]="#!/bin/bash\nzip -r /storage/emulated/0/1A/Compartido/Appinven-\$(date +%Y%m%d-%H%M).zip /storage/emulated/0/1A/Appinven/dist"
SCRIPTS["publicar-netlify.sh"]="#!/bin/bash\nnetlify deploy --prod --dir=/storage/emulated/0/1A/Appinven/dist"
SCRIPTS["instalador-local.sh"]="#!/bin/bash\nAPK=/storage/emulated/0/1A/Appinven/dist/Appinven.apk\nam start -a android.intent.action.VIEW -d \"file://\$APK\" -t \"application/vnd.android.package-archive\""
SCRIPTS["blindaje-total.sh"]="#!/bin/bash\nbash ~/regenerar-dist.sh"
SCRIPTS["regenerar-dist.sh"]="#!/bin/bash\nmkdir -p /storage/emulated/0/1A/Appinven/dist\necho '<html><body>Appinven</body></html>' > /storage/emulated/0/1A/Appinven/dist/index.html"
SCRIPTS["ritual-autocuracion.sh"]="#!/bin/bash\nbash ~/blindaje-total.sh && bash ~/generar-readme.sh && bash ~/compartir-repo.sh && bash ~/publicar-netlify.sh"

# 🧠 Generar cada script si no existe
for nombre in "${!SCRIPTS[@]}"; do
  RUTA=~/"$nombre"
  if [ ! -f "$RUTA" ]; then
    echo "⚙️ Generando script: $nombre"
    echo -e "${SCRIPTS[$nombre]}" > "$RUTA"
    chmod +x "$RUTA"
    echo "$FECHA ✅ Script generado: $nombre" >> "$LOG"
  else
    echo "✅ Script ya existe: $nombre"
  fi
done

echo "
╔════════════════════════════════════╗
║  ✅ Entorno repo-ready regenerado   ║
║  Todos los scripts están listos ✔️ ║
╚════════════════════════════════════╝
"
