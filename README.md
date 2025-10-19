# 🎯 Keks Deathscreen - Erweiterte Lila Edition

> **Ein professionelles Death-Screen System für Garry's Mod mit Star Wars Theming und umfangreichen Features**

[![Version](https://img.shields.io/badge/Version-1.0-purple)](https://github.com/imperatorkeksi/keksi-deathscreen)
[![Garry's Mod](https://img.shields.io/badge/Garry's%20Mod-Compatible-blue)](https://store.steampowered.com/app/4000/Garrys_Mod/)
[![DarkRP](https://img.shields.io/badge/DarkRP-Integration-orange)](https://github.com/FPtje/DarkRP)
[![License](https://img.shields.io/badge/License-Free-green)](#lizenz)

---

## 📑 Inhaltsverzeichnis

- [Über das Projekt](#-über-das-projekt)
- [Features](#-features)
- [Datenstruktur](#-datenstruktur)
- [Verwendung](#-verwendung)
- [Konfiguration](#-konfiguration)
- [Über den Entwickler](#-über-den-entwickler)
- [Social Media](#-social-media)
- [Lizenz](#-lizenz)
- [Abschlusstext](#-abschlusstext)

---

## 🚀 Über das Projekt

**Keks Deathscreen - Erweiterte Lila Edition** ist ein hochmodernes Death-Screen System für Garry's Mod Server, das speziell für Roleplay-Umgebungen entwickelt wurde. Mit einem eleganten lila-blauen Design und Star Wars-Theming bietet es Spielern eine immersive Erfahrung beim Tod und Respawn-Prozess.

Das Add-on ersetzt das Standard-Death-System von Garry's Mod durch eine professionelle Oberfläche mit Fortschrittsbalken, verschiedenen Respawn-Optionen und vollständiger DarkRP-Integration. Es wurde besonders für Star Wars Roleplay-Server optimiert, funktioniert aber auf allen Garry's Mod Servern.

### 🎮 Hauptziele:
- **Immersive Roleplay-Erfahrung**: Star Wars-themierte Texte und Nachrichten
- **Flexibles Respawn-System**: Verschiedene Optionen für unterschiedliche Situationen
- **Server-Performance**: Optimiert für hohe Spielerzahlen
- **Einfache Integration**: Funktioniert out-of-the-box mit DarkRP

---

## ✨ Features

### 🔥 Kern-Features
- **📊 Visueller Fortschrittsbalken** mit Echtzeit-Anzeige und Farbverlauf
- **⏱️ Auto-Respawn System** (10 Minuten automatischer Respawn)
- **🚑 Normaler Respawn** (nach 2 Minuten verfügbar)
- **💰 Sofort-Aufgeben** mit DarkRP Geld-Abzug (1000 Credits)
- **🏥 Medizin-System Integration** für erweiterte Roleplay-Möglichkeiten
- **🎨 Elegantes Lila-Blau Design** mit professionellen UI-Elementen

### 🛡️ Technische Features
- **🔄 DarkRP Integration** mit automatischer Geld-Verwaltung
- **⚡ Performance-Optimierung** für bis zu 50 gleichzeitige Death Screens
- **🔒 Anti-Exploit Schutz** gegen Doppel-Klicks und Missbrauch
- **📱 Responsive Design** funktioniert auf allen Bildschirmgrößen
- **🎯 Smart Button-System** mit Hover-Effekten und visueller Rückmeldung

### 🌟 Star Wars Theming
- **🚀 Galaktische Begriffe**: "Force-Wiedergeburt", "Bacta-Tank Express", "Republic Medical Corps"
- **👥 Klon-Soldat Nachrichten** mit authentischem Star Wars Feeling
- **📜 Jedi-Kodex Integration** für New Life Rule Erklärungen
- **🎖️ Military-Style Interface** passend zum Star Wars Universum

### 🔧 Admin Features
- **🛠️ Vollständig konfigurierbar** über eingebaute Config-Dateien
- **📝 Test-Commands** für SuperAdmins (`keks_deathscreen_test`)
- **📊 Debug-System** mit ausführlichem Logging
- **🔄 Hot-Reload Support** für Konfigurationsänderungen

---

## 🗂️ Datenstruktur

### 📁 Ordnerstruktur
```
keksi-deathscreen/
├── 📄 addon.json                           # Add-on Metadaten
├── 📄 README.md                            # Diese Dokumentation
└── lua/
    └── autorun/
        └── 📜 keksdeathscreen_extended.lua # Hauptskript (Server + Client)
```

### 🔧 Skript-Komponenten

#### **Server-Side Funktionen:**
- **Spieler-Daten Verwaltung** mit Steam ID Tracking
- **DarkRP Geld-Integration** für Sofort-Respawn
- **Auto-Respawn Timer** mit Performance-Optimierung
- **Anti-Exploit Systeme** gegen Missbrauch
- **Netzwerk-Kommunikation** zwischen Server und Client

#### **Client-Side Funktionen:**
- **GUI Rendering** mit modernem Design
- **Button-System** mit Hover-Effekten und Animationen
- **Fortschrittsbalken** mit visuellen Markierungen
- **Maus-Integration** für interaktive Bedienung
- **Chat-Nachrichten** mit Farbcodes

#### **Shared Components:**
- **Konfigurationssystem** mit allen Einstellungen
- **Hilfsfunktionen** für Text-Rendering und Farben
- **Star Wars Texte** und Theming-Elemente

---

## 🎮 Verwendung

### 📥 Installation

1. **Download** das Add-on in deinen Garry's Mod Addons-Ordner:
   ```
   steamapps/common/GarrysMod/garrysmod/addons/keksi-deathscreen/
   ```

2. **Server-Neustart** oder `changelevel` ausführen

3. **Automatische Aktivierung** - Das Add-on lädt sich automatisch und ist sofort einsatzbereit

### 🕹️ Im Spiel verwenden

#### Beim Tod:
1. **Automatische Aktivierung** - Death Screen erscheint sofort beim Spieler-Tod
2. **Fortschrittsbalken** zeigt verbleibende Zeit bis Auto-Respawn an
3. **Button-Optionen** werden basierend auf verfügbarer Zeit angezeigt

#### Respawn-Optionen:
- **🟢 Normaler Respawn** (nach 2 Minuten):
  - Kostenlos und ohne Nachteile
  - Aktiviert sich automatisch nach 2 Minuten
  
- **🟠 Bacta-Tank Express** (sofort, 1000 Credits):
  - Sofortiger Respawn gegen DarkRP Geld
  - Nur einmal pro Tod verwendbar
  
- **🔴 Auto-Respawn** (nach 10 Minuten):
  - Automatischer Respawn ohne Aktion erforderlich
  - Sicherheitsnetz falls keine andere Option gewählt wird

### 🎯 Bedienung
- **Mauszeiger** wird automatisch aktiviert bei Tod
- **Linksklick** auf gewünschten Button
- **ESC oder andere Tasten** sind während Death Screen blockiert

### 👨‍💻 Admin-Commands

```bash
# Death Screen testen (nur SuperAdmin)
keks_deathscreen_test

# Death Screen force stoppen (nur SuperAdmin)  
keks_deathscreen_stop
```

---

## ⚙️ Konfiguration

### 🎛️ Haupt-Einstellungen

Das Add-on kann durch Bearbeitung der `keksdeathscreen_extended.lua` angepasst werden:

```lua
-- Timer Einstellungen
keksdeathscreen.ExtendedConfig.Timers = {
    auto_respawn_time = 600,        -- 10 Minuten (600 Sekunden)
    normal_respawn_time = 120,      -- 2 Minuten (120 Sekunden)  
    instant_giveup_cost = 1000,     -- Kosten für Sofort-Respawn
    min_giveup_time = 0             -- Sofort verfügbar
}
```

### 🎨 Design-Anpassungen

```lua
-- Farbschema (RGB + Alpha)
keksdeathscreen.ExtendedConfig.Colors = {
    MainTitle = Color(150, 100, 255, 255),        -- Lila
    SubTitle = Color(200, 220, 255, 255),         -- Helles Lila-Blau
    Background = Color(20, 10, 40, 220),          -- Dunkles Lila
    -- ... weitere Farben
}
```

### 📝 Text-Anpassungen

```lua
-- Button Texte (Star Wars themed)
keksdeathscreen.ExtendedConfig.Texts = {
    normal_respawn_button = "Zur Galaktischen Republik",
    instant_giveup_button = "Bacta-Tank Express (1000 Credits)",
    medic_system_button = "Medizin-Droiden rufen",
    -- ... weitere Texte
}
```

### 🔧 System-Einstellungen

```lua
-- Funktionen aktivieren/deaktivieren
keksdeathscreen.ExtendedConfig.System = {
    EnableNormalRespawn = true,     -- Normaler Respawn aktiviert
    EnableInstantGiveup = true,     -- Sofort-Aufgeben aktiviert
    EnableAutoRespawn = true,       -- Auto-Respawn aktiviert
    UseDarkRPMoney = true,          -- DarkRP Integration aktiviert
    -- ... weitere Einstellungen
}
```

### 💰 DarkRP Integration

Das Add-on unterstützt automatisch:
- **DarkRP Geld-System** (`ply:getDarkRPVar("money")`)
- **Standard Geld-Funktionen** (`ply:addMoney()`)
- **Automatische Erkennung** des verwendeten Systems

---

## 👨‍💻 Über den Entwickler

**Imperator Keksi** (auch bekannt als Nico, Milky, Brownie, Cookie oder Keksi) ist ein leidenschaftlicher Gamer und Roleplayer, der sich besonders für **Star Wars RP** und technische Projekte in Garry's Mod begeistert.

### 🌟 Entwickler-Profil:
- **🎮 Passion**: Star Wars Roleplay und Garry's Mod Development
- **📈 Status**: Anfänger mit sichtbaren Fortschritten in der Addon-Entwicklung
- **🤝 Charakter**: Ruhig, hilfsbereit und immer offen für Feedback
- **💡 Motivation**: Stetige Weiterentwicklung und Lernen neuer Techniken

### 🔄 Entwicklungsreise:
Imperator Keksi befindet sich noch am Anfang seiner Addon-Entwicklungsreise, macht aber **beeindruckende Fortschritte** und lernt kontinuierlich dazu. Seine Projekte zeigen bereits eine **hohe Qualität** und **Liebe zum Detail**.

### 💬 Feedback willkommen:
Er freut sich über **jede Art von Feedback**, Verbesserungsvorschläge oder neue Ideen. Die Community kann ihn jederzeit kontaktieren - er ist **immer bereit zu helfen** und **neue Konzepte zu diskutieren**.

> *"Gemeinsam können wir die besten Add-ons für die Garry's Mod Community erschaffen!"*

---

## 📱 Social Media

### 🔗 Offizielle Profile von Imperator Keksi:

**🌐 Hauptprofil:**
- **Website**: [guns.lol/imperatorkeksi](https://guns.lol/imperatorkeksi)

### 📞 Kontakt & Support:
Für **Fragen**, **Feedback** oder **Kollaborationen** kannst du Imperator Keksi über seine offiziellen Kanäle erreichen. Er ist immer interessiert an:

- 💡 **Neuen Ideen** für Add-on Features
- 🐛 **Bug Reports** und Verbesserungsvorschläge  
- 🤝 **Community Feedback** und Erfahrungen
- 🚀 **Kollaborationsmöglichkeiten** mit anderen Entwicklern

---

## 📄 Lizenz

### ✅ **ERLAUBT:**
- ✅ **Verwendung auf privaten und öffentlichen Servern**
- ✅ **Kopieren und Weiterverbreitung des Add-ons**
- ✅ **Modifikation und Anpassung an eigene Bedürfnisse**
- ✅ **Integration in Server-Packs oder Collections**

### ❌ **NICHT ERLAUBT:**
- ❌ **Verkauf oder kommerzielle Nutzung des Add-ons**
- ❌ **Weiterverkauf in jeglicher Form**
- ❌ **Ausgeben als eigene Entwicklung**
- ❌ **Entfernen der Urheberrechtshinweise**

### ℹ️ **WICHTIGE BEDINGUNGEN:**
- **🏷️ Urheberschaft**: **Imperator Keksi** muss in jeder Veröffentlichung als **originaler Entwickler** genannt werden
- **📝 Attribution**: Bei Modifikationen muss die Quelle und der originale Autor erwähnt werden
- **🆓 Kostenlos**: Das Add-on ist und bleibt **komplett kostenlos** für die Community

### 📋 **Lizenz-Zusammenfassung:**
```
Keks Deathscreen - Erweiterte Lila Edition v1.0
Copyright (c) 2025 Imperator Keksi

Dieses Add-on ist kostenlose Software für die Garry's Mod Community.
Verwendung, Modifikation und Weitergabe unter Nennung des Originalautors gestattet.
Kommerzielle Nutzung oder Verkauf ist strengstens untersagt.
```

---

## 🎉 Abschlusstext

**Danke fürs Nutzen des Add-ons!** 

Wenn dir das **Keks Deathscreen - Erweiterte Lila Edition** gefällt, unterstütze die Arbeit von **Imperator Keksi** durch:

- ⭐ **Einen Stern auf GitHub** (falls verfügbar)
- 💬 **Positives Feedback** in der Community
- 🐛 **Bug Reports** für kontinuierliche Verbesserungen
- 💡 **Feature-Vorschläge** für zukünftige Updates
- 🤝 **Weiterempfehlungen** an andere Server-Owner

### 🚀 **Zukunftspläne:**
- 🔄 **Regelmäßige Updates** mit neuen Features basierend auf Community-Feedback
- 🎨 **Zusätzliche Themes** und Design-Varianten  
- 🔧 **Erweiterte Konfigurationsmöglichkeiten** für Server-Admins
- 🌐 **Multi-Language Support** für internationale Server
- 📱 **Mobile-optimierte Interfaces** für verschiedene Bildschirmgrößen

---

**Version 1.0** – Erstellt mit **💜 Leidenschaft** für die **Garry's Mod Community**

*Ein Projekt von **Imperator Keksi** - Für die Gemeinschaft, mit der Gemeinschaft*

---

[![Made with Love](https://img.shields.io/badge/Made%20with-❤️-red)](https://guns.lol/imperatorkeksi)
[![Garry's Mod](https://img.shields.io/badge/Built%20for-Garry's%20Mod-blue)](https://store.steampowered.com/app/4000/Garrys_Mod/)
[![Community](https://img.shields.io/badge/Community-Driven-green)](https://github.com/imperatorkeksi)

> *"Möge die Macht mit deinem Server sein!"* ✨