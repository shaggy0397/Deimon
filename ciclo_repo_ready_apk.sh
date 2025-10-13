#!/data/data/com.termux/files/usr/bin/bash

echo "────────────────────────────────────────────"
echo "🎯 CICLO MAESTRO REPO-READY: APK SIN PC"
echo "────────────────────────────────────────────"

bash validador_apk_repo_ready.sh || { echo "❌ Validación fallida"; exit 1; }
bash instalador_apk_ascii.sh || { echo "❌ Instalación fallida"; exit 1; }
bash publicador_apk_github.sh || { echo "❌ Publicación fallida"; exit 1; }
bash validador_manifest_publicador.sh || { echo "❌ Validación de manifest fallida"; exit 1; }
bash empaquetador_pwa_apk.sh || { echo "❌ Empaquetado fallido"; exit 1; }

echo "────────────────────────────────────────────"
echo "🎉 CICLO COMPLETO FINALIZADO CON ÉXITO"
echo "📦 APK validado, instalado, publicado y empaquetado sin PC"
