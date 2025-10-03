#!/bin/bash

URL="https://shaggy0397.github.io/deimon-interface"
qrencode -o deimon-qr.png "$URL"

echo "" >> README.md
echo "## 📱 Escanea para despertar el núcleo sintomático" >> README.md
echo "![DEIMON QR](deimon-qr.png)" >> README.md
