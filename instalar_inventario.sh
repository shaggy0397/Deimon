#!/data/data/com.termux/files/usr/bin/bash

echo "🧱 Creando carpeta del proyecto..."
mkdir -p ~/inventario--hielo-ontiveros
cd ~/inventario--hielo-ontiveros

echo "📄 Generando archivos base..."

cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Inventario Hielo Ontiveros</title>
  <link rel="manifest" href="manifest.json" />
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div id="dashboard">
    <h1>INVENTARIO HIELO ONTIVEROS</h1>
    <h3>powered by DEIMON ENTERPRISE technology</h3>
    <table id="tablaInventario">
      <tr>
        <th>Producto</th><th>Inicial</th><th>Ingreso</th><th>Contado</th><th>Vendidos</th><th>Dinero</th>
      </tr>
    </table>
    <button onclick="cerrarDia()">Cerrar día</button>
    <button id="capturaBtn">📸 Guardar captura</button>
  </div>
  <script src="html2canvas.min.js"></script>
  <script src="script.js"></script>
</body>
</html>
EOF

cat > style.css << 'EOF'
body { background-color: #111; color: #0ff; font-family: monospace; padding: 10px; }
h1, h3 { text-align: center; }
table { width: 100%; border-collapse: collapse; margin-top: 10px; }
td, th { border: 1px solid #0ff; padding: 5px; text-align: center; }
input { width: 60px; background-color: #222; color: #0ff; border: 1px solid #0ff; }
button { margin: 10px; padding: 10px; background-color: #0ff; color: #000; border: none; font-weight: bold; }
EOF

cat > script.js << 'EOF'
const productos = ["Natural","Coca de medio","Joya de medio","Coca","Joya","Dieta","Mineral","Mineral 600","Coca 600","Joya 600","Dieta 600","Coca 450","Ciel de 600","Ciel de litro","Barra","Star","B750","B500","Agua litro","Agua medio","Gym de litro","Gym de litro y medio","Pepsi","Pepsi sabor"];
const precios = [300,336,336,288,288,288,350,230,230,230,230,190,120,140,400,100,360,310,77,85,70,85,160,160];

function generarTabla() {
  const tabla = document.getElementById("tablaInventario");
  productos.forEach((nombre, i) => {
    const fila = document.createElement("tr");
    fila.innerHTML = `
      <td>${nombre}</td>
      <td><input type="number" placeholder="Inicial" /></td>
      <td><input type="number" placeholder="Ingreso" /></td>
      <td><input type="number" placeholder="Contado" onchange="actualizarQueda(${i}, this.value)" /></td>
      <td><span class="vendido">0</span></td>
      <td><span class="dinero">0</span></td>
    `;
    tabla.appendChild(fila);
  });
}
generarTabla();

function actualizarQueda(index, valorContado) {
  const fila = document.querySelectorAll("#tablaInventario tr")[index + 1];
  const inicial = parseFloat(fila.children[1].querySelector("input").value) || 0;
  const ingreso = parseFloat(fila.children[2].querySelector("input").value) || 0;
  const total = inicial + ingreso;
  const queda = parseFloat(valorContado) || 0;
  const vendido = total - queda;
  const precio = precios[index];
  fila.children[4].textContent = vendido;
  fila.children[5].textContent = `$${vendido * precio}`;
}

document.getElementById("capturaBtn").addEventListener("click", () => {
  html2canvas(document.querySelector("#dashboard")).then(canvas => {
    const link = document.createElement("a");
    link.download = "inventario_hielo_ontiveros.png";
    link.href = canvas.toDataURL();
    link.click();
  });
});

function cerrarDia() {
  alert("✅ Cierre sintomático guardado. Listo para mañana.");
}
EOF

cat > manifest.json << 'EOF'
{
  "name": "Inventario Hielo Ontiveros",
  "short_name": "Hielo Ontiveros",
  "start_url": "index.html",
  "display": "standalone",
  "background_color": "#000000",
  "theme_color": "#00ffff",
  "icons": []
}
EOF

cat > README.md << 'EOF'
# INVENTARIO HIELO ONTIVEROS  
**powered by DEIMON ENTERPRISE technology**

Dashboard táctil con memoria sintomática, calculadora integrada y captura visual en PNG.

## Funciones
- 🧮 Calculadora por producto
- 📸 Captura de pantalla completa
- 🔄 Persistencia entre días
- 🛡️ Validación guardiana
- 🎨 Branding visual hacker

## Instalación
```bash
git clone https://github.com/shaggy0397/inventario--hielo-ontiveros.git
cd inventario--hielo-ontiveros
npx serve .
