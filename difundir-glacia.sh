#!/data/data/com.termux/files/usr/bin/bash

CARPETA="$HOME/sh4c3y-v2"
QR="$CARPETA/qr-sh4c3y-v2.png"
README="$CARPETA/README.md"
HTML="$CARPETA/difundir.html"
ZIP="$HOME/sh4c3y-v2.zip"

echo "📲 Iniciando difusión repo-ready con GLACIA..."

# 1. Convertir QR a base64
BASE64=$(base64 -w 0 "$QR")

# 2. Incrustar QR en README
cat <<EOF >> "$README"

---

## 📲 Escanea el QR repo-ready

![QR SH4C3Y v2](data:image/png;base64,$BASE64)

🔗 [Accede al dashboard](https://shaggy0307.github.io/sh4c3y-v2/)
EOF

echo "✅ QR incrustado en README.md"

# 3. Generar HTML de difusión
cat <<EOF > "$HTML"
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Difusión SH4C3Y v2</title>
  <style>
    body {
      background: #0f2027;
      color: #fff;
      font-family: monospace;
      text-align: center;
      padding-top: 40px;
    }
    h1 {
      font-size: 2em;
      margin-bottom: 10px;
    }
    .qr {
      margin: 20px auto;
      width: 200px;
      height: 200px;
      border: 4px solid #fff;
      border-radius: 12px;
      box-shadow: 0 0 20px #00f0ff;
    }
    .boton {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background: #00f0ff;
      color: #000;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <h1>🧤 SH4C3Y v2 — Difusión repo-ready</h1>
  <img class="qr" src="data:image/png;base64,$BASE64" alt="QR SH4C3Y v2">
  <br>
  <a class="boton" href="https://shaggy0307.github.io/sh4c3y-v2/">Instalar ahora</a>
  <p style="margin-top:30px; font-size:0.8em;">Difundido por GLACIA</p>
</body>
</html>
EOF

echo "✅ HTML de difusión generado: difundir.html"

# 4. Empaquetar todo en ZIP
cd "$HOME"
zip -r "$ZIP" "sh4c3y-v2" > /dev/null
echo "✅ ZIP repo-ready generado: $ZIP"

# 5. Validación final
grep "base64" "$README" && echo "✅ Validación: QR incrustado en README" || echo "❌ Validación fallida"

echo "🎉 Difusión repo-ready completada por GLACIA. Proyecto listo para compartir, escanear y replicar."
