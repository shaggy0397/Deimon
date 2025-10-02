#!/bin/bash

echo "🔒 Validando SH4C3Y digital mind..."

# Validación sintomática
./verificar-estilo.sh
./verificar-branding.sh

# Git add + commit
git add .
git commit -m "🔒 Publicación repo-ready de SH4C3Y digital mind"

# Push a GitHub
git push origin main

echo "✅ Publicado en GitHub Pages"
echo "🌐 https://shaggy0397.github.io/shaggy-digital-mind/"
