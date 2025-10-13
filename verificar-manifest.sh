#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash
# 🧪 verificar-manifest.sh — Valida acceso al manifest.json remoto

URL="https://tu-sitio.netlify.app/manifest.json"  # ← reemplaza con tu URL real

echo "🔍 Verificando acceso al manifest.json..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" = "200" ]; then
  echo "✅ Manifest accesible: $URL"
  echo "
  ╔════════════════════════════╗
  ║  🧪 Manifest validado ✔️   ║
  ║  Flujo táctil puede iniciar ║
  ╚════════════════════════════╝
  "
else
  echo "❌ Manifest no accesible (HTTP $STATUS)"
  echo "⚠️ Verifica rutas, deploy o configuración en Netlify"
  exit 1
fi
