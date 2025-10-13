echo "🔟2️⃣ Compartir entorno repo-ready (ZIP táctil)"2echo "Selecciona una opción:"
echo "1️⃣ Validar JDK"
echo "2️⃣ Empaquetar PWA → APK"
echo "3️⃣ Generar QR + copiar ruta"
echo "4️⃣ Registrar en log visual"
echo "5️⃣ Ejecutar todo el ritual"
echo "6️⃣ Verificar manifest remoto"
7)
    echo "🧠 Verificando origen completo..."
    bash ~/verificar-origen.sh
    ;;
echo "0️⃣ Salir"
bash ~/ritual-final.sh

6)
    echo "🧪 Verificando manifest remoto..."
    bash ~/verificar-manifest.sh
    ;;
echo "8️⃣ Validar archivos clave en dist/"
echo "9️⃣ Validar APK generado (firma, tamaño, versión)"
