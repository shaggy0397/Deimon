#!/bin/bash

ESTADO=$(cat .estado-deimon 2>/dev/null)
if [ "$ESTADO" != "ACTIVO" ]; then
  echo "❌ Núcleo sintomático inactivo. Publicación bloqueada."
  exit 1
fi

echo "✅ Núcleo activo. Publicando..."
echo "git add . && git commit -m 'Publicación repo-ready DEIMON' && git push"
