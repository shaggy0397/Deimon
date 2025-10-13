nano /storage/emulated/0/DEIMON_CORE/flujo/detectar_nichos.sh
chmod +x detectar_nichos.sh
bash detectar_nichos.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/ciclo_multilenguaje_total.sh
chmod +x ciclo_multilenguaje_total.sh
bash ciclo_multilenguaje_total.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/publicar_multilenguaje.sh
chmod +x publicar_multilenguaje.sh
bash publicar_multilenguaje.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/dashboard_global_multilenguaje.sh
chmod +x dashboard_global_multilenguaje.sh
bash dashboard_global_multilenguaje.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/ciclo_total_comercial.sh
chmod +x ciclo_total_comercial.sh
bash ciclo_total_comercial.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/empaquetar_multilenguaje.sh
chmod +x empaquetar_multilenguaje.sh
bash empaquetar_multilenguaje.sh
bash ciclo_total_comercial.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/integrar_hotmart.sh
chmod +x integrar_hotmart.sh
bash integrar_hotmart.sh
pkg install jq -y
nano integrar_hotmart.sh
chmod +x integrar_hotmart.sh
bash integrar_hotmart.sh
cat ../estado/hotmart_api_response.json
curl -v -X POST https://api-sec-vlc.hotmart.com/security/oauth/token   -H "Authorization: $HOTMART_BASIC"   -H "Content-Type: application/x-www-form-urlencoded"   -d "grant_type=client_credentials"
echo -n "456cc68c-23d9-4ce2-8a69-0691ffe8878e:a6630ac4-3dd4-453d-b4d8-0eebc433309e" | base64
export HOTMART_BASIC="Basic <resultado_base64>"
echo $HOTMART_BASIC
echo -n "456cc68c-23d9-4ce2-8a69-0691ffe8878e:a6630ac4-3dd4-453d-b4d8-0eebc433309e" | base64
export HOTMART_BASIC="Basic NDU2Y2M2OGMtMjNkOS00Y2UyLThhNjktMDY5MWZmZTg4NzhlOmE2NjMwYWM0LTNkZDQtNDUzZC1iNGQ4LTBlZWJjNDMzMzA5ZQ=="
echo $HOTMART_BASIC
curl -v -X POST https://api-sec-vlc.hotmart.com/security/oauth/token   -H "Authorization: $HOTMART_BASIC"   -H "Content-Type: application/x-www-form-urlencoded"   -d "grant_type=client_credentials"
curl -X POST https://api-sec-vlc.hotmart.com/catalog/v1/products   -H "Authorization: Bearer $ACCESS_TOKEN"   -H "Content-Type: application/json"   -d @../nichos/Productividad/product_en.json
nano /storage/emulated/0/DEIMON_CORE/flujo/consultar_hotmart.sh
chmod +x consultar_hotmart.sh
bash consultar_hotmart.sh
#!/bin/bash
clear
echo "╔══════════════════════════════════════════════╗"
echo "║   📦 LISTADO DE PRODUCTOS LISTOS PARA HOTMART ║"
echo "╠══════════════════════════════════════════════╣"
publicar="../publicar"
estado="../estado/listar_listos.log"
> "$estado"
for zip in $publicar/*.zip; do   [ -e "$zip" ] || { echo "⚠️  No hay ZIPs en $publicar"; exit 1; };   base=$(basename "$zip" .zip);   nicho=${base%_*};   lang=${base##*_};   product_json="../nichos/$nicho/product_${lang}.json";    if [ -f "$product_json" ]; then     echo "║ ✅ $base → listo para subir" | tee -a "$estado";   else     echo "║ ⚠️ $base → falta $product_json" | tee -a "$estado";   fi; done
echo "╚══════════════════════════════════════════════╝"
echo "📑 Log generado en $estado"
nano crear_json_es.sh
chmod +x crear_json_es.sh
bash crear_json_es.sh
nano listar_listos.sh
chmod +x listar_listos.sh
bash listar_listos.sh
nano institutriz_maestro.sh
chmod +x institutriz_maestro.sh
bash institutriz_maestro.sh
cat ../estado/dashboard_global.txt
namo listar_listos.sh
nano analizar_json_maestro.sh
chmod +x analizar_json_maestro.sh
bash analizar_json_maestro.sh
nano dashboard_jsons.sh
chmod +x dashboard_jsons.sh
bash dashboard_jsons.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/generar_descripciones_multilenguaje.sh
chmod +x generar_descripciones_multilenguaje.sh
bash generar_descripciones_multilenguaje.sh
bash analizar_json_maestro.sh
bash generar_descripciones_multilenguaje.sh
bash dashboard_jsons.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/generar_descripciones_multilenguaje.sh
bash generar_descripciones_multilenguaje.sh
bash dashboard_jsons.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/ciclo_repo_ready.sh
chmod +x ciclo_repo_ready.sh
bash ciclo_repo_ready.sh
nano validador_comercial.sh
chmod +x validador_comercial.sh
bash validador_comercial.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/generar_descripciones_multilenguaje.sh
bash generar_descripciones_multilenguaje.sh
bash validador_comercial.sh
find .. -type f -name "product_*.json"
mkdir -p ../backup_jsons
mv "../publicar/Productividad_es" "../backup_jsons/"
mv "../publicar/Productividad_es (1)" "../backup_jsons/"
bash ciclo_repo_ready.sh
bash validador_comercial.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/generar_descripciones_multilenguaje.sh
bash generar_descripciones_multilenguaje.sh
bash validador_comercial.sh
chmod +x generar_descripciones_multilenguaje.sh
bash validador_comercial.sh
ls -l generar_descripciones_multilenguaje.sh
cd /storage/emulated/0/DEIMON_CORE/flujo
nano /storage/emulated/0/DEIMON_CORE/flujo/validador_ebooks.sh
chmod +x validador_ebooks.sh
bash validador_ebooks.sh
ls ../ebooks/
mkdir ../ebooks
nano /storage/emulated/0/DEIMON_CORE/flujo/insertar_rutas_ebooks.sh
chmod +x insertar_rutas_ebooks.sh
bash insertar_rutas_ebooks.sh
mkdir ../ebooks
mv /sdcard/Download/productividad_es.pdf ../ebooks/
ls /sdcard/Download/
mv "/sdcard/Download/productividad_es.pdf" ../ebooks/
find /sdcard/ -iname "*productividad*.pdf"
find /sdcard/ -iname "*.pdf"
mv "/sdcard/DEIMON_CORE/nichos/Desarrollo Personal/ebook.pdf" ../ebooks/desarrollo_personal_es.pdf
nano /storage/emulated/0/DEIMON_CORE/flujo/migrar_ebooks.sh
chmod +x migrar_ebooks.sh
bash migrar_ebooks.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/migrar_ebooks_v2.sh
chmod +x migrar_ebooks_v2.sh
bash migrar_ebooks_v2.sh
mv "/ruta/original/ebook.pdf" "../ebooks/marketing_digital_es.pdf"
find ../ -type f -name "ebook.pdf"
mv "../nichos/Productividad/Productividad-ebook/ebook.pdf" "../ebooks/productividad_es.pdf"
mv "../nichos/Marketing Digital/ebook.pdf" "../ebooks/marketing_digital_es.pdf"
mv "../nichos/Finanzas Personales/ebook.pdf" "../ebooks/finanzas_personales_es.pdf"
mv "../nichos/Inteligencia Artificial/ebook.pdf" "../ebooks/inteligencia_artificial_es.pdf"
mv "../backup_jsons/Productividad_es (1)/ebook.pdf" "../ebooks/productividad_es.pdf"
mv "../nichos/ebook.pdf" "../ebooks/<nicho>_<idioma>.pdf"
bash validador_ebooks.sh
mkdir -p ../ebooks
mv "../nichos/Productividad/Productividad-ebook/ebook.pdf" "../ebooks/productividad_es.pdf"
mv "../nichos/Marketing Digital/ebook.pdf" "../ebooks/marketing_digital_es.pdf"
mv "../nichos/Finanzas Personales/ebook.pdf" "../ebooks/finanzas_personales_es.pdf"
mv "../nichos/Inteligencia Artificial/ebook.pdf" "../ebooks/inteligencia_artificial_es.pdf"
mv "../backup_jsons/Productividad_es (1)/ebook.pdf" "../ebooks/productividad_es.pdf"
nano /storage/emulated/0/DEIMON_CORE/flujo/checklist_ebooks.sh
chmod +x checklist_ebooks.sh
bash checklist_ebooks.sh
mv "/ruta/del/ebook.pdf" "../ebooks/<nicho>_<idioma>.pdf"
mv "/sdcard/Download/Finanzas Personales PT.pdf" "../ebooks/finanzas_personales_pt.pdf"
ls /sdcard/Download/
nano /storage/emulated/0/DEIMON_CORE/flujo/explorar_descargas.sh
chmod +x explorar_descargas.sh
bash explorar_descargas.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/explorar_descargas_numerado.sh
chmod +x explorar_descargas_numerado.sh
bash explorar_descargas_numerado.sh
find ../ -type f -name "ebook.pdf"
ls /storage/emulated/0/DEIMON_CORE/ebooks
nano /storage/emulated/0/DEIMON_CORE/flujo/extraer_ebooks.sh
chmod +x extraer_ebooks.sh
bash extraer_ebooks.sh
bash checklist_ebooks.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/validador_pdf.sh
chmod +x validador_pdf.sh
bash validador_pdf.sh
nano /storage/emulated/0/DEIMON_CORE/flujo/reemplazar_pdfs_invalidos.sh
chmod +x reemplazar_pdfs_invalidos.sh
bash reemplazar_pdfs_invalidos.sh
cd /storage/emulated/0/DEIMON_CORE/ebooks
rm *.pdf *.zip
ls
cd /storage/emulated/0/1A/Appinven/autoebook-hotmart/menu_lote.sh
cd /storage/emulated/0/1A/Appinven
/storage/emulated/0/1A/Appinven/autoebook-hotmart/detectar_tendencia.sh
cd .../DEIMON_CORE/ebooks
detectar_tendencias.sh
ls
s
cd .../1A/Appinven
cd .../DEIMON_CORE/ebooks
nano validador-duplicados.sh
nano sincronizar-rutas.sh
nano explorar-rutas.sh
chmod +x validador-duplicados.sh
chmod +x sincronizar-rutas.sh
chmod +x explorar-rutas.sh
bash validador-duplicados.sh
bash sincronizar-rutas.sh
bash explorar-rutas.sh   /storage/emulated/0/1A/Appinven   /storage/emulated/0/DEIMON_CORE   /storage/emulated/0/1A/Appinven/autoebook-hotmart
cd
ls
cd
despertar-deimon.sh
nano pwa2apk.sh
chmod +x pwa2apk.sh
./pwa2apk.sh
adb install
pkg install android-tools
/data/data/com.termux/files/home/output/
ls
cd com.*
cd
cd com.*
nano init_pwa.sh
chmod +x init_pwa.sh
cd com.*
bubblewrap init --manifest=https://TU_URL_DEL_MANIFEST.json
pkg install proot-distro
proot-distro install ubuntu
proot-distro login ubuntu
./install_apk_local.sh
nano install_apk_local.sh
chmod +x install_apk_local.sh
./install_apk_local.sh
wget https://shaggy-digital-mind.netlify.app/app-release.apk -O ~/app-release.apk
nano publish_and_package.sh
chmod +x publish_and_package.sh
./publish_and_package.sh
nano vercel_publish.sh
chmod +x vercel_publish.sh
./vercel_publish.sh
vercel --prod
vercel logout
vercel login
cd
ls
cd
nano ciclo_repo_ready_apk.sh
chmod +x *.sh
bash ciclo_repo_ready_apk.sh
nano validador_apk_repo_ready.sh
nano ciclo_repo_ready_apk.sh
nano validador_apk_repo_ready.sh
nano ciclo_repo_ready_apk.sh
chmod +x *.sh
bash ciclo_repo_ready_apk.sh
nano instalador_apk_ascii.sh
chmod +x instalador_apk_ascii.sh
bash ciclo_repo_ready_apk.sh
am start -a android.intent.action.VIEW -d "file://$(realpath ./downloads/Qwen Chat v1.3.1 [FileCR].apk)" -t "application/vnd.android.package-archive"
nano publicador_apk_github.sh
chmod +x publicador_apk_github.sh
bash ciclo_repo_ready_apk.sh
cd /storage/emulated/0/app11
nano validador_apk_repo_ready.sh
chmod +x validador_apk_repo_ready.sh
bash validador_apk_repo_ready.sh
nano publicador_pwa_github.sh
chmod +x publicador_pwa_github.sh
bash publicador_pwa_github.sh
nano manifest_validador_url_pwabuilder.sh
chmod +x manifest_validador_url_pwabuilder.sh
bash manifest_validador_url_pwabuilder.sh
nano manifest_publicador_pwabuilder.sh
chmod +x manifest_publicador_pwabuilder.sh
bash manifest_publicador_pwabuilder.sh
nano manifest_publicador_pwabuilder.sh
chmod +x manifest_publicador_pwabuilder.sh
bash manifest_publicador_pwabuilder.sh
git commit -m "🧩 Subida repo-ready: PWA lista para empaquetar como APK"
git push -u origin main
git remote set-url origin https://<usuario>:<nuevo_token>@github.com/<usuario>/<repo>.git
git remote set-url origin https://mariodeimon:ghp_NUEVOTOKEN123@github.com/mariodeimon/pwa-chat.git
git push -u origin main
git config --global credential.helper store
git push -u origin main
cd /storage/emulated/0/app11
git config --global --add safe.directory "$(pwd)"
git init
git remote add origin https://github.com/shaggy0397/Pwa-app11.git
git branch -M main
git remote set-url origin https://github.com/shaggy0397/Pwa-app11.git
git add .
git commit -m "🚀 Subida repo-ready: PWA lista para empaquetado como APK"
git push -u origin main
nano repositorio_vinculador_repo_ready.sh
chmod +x repositorio_vinculador_repo_ready.sh
bash repositorio_vinculador_repo_ready.sh
nano empaquetador_pwabuilder_ascii.sh
chmod +x empaquetador_pwabuilder_ascii.sh
bash empaquetador_pwabuilder_ascii.sh
cd /storage/emulated/0/app11
git add manifest.json
git commit -m "🧩 Añadiendo manifest.json para empaquetado PWA"
git push -u origin main
git add .
git commit -m "🧩 Añadiendo manifest.json para empaquetado PWA"
git remote set-url origin https://shaggy0397:<TU_TOKEN>@github.com/shaggy0397/Pwa-app11.git
~/.git-credentials
cat ~/.git-credentials
git config --global credential.helper store
git push -u origin main
git config --global credential.helper store
git push -u origin main
git config --global credential.helper store
git push -u origin main
git config --global credential.helper store
git push -u origin main
cat ~/.git-credentials
git remote set-url origin https://shaggy0397:TU_TOKEN@github.com/shaggy0397/Pwa-app11.git
git remote set-url origin https://shaggy0397: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@github.com/shaggy0397/Pwa-app11.git
git push -u origin main
nano validador_push_repo_ready.sh
chmod +x validador_push_repo_ready.sh
bash validador_push_repo_ready.sh
git remote set-url origin https://shaggy0397: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@github.com/shaggy0397/Pwa-app11.git
git push -u origin main
nano empaquetador_deimon_repo_ready.sh
chmod +x empaquetador_deimon_repo_ready.sh
bash empaquetador_deimon_repo_ready.sh
ls /storage/emulated/0/app11/manifest.json
cd /storage/emulated/0/app11
git add manifest.json
git commit -m "🧩 Añadiendo manifest.json para empaquetado DEIMON"
git remote -v
nano ciclo_deimon_repo_ready.sh
chmod +x ciclo_deimon_repo_ready.sh
bash ciclo_deimon_repo_ready.sh
ls /storage/emulated/0/app11/manifest.json
git add manifest.json
git commit -m "🧩 Añadiendo manifest.json para empaquetado DEIMON"
git push -u origin main
nano ciclo_deimon_apk_repo_ready.sh
chmod +x ciclo_deimon_apk_repo_ready.sh
bash ciclo_deimon_apk_repo_ready.sh
https://raw.githubusercontent.com/shaggy0397/Pwa-app11/main/manifest.json
git add manifest.json
git commit -m "🧩 Forzando seguimiento de manifest.json"
git push origin main
nano validador_iconos_manifest.sh
chmod +x validador_iconos_manifest.sh
bash validador_iconos_manifest.sh
nano validador_iconos_manifest.sh
chmod +x validador_iconos_manifest.sh
bash validador_iconos_manifest.sh
nano corregir_iconos_manifest.sh
chmod +x corregir_iconos_manifest.sh
bash corregir_iconos_manifest.sh
chmod +x corregir_commit_push_manifest.sh
bash corregir_commit_push_manifest.sh
nano corregir_commit_push_manifest.sh
chmod +x corregir_commit_push_manifest.sh
bash corregir_commit_push_manifest.sh
chmod +x corregir_commit_push_manifest.sh
bash corregir_commit_push_manifest.sh
find . -iname "manifest.json"
git ls-tree -r origin/main --name-only | grep manifest.json
find . -iname "manifest.json"
nano verificar_commit_manifest.sh
chmod +x verificar_commit_manifest.sh
bash verificar_commit_manifest.sh
echo " " >> manifest.json
git add manifest.json
git commit -m "🧩 Forzando reindexación de manifest.json"
git push origin main
https://raw.githubusercontent.com/shaggy0397/Pwa-app11/main/manifest.json
git branch -r
# Forzar modificación mínima
echo " " >> manifest.json
# Agregar al commit
git add manifest.json
# Confirmar commit
git commit -m "🧩 Forzando inclusión y reindexación de manifest.json"
# Push táctico
git push origin main
# Forzar modificación mínima
echo " " >> manifest.json
# Confirmar que está rastreado
git status
# Agregar y commit
git add manifest.json
git commit -m "🧩 Forzando reindexación final de manifest.json"
git push origin main
nano empaquetador_deimon_apk.sh
chmod +x empaquetador_deimon_apk.sh
bash empaquetador_deimon_apk.sh
nano empaquetador_apk_deimon.sh
chmod +x empaquetador_apk_deimon.sh
bash empaquetador_apk_deimon.sh
chmod +x empaquetador_apk_deimon.sh
bash empaquetador_apk_deimon.sh
nano validador_sitio_manifest_repo_ready.sh
chmod +x validador_sitio_manifest_repo_ready.sh
bash validador_sitio_manifest_repo_ready.sh
nano renombrar_index_repo_ready.sh
chmod +x renombrar_index_repo_ready.sh
bash renombrar_index_repo_ready.sh
bash validador_sitio_manifest_repo_ready.sh
bash empaquetador_apk_deimon.sh
curl -I https://shaggy0397.github.io/Pwa-app11/manifest.json
npx pwabuilder https://shaggy0397.github.io/Pwa-app11/manifest.json --platform android
rm -rf cordova
npx pwabuilder https://shaggy0397.github.io/Pwa-app11/manifest.json --platform android
nano empaquetador_apk_blindado.sh
chmod +x empaquetador_apk_blindado.sh
bash empaquetador_apk_blindado.sh
curl -I https://shaggy0397.github.io/Pwa-app11/manifest.json
rm -rf cordova
npx pwabuilder https://shaggy0397.github.io/Pwa-app11/manifest.json --platform android
rm -rf cordova
npx pwabuilder https://shaggy0397.github.io/Pwa-app11/manifest.json --platform android
nano migrador_repo_ready.sh
chmod +x migrador_repo_ready.sh
bash migrador_repo_ready.sh
nano empaquetador_apk_desde_home.sh
chmod +x empaquetador_apk_desde_home.sh
bash empaquetador_apk_desde_home.sh
rm -rf cordova
npm cache clean --force
curl -I https://shaggy0397.github.io/Pwa-app11/manifest.json
wget https://shaggy0397.github.io/Pwa-app11/manifest.json -O test_manifest.json
mkdir -p $HOME/deimon_apk
cp -r /storage/emulated/0/app11/* $HOME/deimon_apk/
cd $HOME/deimon_apk
rm -rf cordova
npm cache clean --force
npx pwabuilder --manifest https://shaggy0397.github.io/Pwa-app11/manifest.json --platform android
npx pwabuilder init --manifest https://shaggy0397.github.io/Pwa-app11/manifest.json
npx pwabuilder init https://shaggy0397.github.io/Pwa-app11/
npx pwabuilder init
nano empaquetador_bubblewrap.sh
chmod +x empaquetador_bubblewrap.sh
bash empaquetador_bubblewrap.sh
curl -I https://pwa-app11.vercel.app/
# Instalar Node.js si no está
pkg install nodejs -y
# Instalar Bubblewrap
npm install -g @bubblewrap/cli
# Crear carpeta de trabajo
mkdir -p ~/pwa-local && cd ~/pwa-local
# Iniciar empaquetado
bubblewrap init --manifest https://pwa-app11.vercel.app/manifest.json
# Compilar APK
bubblewrap build
nano install-pwa-local.sh
./install-pwa-local.sh
chmod +x install-pwa-local.sh
./install-pwa-local.sh
nano deploy-cycle.sh6
./deploy-cycle.sh
chmod +x deploy-cycle.sh
./deploy-cycle.sh
nano deploy-cycle.sh6
./install-pwa-local.sh
#!/data/data/com.termux/files/usr/bin/bash
CARPETA="/storage/emulated/0/apkdei01"
FECHA=$(date +"%Y-%m-%d %H:%M:%S")
LOG="$CARPETA/deploy-history.log"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔍 REVISANDO CARPETA: $CARPETA"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cd "$CARPETA" || { echo "❌ Carpeta no encontrada"; exit 1; }
# Validar manifest.json
if [ ! -f "manifest.json" ]; then   echo "⚠️ manifest.json no encontrado. Generando..."
  cat > manifest.json <<EOF
{
  "name": "SHAGGY digital mind",
  "short_name": "SHAGGY",
  "description": "Tu asistente de memoria digital. ¡Bienvenido!",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#000000",
  "theme_color": "#00ffcc",
  "icons": [
    { "src": "/icon-192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "/icon-512.png", "sizes": "512x512", "type": "image/png" }
  ]
}
EOF
   echo "✅ manifest.json generado"; else   echo "✅ manifest.json presente"; fi
# Validar sw.js
if [ ! -f "sw.js" ]; then   echo "⚠️ sw.js no encontrado. Generando..."
  cat > sw.js <<EOF
self.addEventListener('install', e => {
  console.log('✅ Service Worker instalado');
});
self.addEventListener('fetch', e => {
  e.respondWith(fetch(e.request));
});
EOF
   echo "✅ sw.js generado"; else   echo "✅ sw.js presente"; fi
# Validar íconos
for SIZE in 192 512; do   ICON="icon-$SIZE.png";   if [ ! -f "$ICON" ]; then     echo "⚠️ $ICON no encontrado. Generando desde base.png...";     convert base.png -resize ${SIZE}x${SIZE} "$ICON";     echo "✅ $ICON generado";   else     echo "✅ $ICON presente";   fi; done
# Validar APK
APK=$(ls *.apk 2>/dev/null | head -n 1)
if [ -z "$APK" ]; then   echo "❌ No se encontró ningún APK en $CARPETA"; else   echo "✅ APK encontrado: $APK";   ls -lh "$APK"; fi
# Arte ASCII y log
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "     ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄     "
echo "    █░ CARPETA REPO-READY ✅ ░█"
echo "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█    "
echo "📜 Log registrado en $LOG"
echo "$FECH
CARPETA="/storage/emulated/0/apkdei01"
FECHA=$(date +"%Y-%m-%d %H:%M:%S")
o
# Arte ASCII y log
cd
cd
cd
nano ~/vercel_prep.sh
ls
cd
deimon-launcher.sh
nano deploy-deimon.sh
chmod +x deploy-deimon.sh
./deploy-deimon.sh
chmod +x deploy-deimon.sh
./deploy-deimon.shcd deimon-pwa
rm icons/splash-1024.png
