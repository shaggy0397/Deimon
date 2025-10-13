#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🛠️ Corrector automático de íconos en manifest.json"
echo "────────────────────────────────────────────"

MANIFEST="manifest.json"
BACKUP="manifest_backup_$(date +"%Y%m%d_%H%M%S").json"

# Paso 1: Verificar existencia
if [ ! -f "$MANIFEST" ]; then
  echo "❌ No se encontró $MANIFEST en la carpeta actual"
  exit 1
fi

# Paso 2: Crear backup
cp "$MANIFEST" "$BACKUP"
echo "📦 Backup creado: $BACKUP"

# Paso 3: Reemplazar URLs inválidas
jq '(.icons[] | select(.src | test("google.com/search"))).src |=
    if . == "https://www.google.com/search?q=https://placehold.co/192x192/4f46e5/ffffff%3Ftext%3DD"
    then "https://placehold.co/192x192/4f46e5/ffffff?text=D"
    elif . == "https://www.google.com/search?q=https://placehold.co/512x512/4f46e5/ffffff%3Ftext%3DDEIMON"
    then "https://placehold.co/512x512/4f46e5/ffffff?text=DEIMON"
    else .
    end' "$MANIFEST" > manifest_temp.json && mv manifest_temp.json "$MANIFEST"

echo "✅ URLs corregidas en $MANIFEST"
echo "🔍 Confirmación visual:"
jq '.icons[].src' "$MANIFEST"

echo "────────────────────────────────────────────"
echo "🏁 Manifest listo para commit y push repo-ready"
