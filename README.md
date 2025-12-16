# WebView App

App Flutter con WebView. Progetto compatibile con Windows 11 e macOS.

---

## Configurazione URL

Modifica l'URL in `lib/main.dart` (linea 7):

```dart
const String webUrl = 'https://tuo-sito.com';
```

---

## Setup iniziale

### Windows 11

Il Flutter SDK per Windows è già incluso nella cartella `flutter\`.

```powershell
# Verifica installazione
.\flutter\bin\flutter doctor
```

### macOS

Esegui lo script di setup automatico (rileva automaticamente Intel/Apple Silicon):

```bash
chmod +x setup_macos.sh
./setup_macos.sh
```

Oppure manualmente:

```bash
# Rimuovi SDK Windows (se presente) e scarica quello macOS
rm -rf flutter

# Per Apple Silicon (M1/M2/M3)
curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.24.5-stable.zip

# Per Intel Mac (usa questo invece del precedente)
# curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_x64_3.24.5-stable.zip

unzip flutter_macos_*.zip
rm flutter_macos_*.zip

# Installa dipendenze
./flutter/bin/flutter pub get
```

---

## Eseguire l'app

### Windows 11

```powershell
# Lista dispositivi disponibili
.\flutter\bin\flutter devices

# Avvia emulatore Android (se installato)
.\flutter\bin\flutter emulators --launch <nome_emulatore>

# Pulisci la cache se necessario
Remove-Item -Recurse -Force "$env:USERPROFILE\.gradle\caches" -ErrorAction SilentlyContinue
.\flutter\bin\flutter clean

# Esegui app
.\flutter\bin\flutter run
```

### macOS

```bash
# Lista dispositivi disponibili
./flutter/bin/flutter devices

# Avvia simulatore iOS
open -a Simulator

# Pulisci la cache se necessario
rm -rf ~/.gradle/caches ~/Library/Caches/CocoaPods ~/Library/Developer/Xcode/DerivedData
pod cache clean --all
./flutter/bin/flutter clean

# Esegui app
./flutter/bin/flutter run
```

---

## Requisiti

### Windows 11
- Android Studio (per emulatore Android)
- Oppure dispositivo Android fisico connesso via USB

### macOS
- Xcode (per simulatore iOS e build iOS)
- Android Studio (opzionale, per emulatore Android)
- Oppure dispositivo fisico connesso

---

## Comandi utili

| Azione | Windows | macOS |
|--------|---------|-------|
| Lista dispositivi | `.\flutter\bin\flutter devices` | `./flutter/bin/flutter devices` |
| Esegui app | `.\flutter\bin\flutter run` | `./flutter/bin/flutter run` |
| Esegui su dispositivo | `.\flutter\bin\flutter run -d <id>` | `./flutter/bin/flutter run -d <id>` |
| Build APK | `.\flutter\bin\flutter build apk` | `./flutter/bin/flutter build apk` |
| Build iOS | N/A | `./flutter/bin/flutter build ios` |
| Diagnostica | `.\flutter\bin\flutter doctor` | `./flutter/bin/flutter doctor` |

### Durante l'esecuzione
| Tasto | Azione |
|-------|--------|
| `r` | Hot reload (aggiorna UI) |
| `R` | Hot restart (riavvia app) |
| `q` | Esci |

---

## Struttura progetto

```
fluttertest/
├── flutter/           ← Flutter SDK (platform-specific)
├── lib/
│   └── main.dart      ← Codice app (URL configurabile qui)
├── android/           ← Configurazione Android
├── ios/               ← Configurazione iOS
├── macos/             ← Configurazione macOS desktop
├── windows/           ← Configurazione Windows desktop
├── web/               ← Configurazione Web
├── pubspec.yaml       ← Dipendenze
└── setup_macos.sh     ← Script setup per macOS
```

---

## Troubleshooting

### "Flutter not found"
Assicurati di usare il percorso corretto:
- Windows: `.\flutter\bin\flutter`
- macOS: `./flutter/bin/flutter`

### Emulatore non trovato
1. Installa Android Studio
2. Apri Android Studio > Device Manager > Create Device
3. Avvia l'emulatore creato

### iOS Simulator non funziona (macOS)
```bash
# Installa Xcode command line tools
xcode-select --install

# Accetta licenza Xcode
sudo xcodebuild -license accept
```
