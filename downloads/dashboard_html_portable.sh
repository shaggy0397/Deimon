#!/bin/bash
clear
echo "🌐 DEIMON CORE - Dashboard HTML Portable"
fecha=$(date '+%Y-%m-%d %H:%M')
destino="/storage/emulated/0/Download/dashboard_assets"
html="/storage/emulated/0/Download/dashboard.html"
mkdir -p "$destino"

# Nichos táctiles
nichos=("Desarrollo Personal" "Marketing Digital" "Finanzas Personales" "Productividad" "Inteligencia Artificial")

# Inicia HTML
echo "<html><head><title>Dashboard Repo-Ready</title></head><body>" > "$html"
echo "<h2>📅 Fecha del ciclo: $fecha</h2>" >> "$html"
echo "<table border='1'><tr><th>Nicho</th><th>Peso ZIP</th><th>Estado</th><th>Resumen</th></tr>" >> "$html"

# Por nicho
for nicho in "${nichos[@]}"; do
  zip="/storage/emulated/0/DEIMON_CORE/nichos/$nicho/${nicho// /_}-ebook.zip"
  resumen="/storage/emulated/0/DEIMON_CORE/nichos/$nicho/resumen.txt"
  resumen_destino="${destino}/${nicho// /_}_resumen.txt"

  if [ -f "$zip" ]; then
    peso=$(du -k "$zip" | cut -f1)
    estado="✅ Validado"
    cp "$resumen" "$resumen_destino"
    echo "<tr><td>$nicho</td><td>${peso}KB</td><td>$estado</td><td><a href='dashboard_assets/${nicho// /_}_resumen.txt'>Resumen</a></td></tr>" >> "$html"
  else
    echo "<tr><td>$nicho</td><td>❌ No encontrado</td><td>⚠️ Fallido</td><td>-</td></tr>" >> "$html"
  fi
done

echo "</table><p>🎯 Dashboard HTML portable generado</p></body></html>" >> "$html"
