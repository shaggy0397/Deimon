#!/bin/bash
clear
echo "🧠 Ritual maestro por todos los nichos"
echo "--------------------------------------"

base="/storage/emulated/0/1A/Appinven"
cd "$base"

# Detectar carpetas que contengan ebooks por nicho
for carpeta in */; do
  if [[ "$carpeta" == *"Desarrollo"* || "$carpeta" == *"Marketing"* || "$carpeta" == *"Finanzas"* || "$carpeta" == *"Productividad"* || "$carpeta" == *"Inteligencia"* ]]; then
    echo "🔍 Detectado nicho: $carpeta"
    cd "$carpeta"

    if [ -f "../generar_todo.sh" ]; then
      bash ../generar_todo.sh
    else
      echo "❌ Script generar_todo.sh no encontrado en ruta base"
    fi

    cd "$base"
    echo "--------------------------------------"
  fi
done

echo "✅ Ritual maestro completado por todos los nichos detectados"
