#!/bin/bash
clear
echo "🧠 Ritual maestro: blindaje total por nicho"

# Ruta base y submódulo
base="/storage/emulated/0/1A/Appinven"
sub="$base/autoebook-hotmart"
nicho="Desarrollo Personal"

# Función para validar y ejecutar desde base o submódulo
generar_si_falta() {
  archivo="$1"
  script="$2"
  nombre="$3"

  if [ ! -e "$base/$archivo" ] && [ ! -e "$sub/$archivo" ]; then
    echo "⚠️ Falta $nombre → buscando $script..."

    if [ -f "$base/$script" ]; then
      bash "$base/$script"
    elif [ -f "$sub/$script" ]; then
      bash "$sub/$script"
    else
      echo "❌ Script $script no encontrado en ninguna ruta"
    fi
  else
    echo "✅ $nombre ya existe"
  fi
}

# Validaciones por nicho
generar_si_falta "ebook.pdf" "generar_ebook.sh" "ebook PDF"
generar_si_falta "$nicho.zip" "empaquetar.sh" "ZIP por nicho"
generar_si_falta "token.txt" "obtener_token.sh" "Token OAuth2"
generar_si_falta "apk_$nicho" "generar_apk.sh" "APK"
generar_si_falta "validadores.sh" "validadores.sh" "Validadores sintomáticos"
generar_si_falta "webhook.php" "crear_webhook.sh" "Webhook táctil"

echo ""
echo "✅ Ritual completado. Entorno blindado y autosuficiente por nicho: $nicho"
