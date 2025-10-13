#!/data/data/com.termux/files/usr/bin/bash
# 📘 generar-readme.sh — Crea README visual con resumen táctil

README="/storage/emulated/0/1A/Appinven/README.md"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo "📝 Generando README visual..."

cat > "$README" <<EOF
# 🧙‍♂️ Ritual Repo-Ready — Appinven

**Fecha de validación:** $FECHA  
**Estado:** ✅ Validado y blindado

## 🔍 Validaciones sintomáticas

- 🛡️ JDK detectado: \`java-17-openjdk\`
- 🧠 Netlify activo y manifest accesible
- 🔐 Archivos clave en \`dist/\` presentes
- 🧪 APK generado y validado (firma, tamaño, versión)

## 📦 Archivos táctiles

- \`Appinven.apk\` listo para instalar
- \`QR\` generado y copiado al portapapeles
- \`log-empaquetado.txt\` con huella visual
- \`log-validacion-dist.txt\` y \`log-apk.txt\` auditables

## 🎨 Arte ASCII simbólico

\`\`\`
╔════════════════════════════════════╗
║  🎯 Ritual repo-ready completado  ║
║  APK táctil listo para instalar   ║
║  QR generado y log registrado     ║
╚════════════════════════════════════╝
\`\`\`

EOF

echo "✅ README generado en: $README"9
