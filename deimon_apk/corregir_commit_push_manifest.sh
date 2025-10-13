#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🔁 Corrección, commit y push de manifest.json"
echo "────────────────────────────────────────────"

MANIFEST="manifest.json"
BACKUP="manifest_backup_$(date +"%Y%m%d_%H%M%S").json"
MANIFEST_URL="https://raw.githubusercontent.com/shaggy0397/Pwa-app11/main/$MANIFEST"
LOG="manifest_log_$(date +"%Y%m%d_%H%M%S").txt"

# Paso 1: Verificar existencia
if [ ! -f "$MANIFEST" ]; then
  echo "❌ No se encontró $MANIFEST en la carpeta actual"
  exit 1
fi

# Paso 2: Crear backup
cp "$MANIFEST" "$BACKUP"
echo "📦 Backup creado: $BACKUP"

# Paso 3: Corregir íconos
jq '(.icons[] | select(.src | test("google.com/search"))).src |=
    if . == "https://www.google.com/search?q=https://placehold.co/192x192/4f46e5/ffffff%3Ftext%3DD"
    then "https://placehold.co/192x192/4f46e5/ffffff?text=D"
    elif . == "https://www.google.com/search?q=https://placehold.co/512x512/4f46e5/ffffff%3Ftext%3DDEIMON"
    then "https://placehold.co/512x512/4f46e5/ffffff?text=DEIMON"
    else .
    end' "$MANIFEST" > manifest_temp.json && mv manifest_temp.json "$MANIFEST"

echo "✅ Íconos corregidos"

# Paso 4: Git add + commit
git add "$MANIFEST"
git commit -m "🧩 Corrigiendo íconos en manifest.json para empaquetado DEIMON"

# Paso 5: Push táctico
git push origin main

# Paso 6: Validar publicación
echo "🔍 Validando publicación en GitHub..."
curl -s --head "$MANIFEST_URL" | head -n 1 | grep "200 OK" > /dev/null

if [ $? -eq 0 ]; then
  echo "✅ manifest.json publicado correctamente" | tee -a "$LOG"
else
  echo "❌ manifest.json no está accesible públicamente" | tee -a "$LOG"
fi

echo "────────────────────────────────────────────"
echo "📄 Log generado: $LOG"
cat "$LOG"
