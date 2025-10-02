#!/usr/bin/env bash
set -euo pipefail

# Configuración
REPO_URL="git@github.com:shaggy0397/digitalmind-os.git"
REPO_DIR="$HOME/digitalmind"
EMAIL="${GIT_AUTHOR_EMAIL:-tu_email@ejemplo.com}"

info()  { echo -e "\033[1;36m[INFO]\033[0m $*"; }
ok()    { echo -e "\033[1;32m[OK]\033[0m $*"; }
warn()  { echo -e "\033[1;33m[WARN]\033[0m $*"; }
error() { echo -e "\033[1;31m[ERROR]\033[0m $*"; exit 1; }

# Paso 1: Validar dependencias
info "Validando paquetes necesarios..."
for pkg in git openssh nodejs jq; do
  command -v $pkg >/dev/null || pkg install -y $pkg
done
ok "Todos los paquetes están instalados."

# Paso 2: Configurar identidad Git
git config --global user.name "Mario"
git config --global user.email "$EMAIL"
ok "Identidad Git configurada."

# Paso 3: Generar clave SSH si no existe
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  info "Generando clave SSH..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""
  ok "Clave SSH generada."
else
  ok "Clave SSH ya existe."
fi

# Paso 4: Activar agente y añadir clave
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"
ok "Agente SSH activo y clave añadida."

# Paso 5: Mostrar clave pública
info "Copia esta clave y agrégala en GitHub → Settings → SSH and GPG keys → New SSH key"
echo -e "\n\033[1;35m$(cat ~/.ssh/id_ed25519.pub)\033[0m\n"
read -rp "Presiona Enter cuando la hayas agregado en GitHub..."

# Paso 6: Configurar archivo ~/.ssh/config
cat > "$HOME/.ssh/config" <<EOF
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
EOF
chmod 600 "$HOME/.ssh/config"
ok "Archivo SSH config listo."

# Paso 7: Manejar carpeta existente
if [ -d "$REPO_DIR" ]; then
  warn "La carpeta $REPO_DIR ya existe."
  echo "¿Qué deseas hacer?"
  echo "  [1] Borrar y clonar de nuevo"
  echo "  [2] Usar la carpeta existente"
  echo "  [3] Clonar en otra carpeta"
  read -rp "Elige una opción [1/2/3]: " OPCION

  case "$OPCION" in
    1)
      rm -rf "$REPO_DIR"
      git clone "$REPO_URL" "$REPO_DIR"
      ok "Repositorio clonado en $REPO_DIR"
      ;;
    2)
      cd "$REPO_DIR"
      git remote set-url origin "$REPO_URL"
      git pull origin main
      ok "Repositorio actualizado en $REPO_DIR"
      ;;
    3)
      read -rp "Ruta alternativa (ej. ~/digitalmind-pwa): " ALT_DIR
      git clone "$REPO_URL" "$ALT_DIR"
      REPO_DIR="$ALT_DIR"
      ok "Repositorio clonado en $REPO_DIR"
      ;;
    *)
      error "Opción inválida. Abortando."
      ;;
  esac
else
  git clone "$REPO_URL" "$REPO_DIR"
  ok "Repositorio clonado en $REPO_DIR"
fi

# Paso 8: Validar conexión SSH
info "Probando conexión con GitHub..."
ssh -T git@github.com || warn "Conexión SSH falló. Revisa la clave en GitHub."

# Paso 9: Validar proyecto PWA
cd "$REPO_DIR/tienda-assistant-pwa"
bash scripts/validate.sh
ok "Validación del proyecto completada."

# Paso 10: Construir y lanzar servidor local
bash scripts/build.sh
bash scripts/launch.sh &
sleep 2
ok "Servidor local activo en http://localhost:8080"

# Paso 11: Instrucciones finales
echo -e "\n\033[1;36m[FINAL]\033[0m Abre Chrome o Edge en tu teléfono y visita:"
echo -e "\033[1;32mhttp://localhost:8080\033[0m"
echo "Luego toca ⋮ → 'Agregar a pantalla de inicio' → Instalar"
echo "Tu PWA estará lista para usarse offline con reconocimiento de voz."
