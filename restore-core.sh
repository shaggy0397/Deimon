#!/data/data/com.termux/files/usr/bin/bash

clear

# Arte ASCII de inicio
cat <<EOF
╔════════════════════════════════════════════════════╗
║ 🔧 RESTAURADOR DIGITALMIND OS — CORE MODULES      ║
╠════════════════════════════════════════════════════╣
║ Reconstruyendo estructura base y módulos clave... ║
╚════════════════════════════════════════════════════╝
EOF
echo ""

# Crear carpetas
mkdir -p ~/digitalmind/modules ~/digitalmind/scripts

# launcher.sh
cat <<'EOF' > ~/digitalmind/launcher.sh
#!/data/data/com.termux/files/usr/bin/bash
clear
cat <<EOM
╔════════════════════════════════════════════════════╗
║ 🧠 DIGITALMIND OS — LAUNCHER VISUAL               ║
╠════════════════════════════════════════════════════╣
║ Selecciona una opción para iniciar tu sesión      ║
╚════════════════════════════════════════════════════╝
EOM
echo ""
echo "1️⃣  Ejecutar módulo de bienvenida"
echo "2️⃣  Validar estructura del sistema"
echo "3️⃣  Desinstalar DigitalMind OS"
echo "4️⃣  Salir"
echo ""
read -p "👉 Elige una opción [1-4]: " opcion
case $opcion in
  1) bash modules/welcome.sh ;;
  2) bash scripts/validator.sh ;;
  3) bash uninstall.sh ;;
  4) echo "👋 Cerrando DigitalMind OS..."; exit 0 ;;
  *) echo "❌ Opción inválida. Intenta de nuevo." ;;
esac
EOF

# welcome.sh
cat <<'EOF' > ~/digitalmind/modules/welcome.sh
#!/data/data/com.termux/files/usr/bin/bash
clear
cat <<EOM
╔════════════════════════════════════════════════════╗
║ 👋 BIENVENIDO A DIGITALMIND OS                    ║
╠════════════════════════════════════════════════════╣
║ Tu copiloto modular está listo para despegar      ║
╚════════════════════════════════════════════════════╝
EOM
echo ""
echo "📱 Entorno detectado: Termux en Android"
echo "📂 Carpeta actual: $(pwd)"
echo "🕹 Usuario: $USER"
echo ""
cat <<EOM
🧠 Este sistema fue diseñado para:
- Modularidad visual repo-ready
- Automatización blindada
- Experiencia hacker pedagógica

🚀 Usa el launcher para explorar módulos, validar estructura
   o preparar el Genesis Push hacia GitHub.
EOM
EOF

# validator.sh
cat <<'EOF' > ~/digitalmind/scripts/validator.sh
#!/data/data/com.termux/files/usr/bin/bash
clear
cat <<EOM
╔════════════════════════════════════════════════════╗
║ 🛡 DIGITALMIND OS — VALIDADOR DE ESTRUCTURA       ║
╠════════════════════════════════════════════════════╣
║ Revisando carpetas, archivos y permisos clave...  ║
╚════════════════════════════════════════════════════╝
EOM
echo ""
[[ ! -f launcher.sh ]] && echo "❌ Falta launcher.sh" || echo "✅ launcher.sh presente"
[[ ! -f digitalmind-live.sh ]] && echo "❌ Falta digitalmind-live.sh" || echo "✅ digitalmind-live.sh presente"
[[ ! -f README.md ]] && echo "❌ Falta README.md" || echo "✅ README.md presente"
[[ ! -f uninstall.sh ]] && echo "❌ Falta uninstall.sh" || echo "✅ uninstall.sh presente"
[[ ! -d modules ]] && echo "❌ Falta carpeta modules/" || echo "✅ modules/ presente"
[[ ! -d scripts ]] && echo "❌ Falta carpeta scripts/" || echo "✅ scripts/ presente"
[[ ! -x launcher.sh ]] && echo "🔧 Asignando permisos a launcher.sh..." && chmod +x launcher.sh
[[ ! -x digitalmind-live.sh ]] && echo "🔧 Asignando permisos a digitalmind-live.sh..." && chmod +x digitalmind-live.sh
echo ""
cat <<EOM
╔════════════════════════════════════════════════════╗
║ ✅ Validación completa                            ║
║ Si no hubo errores arriba, puedes lanzar el OS    ║
║ o hacer push al repositorio                       ║
╚════════════════════════════════════════════════════╝
EOM
EOF

# uninstall.sh
cat <<'EOF' > ~/digitalmind/uninstall.sh
#!/data/data/com.termux/files/usr/bin/bash
clear
cat <<EOM
╔════════════════════════════════════════════════════╗
║ ⚠️ DESINSTALADOR DIGITALMIND OS                   ║
╠════════════════════════════════════════════════════╣
║ Esta acción eliminará la suite completa del sistema║
╚════════════════════════════════════════════════════╝
EOM
echo ""
read -p "❓ ¿Estás seguro de que deseas continuar? [s/N]: " confirmacion
if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
  echo ""
  echo "🧹 Eliminando carpeta ~/digitalmind..."
  rm -rf ~/digitalmind
  echo "✅ DigitalMind OS ha sido desinstalado correctamente."
else
  echo "🚫 Operación cancelada. DigitalMind OS sigue activo."
fi
EOF

# README.md
cat <<'EOF' > ~/digitalmind/README.md
╔════════════════════════════════════════════════════╗
║ 🧠 DIGITALMIND OS — COPILOTO MODULAR HACKER       ║
╠════════════════════════════════════════════════════╣
║ Termux · Android · Modular · Visual · Repo-ready  ║
╚════════════════════════════════════════════════════╝

DigitalMind OS es una suite visual y modular diseñada para arquitectos móviles que buscan precisión, automatización y estilo hacker.

## 🚀 Instalación rápida
git clone https://github.com/shaggy0397/Digitalmind--os.git ~/digitalmind
bash ~/digitalmind/digitalmind-live.sh

## 🧠 ¿Qué incluye?
- launcher.sh → Menú visual multipantalla
- digitalmind-live.sh → Copiloto modular
- modules/ → Módulos activos
- scripts/ → Scripts guardianes
- uninstall.sh → Desinstalación reversible

## 🛡 Filosofía DEIMON
- Modularidad visual
- Automatización blindada
- Validación antes de ejecución
- Arte ASCII como lenguaje
- Onboarding pedagógico y memorable
EOF

# Asignar permisos
chmod +x ~/digitalmind/*.sh
chmod +x ~/digitalmind/modules/*.sh
chmod +x ~/digitalmind/scripts/*.sh

echo ""
echo "✅ Estructura restaurada. Puedes lanzar con:"
echo "bash ~/digitalmind/launcher.sh"
