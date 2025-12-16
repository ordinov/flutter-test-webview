#!/bin/bash

# Setup script per macOS
# Scarica Flutter SDK e configura il progetto

set -e

echo "=== WebView App - Setup macOS ==="
echo ""

# Rileva architettura
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.24.5-stable.zip"
    echo "Rilevato: Apple Silicon (M1/M2/M3)"
else
    FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_x64_3.24.5-stable.zip"
    echo "Rilevato: Intel Mac"
fi

# Rimuovi SDK esistente se presente
if [ -d "flutter" ]; then
    echo ""
    echo "Rimuovo Flutter SDK esistente..."
    rm -rf flutter
fi

# Scarica Flutter
echo ""
echo "Scaricando Flutter SDK..."
curl -LO "$FLUTTER_URL"

# Estrai
echo ""
echo "Estraendo Flutter SDK..."
unzip -q flutter_macos_*.zip
rm flutter_macos_*.zip

# Installa dipendenze
echo ""
echo "Installando dipendenze..."
./flutter/bin/flutter pub get

# Verifica
echo ""
echo "=== Setup completato ==="
echo ""
echo "Verifica installazione con:"
echo "  ./flutter/bin/flutter doctor"
echo ""
echo "Esegui l'app con:"
echo "  ./flutter/bin/flutter run"
echo ""
