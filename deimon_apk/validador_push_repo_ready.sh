#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🚀 Validador de push repo-ready con token"
echo "────────────────────────────────────────────"

REPO_URL=$(git remote get-url origin)
FECHA=$(date +"%Y-%m-%d %H:%M:%S")
LOG="push_log_$(date +"%Y%m%d_%H%M%S").txt"

echo "📡 Repositorio vinculado:"
echo "$REPO_URL"

# Validar si el token está embebido
if echo "$REPO_URL" | grep -q "ghp_"; then
  echo "🔐 Token detectado en URL remota"
else
  echo "❌ No se detectó token en la URL. Reemplaza con:"
  echo "git remote set-url origin https://usuario:TOKEN@github.com/usuario/repo.git"
  exit 1
fi

# Intentar push
echo "📤 Ejecutando push táctico..."
git push -u origin main > "$LOG" 2>&1

if grep -q "To https://github.com" "$LOG"; then
  echo "✅ Push exitoso"
  echo "📝 Log generado: $LOG"
else
  echo "❌ Falló el push. Revisa el log: $LOG"
  tail -n 10 "$LOG"
fi

echo "────────────────────────────────────────────"
echo "📅 Fecha: $FECHA"
echo "📦 Estado repo-ready: $(grep -q 'To https://github.com' "$LOG" && echo '✔️ OK' || echo '❌ ERROR')"
