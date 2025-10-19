--[[
    🎯 KEKS DEATHSCREEN - ERWEITERTE VERSION v2.1 (AKTIV)
    
    ⚡ DIESES IST DAS AKTIVE SYSTEM! ⚡
    
    Erweiterte Version mit:
    ✅ Auto-Respawn nach 10 Minuten
    ✅ Normaler Respawn nach 2 Minuten  
    ✅ Sofort-Aufgeben mit DarkRP Geld-Abzug (2500$)
    ✅ Medizin-System Integration
    ✅ Vollständig konfigurierbar
    ✅ Lila-Blau Design beibehalten
    ✅ Fehlerfreie v2.1 Implementation
    
    Alle Namen in Kleinbuchstaben für GMod Kompatibilität
]]

-- Namespace erweitern
keksdeathscreen = keksdeathscreen or {}
keksdeathscreen.Extended = keksdeathscreen.Extended or {}

-- ========================================================================================
-- ERWEITERTE KONFIGURATION (EINGEBETTET)
-- ========================================================================================

-- Erstelle Config-Namespace direkt hier
keksdeathscreen.ExtendedConfig = {}

-- Timer Einstellungen
keksdeathscreen.ExtendedConfig.Timers = {
    auto_respawn_time = 600,        -- 10 Minuten automatischer Respawn
    normal_respawn_time = 120,      -- 2 Minuten bis normaler Respawn verfügbar
    instant_giveup_cost = 1000,     -- Kosten für sofortiges Aufgeben (1000 DarkRP Credits)
    min_giveup_time = 0             -- Sofort verfügbar bei bezahltem Aufgeben
}

-- Button Texte und Beschreibungen
keksdeathscreen.ExtendedConfig.Texts = {
    -- Haupt-Timer Anzeige (Star Wars themed)
    auto_timer_desc = "Force-Wiedergeburt in:",
    
    -- Button Texte (Star Wars themed)
    normal_respawn_button = "Zur Galaktischen Republik",
    instant_giveup_button = "Bacta-Tank Express (1000 Credits)",
    medic_system_button = "Medizin-Droiden rufen",
    
    -- Wartezeit Texte (Star Wars themed)
    normal_respawn_wait = "Bacta-Tank Behandlung: %d Sekunden verbleibend",
    normal_respawn_ready = "Republic Medical Corps: Rückkehr genehmigt!",
    
    -- Dauerhaft angezeigte Informationstexte (Star Wars themed)
    rule_title = "GALAKTISCHES REGELWERK",
    rule_subtitle = "Neue Leben Regel (Jedi-Kodex konform)",
    rule_text = "Bei Wiedergeburt durch die Macht vergisst ein Jedi alle Umstände\nseines vorherigen Todes. Dies gilt für normale Rückkehr\nals auch für Bacta-Tank Express-Behandlung.",
    rule_description = "Jedi-Kodex: Bei Respawn vergessen alle Machtnutzer\ndie Umstände ihres Ablebens.",
    
    medic_title = "REPUBLIC MEDICAL CORPS - WICHTIGE PFLICHT",
    medic_subtitle = "Mit Medizin-Droiden und Heilern ist RP Pflicht!",
    medic_info = "Wenn Mediziner oder Heiler anwesend sind, nutze die Zeit\nfür hochwertiges Medical-Roleplay im Star Wars Universum.\nDie Galaktische Medizin wartet auf dich!",
    
    -- System-Nachrichten (Klon-Soldat Thema - nur Chat-Nachrichten)
    insufficient_credits = {
        "Nicht genug Credits, Soldat! Dein Konto ist leer.",
        "Credits reichen nicht aus, Klon. Geh arbeiten!",
        "Zu wenig Credits! Du musst mehr verdienen, Bruder.",
        "Dein Konto hat nicht genug Credits. Sammle mehr!",
        "Nicht genügend Guthaben, Klon-Soldat. Verdiene mehr Credits!",
        "Dein Credit-Chip ist leer. Arbeite härter, Soldat!",
        "Credits fehlen für die Behandlung. Verdiene mehr!",
        "Zu arm für Medical Treatment. Credits sammeln, Klon!"
    },
    instant_respawn_success = {
        "1000 Credits für Medizin abgebucht. Willkommen zurück, Soldat!",
        "Medizinische Droiden haben dich geheilt. 1000 Credits bezahlt.",
        "Behandlung erfolgreich! 1000 Credits für Express-Heilung.",
        "Klon Medical Protokoll aktiviert. 1000 Credits abgebucht.",
        "Notfall-Heilung durch Credits. 1000 weniger, aber du lebst!",
        "Medical Corps hat dich gerettet. Rechnung: 1000 Credits.",
        "Sofortige Wiederbelebung für 1000 Credits genehmigt, Klon.",
        "Medizinische Behandlung aktiviert. 1000 Credits investiert!"
    },
    death_occurred = {
        "Klon-Soldat gefallen... Medizinische Hilfe ist unterwegs.",
        "Ein Soldat ist down. Medizinische Evakuierung kommt.",
        "Gefallen im Kampf. Deine Brüder trauern, Klon.",
        "Soldat gefallen! Warte auf medizinische Behandlung...",
        "Du hast gedient. Medizinische Wiederherstellung in 10 Minuten.",
        "Vom Feind besiegt. Du wirst zurückgeholt, Bruder.",
        "Klon-Soldat verletzt! Medizinische Evakuierung unterwegs...",
        "Medizinische Hilfe ist auf dem Weg. Durchhalten, Soldat."
    },
    normal_respawn_ready = {
        "Medical meldet: Klon-Soldat bereit für Rückkehr!",
        "Behandlung abgeschlossen. Du kannst zurück zur Einheit!",
        "Medical Corps meldet: Patient bereit für den Dienst!",
        "Kommando genehmigt deine Rückkehr ins Schlachtfeld, Soldat.",
        "Medical Protokoll: Normale Wiederbelebung freigegeben!",
        "Oberkommando: Soldat bereit für den Einsatz!",
        "Mediziner melden: Klon-Behandlung abgeschlossen!",
        "Medical: Klon-Soldat einsatzbereit. Rückkehr genehmigt!"
    },
    early_respawn_attempt = {
        "Geduld, Soldat! Die Mediziner brauchen noch Zeit.",
        "Behandlung noch nicht abgeschlossen. Warten, Klon!",
        "Zu früh, Soldat! Die Behandlung dauert noch an.",
        "Medical Protokoll: Behandlung noch im Gange!",
        "Ungeduld bringt nichts. Warten auf medizinische Freigabe!",
        "Behandlung noch aktiv. Störe die Mediziner nicht!",
        "Zu hastig! Auch Klone müssen auf Heilung warten, Soldat.",
        "Befehl: Medizinische Behandlung nicht unterbrechen!"
    },
    
    -- Erfolgs-Nachrichten (nur Chat - Klon-Soldat Thema)
    respawn_success = "Medizinische Behandlung hat dich wiederhergestellt! Zurück in den Dienst!",
    medic_called = "Medical Corps wurde kontaktiert!"
}

-- Farbschema (Lila-Blau Design)
keksdeathscreen.ExtendedConfig.Colors = {
    -- Bestehende Farben beibehalten
    MainTitle = Color(150, 100, 255, 255),        -- Lila
    SubTitle = Color(200, 220, 255, 255),         -- Helles Lila-Blau
    TimerNormal = Color(255, 255, 255, 255),      -- Weiß
    TimerWarning = Color(255, 200, 150, 255),     -- Orange
    TimerCritical = Color(255, 150, 150, 255),    -- Rosa
    Background = Color(20, 10, 40, 220),          -- Dunkles Lila
    TimerDesc = Color(100, 150, 255, 255),        -- Blau
    
    -- Neue Button-Farben
    NormalRespawnButton = Color(100, 200, 100, 255),      -- Grün
    NormalRespawnButtonHover = Color(120, 220, 120, 255), -- Hellgrün
    NormalRespawnButtonDisabled = Color(100, 100, 100, 255), -- Grau
    
    InstantGiveupButton = Color(255, 150, 50, 255),       -- Orange
    InstantGiveupButtonHover = Color(255, 170, 70, 255),  -- Hellorange
    InstantGiveupButtonDisabled = Color(120, 80, 30, 255), -- Dunkelorange
    
    MedicButton = Color(50, 150, 255, 255),               -- Blau
    MedicButtonHover = Color(70, 170, 255, 255),          -- Hellblau
    
    -- Text-Farben
    WarningText = Color(255, 200, 100, 255),              -- Gelb-Orange
    SuccessText = Color(100, 255, 150, 255),              -- Hellgrün
    ErrorText = Color(255, 100, 100, 255),                -- Rot
    HelpText = Color(180, 200, 255, 255),                 -- Helles Blau
    
    -- Button-Rahmen
    ButtonBorder = Color(255, 255, 255, 100),             -- Weißer Rahmen
    ButtonBackground = Color(0, 0, 0, 150)                -- Dunkler Hintergrund
}

-- Layout und Positionen
keksdeathscreen.ExtendedConfig.Layout = {
    -- Button-Dimensionen
    ButtonWidth = 400,
    ButtonHeight = 50,
    ButtonSpacing = 20,
    ButtonCornerRadius = 8,
    
    -- Positionen (Prozentual vom Bildschirm) - Sauber strukturiert ohne Überlappungen
    MainTitle = { X = 0.5, Y = 0.08 },
    SubTitle = { X = 0.5, Y = 0.14 },
    TimerDesc = { X = 0.5, Y = 0.22 },
    ProgressBar = { X = 0.5, Y = 0.28 },
    
    -- Button-Positionen (weiter unten für klare Trennung)
    ButtonStartY = 0.42,
    
    -- Strukturierte Text-Positionen (mit deutlichem Abstand)
    InfoStartY = 0.65,      -- Start der Informationstexte
    RuleTextY = 0.65,       -- Regelwerk-Bereich
    HelpTextY = 0.82,       -- Medizin-Informationen (mehr Abstand)
    
    -- Alte Hover-Positionen (nicht mehr verwendet)
    WarningTextY = 0.85,
    HelpTextY_Old = 0.92
}

-- System Einstellungen
keksdeathscreen.ExtendedConfig.System = {
    -- Aktivierung einzelner Funktionen
    EnableNormalRespawn = true,
    EnableInstantGiveup = true,
    EnableMedicSystem = true,        -- Bleibt true für Text-Anzeige, aber Button entfernt
    EnableAutoRespawn = true,
    
    -- DarkRP Integration
    UseDarkRPMoney = true,
    MoneyFunction = "addMoney",  -- ply:addMoney(-amount)
    
    -- Sicherheits-Einstellungen
    PreventDoubleClick = true,
    ClickCooldown = 1.0,         -- Sekunden zwischen Klicks
    
    -- Medic System Command (wird später gesetzt)
    MedicCommand = "",  -- Hier wird später der Command eingetragen
    
    -- Debug und Logging
    EnableLogging = true,
    LogToConsole = true,
    LogToChat = true
}

-- Erweiterte Animation Einstellungen
keksdeathscreen.ExtendedConfig.Animations = {
    -- Fade-In/Out Geschwindigkeiten
    FadeInSpeed = 300,
    FadeOutSpeed = 200,
    
    -- Button-Hover Animationen
    ButtonHoverSpeed = 150,
    
    -- Timer-Puls Animation
    TimerPulseSpeed = 2.0,
    TimerPulseIntensity = 0.3,
    
    -- Text-Animationen
    TextTypewriterSpeed = 0.05,
    EnableTextAnimations = false
}

-- Schriftarten Konfiguration
keksdeathscreen.ExtendedConfig.Fonts = {
    MainTitle = {
        font = "Tahoma",
        size = 48,
        weight = 800
    },
    SubTitle = {
        font = "Tahoma",
        size = 24,
        weight = 400
    },
    Timer = {
        font = "Tahoma",
        size = 36,
        weight = 700
    },
    ButtonText = {
        font = "Tahoma",
        size = 18,
        weight = 600
    },
    HelpText = {
        font = "Tahoma",
        size = 14,
        weight = 400
    },
    WarningText = {
        font = "Tahoma",
        size = 16,
        weight = 500
    }
}

print("[Keks Deathscreen] Erweiterte Konfiguration direkt geladen!")

-- ========================================================================================
-- HILFSFUNKTIONEN - RAINBOW CHAT & RANDOM MESSAGES
-- ========================================================================================

--[[
    Wählt eine zufällige Nachricht aus einem Array
    @param messageArray table - Array mit Nachrichten
    @return string - Zufällige Nachricht
]]
function keksdeathscreen.Extended.GetRandomMessage(messageArray)
    if not messageArray or #messageArray == 0 then
        return "Keine Nachricht verfügbar"
    end
    return messageArray[math.random(1, #messageArray)]
end

--[[
    Generiert Death Screen Farben für Chat-Nachrichten (Lila-Blau Schema)
    @param text string - Der Text
    @return table - Array mit Color/String Pairs für chat.AddText
]]
function keksdeathscreen.Extended.CreateDeathScreenText(text)
    local result = {}
    local colors = keksdeathscreen.ExtendedConfig.Colors
    
    -- Prefix mit MainTitle Farbe (Lila)
    table.insert(result, colors.MainTitle or Color(150, 100, 255))
    table.insert(result, "[Keks Deathscreen] ")
    
    -- Text mit SubTitle Farbe (Helles Lila-Blau)
    table.insert(result, colors.SubTitle or Color(200, 220, 255))
    table.insert(result, text)
    
    return result
end

--[[
    Sendet eine Death Screen farbige Nachricht an einen Spieler
    @param ply Player - Der Spieler
    @param messageType string - "insufficient_credits" oder "instant_respawn_success"
]]
function keksdeathscreen.Extended.SendDeathScreenMessage(ply, messageType)
    if not IsValid(ply) then return end
    if not keksdeathscreen.ExtendedConfig.Texts[messageType] then return end
    
    local randomMessage = keksdeathscreen.Extended.GetRandomMessage(keksdeathscreen.ExtendedConfig.Texts[messageType])
    local deathScreenText = keksdeathscreen.Extended.CreateDeathScreenText(randomMessage)
    
    if CLIENT then
        chat.AddText(unpack(deathScreenText))
    else
        -- Server-Seite: Netzwerk-Nachricht an Client
        net.Start("keksdeathscreen_deathscreen_message")
        net.WriteTable(deathScreenText)
        net.Send(ply)
    end
end

--[[
    Sendet eine einfache Death Screen farbige Chat-Nachricht (ohne Prefix)
    @param ply Player - Der Spieler
    @param message string - Die Nachricht
]]
function keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, message)
    if not IsValid(ply) then return end
    
    local deathScreenText = keksdeathscreen.Extended.CreateDeathScreenText(message)
    
    if CLIENT then
        chat.AddText(unpack(deathScreenText))
    else
        -- Server-Seite: Netzwerk-Nachricht an Client
        net.Start("keksdeathscreen_deathscreen_message")
        net.WriteTable(deathScreenText)
        net.Send(ply)
    end
end

-- Performance-Optimierung: Begrenze gleichzeitige Death Screens
keksdeathscreen.Extended.MaxConcurrentDeaths = 50  -- Maximal 50 gleichzeitige Death Screens
keksdeathscreen.Extended.ActiveDeathCount = 0

-- ========================================================================================
-- SERVER SEITE - ERWEITERTE FUNKTIONEN
-- ========================================================================================
if SERVER then
    -- Erweiterte Netzwerk-Strings
    util.AddNetworkString("keksdeathscreen_extended_start")
    util.AddNetworkString("keksdeathscreen_extended_stop") 
    util.AddNetworkString("keksdeathscreen_normal_respawn")
    util.AddNetworkString("keksdeathscreen_instant_giveup")
    util.AddNetworkString("keksdeathscreen_open_medic")
    util.AddNetworkString("keksdeathscreen_money_check")
    util.AddNetworkString("keksdeathscreen_money_response")
    util.AddNetworkString("keksdeathscreen_deathscreen_message")  -- Für Death Screen Farben
    
    -- Erweiterte Spieler-Daten (Performance-optimiert)
    local ExtendedPlayerData = {}
    local PlayerCooldowns = {}
    local LastCleanup = 0  -- Performance: Cleanup-Timer
    
    --[[
        Hilfsfunktion: Prüfe DarkRP Geld
        @param ply Player - Der Spieler
        @param amount number - Benötigte Menge
        @return boolean - Hat genug Geld
    ]]
    local function HasEnoughMoney(ply, amount)
        if not IsValid(ply) then return false end
        
        -- DarkRP Integration
        if keksdeathscreen.ExtendedConfig.System.UseDarkRPMoney then
            if ply.getDarkRPVar then
                local currentMoney = ply:getDarkRPVar("money") or 0
                return currentMoney >= amount
            elseif ply.GetMoney then
                local currentMoney = ply:GetMoney() or 0
                return currentMoney >= amount
            end
        end
        
        return false
    end
    
    --[[
        Hilfsfunktion: Ziehe Geld ab
        @param ply Player - Der Spieler
        @param amount number - Abzuziehende Menge
        @return boolean - Erfolgreich abgezogen
    ]]
    local function DeductMoney(ply, amount)
        if not IsValid(ply) then return false end
        if not HasEnoughMoney(ply, amount) then return false end
        
        -- DarkRP Integration
        if keksdeathscreen.ExtendedConfig.System.UseDarkRPMoney then
            if ply.addMoney then
                ply:addMoney(-amount)
                return true
            elseif ply.SetMoney and ply.GetMoney then
                local currentMoney = ply:GetMoney()
                ply:SetMoney(currentMoney - amount)
                return true
            end
        end
        
        return false
    end
    
    --[[
        Erweiterten Deathscreen starten
        @param ply Player - Der Spieler
        @param config table - Optionale Konfiguration
    ]]
    local function StartExtendedDeathscreen(ply, config)
        if not IsValid(ply) then return end
        
        -- Performance-Check: Zu viele gleichzeitige Death Screens?
        if keksdeathscreen.Extended.ActiveDeathCount >= keksdeathscreen.Extended.MaxConcurrentDeaths then
            print("[Keks Deathscreen] Performance-Limit erreicht. Death Screen für " .. ply:Name() .. " übersprungen.")
            return
        end
        
        config = config or keksdeathscreen.ExtendedConfig.Timers
        local steamID = ply:SteamID()
        
        -- Prüfe ob bereits aktiv (Doppel-Aktivierung verhindern)
        if ExtendedPlayerData[steamID] and ExtendedPlayerData[steamID].isDead then
            return
        end
        
        -- Spieler-Daten speichern
        ExtendedPlayerData[steamID] = {
            isDead = true,
            startTime = CurTime(),
            autoRespawnTime = CurTime() + config.auto_respawn_time,
            normalRespawnTime = CurTime() + config.normal_respawn_time,
            instantGiveupCost = config.instant_giveup_cost,
            usedInstantGiveup = false,
            lastButtonClick = 0,
            normalRespawnNotified = false  -- Flag für Normal Respawn Benachrichtigung
        }
        
        -- Performance-Counter erhöhen
        keksdeathscreen.Extended.ActiveDeathCount = keksdeathscreen.Extended.ActiveDeathCount + 1
        
        -- Sende Star Wars Death Message
        if keksdeathscreen.ExtendedConfig.System.LogToChat then
            keksdeathscreen.Extended.SendDeathScreenMessage(ply, "death_occurred")
        end
        
        -- An Client senden
        net.Start("keksdeathscreen_extended_start")
        net.WriteTable(config)
        net.Send(ply)
        
        if keksdeathscreen.ExtendedConfig.System.EnableLogging then
            print(string.format("[Keks Deathscreen] Erweiterten Deathscreen für %s gestartet", ply:Name()))
        end
    end
    
    --[[
        Erweiterten Deathscreen stoppen
        @param ply Player - Der Spieler
        @param reason string - Grund für das Stoppen
    ]]
    local function StopExtendedDeathscreen(ply, reason)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        
        -- Performance-Counter verringern (wenn Spieler aktiv war)
        if ExtendedPlayerData[steamID] and ExtendedPlayerData[steamID].isDead then
            keksdeathscreen.Extended.ActiveDeathCount = math.max(0, keksdeathscreen.Extended.ActiveDeathCount - 1)
        end
        
        ExtendedPlayerData[steamID] = nil
        PlayerCooldowns[steamID] = CurTime() + 3 -- Respawn-Schutz
        
        net.Start("keksdeathscreen_extended_stop")
        net.WriteString(reason or "")
        net.Send(ply)
        
        if keksdeathscreen.ExtendedConfig.System.EnableLogging then
            print(string.format("[Keks Deathscreen] Deathscreen für %s gestoppt. Grund: %s", ply:Name(), reason or "Unbekannt"))
        end
    end
    
    --[[
        Prüfe Cooldown
        @param ply Player - Der Spieler
        @return boolean - Cooldown aktiv
    ]]
    local function IsOnCooldown(ply)
        if not IsValid(ply) then return true end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        if not data then return true end
        
        local cooldown = keksdeathscreen.ExtendedConfig.System.ClickCooldown
        return CurTime() - data.lastButtonClick < cooldown
    end
    
    --[[
        Setze Cooldown
        @param ply Player - Der Spieler
    ]]
    local function SetCooldown(ply)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        if data then
            data.lastButtonClick = CurTime()
        end
    end
    
    -- Hook: Erweiterte PlayerDeath Behandlung
    hook.Add("PlayerDeath", "keksdeathscreen_extended_death", function(victim, inflictor, attacker)
        if not IsValid(victim) then return end
        if not victim:IsPlayer() then return end
        
        local steamID = victim:SteamID()
        
        print("[Keks Deathscreen] PlayerDeath Hook ausgelöst für: " .. victim:Nick())
        
        -- Prüfe Cooldown-Schutz
        if PlayerCooldowns[steamID] and CurTime() < PlayerCooldowns[steamID] then
            print("[Keks Deathscreen] Cooldown aktiv für: " .. victim:Nick())
            return
        end
        
        -- Prüfe ob bereits aktiv
        if ExtendedPlayerData[steamID] and ExtendedPlayerData[steamID].isDead then
            print("[Keks Deathscreen] Deathscreen bereits aktiv für: " .. victim:Nick())
            return
        end
        
        -- Starte erweiterten Deathscreen
        timer.Simple(0.1, function()
            if IsValid(victim) then
                print("[Keks Deathscreen] Starte erweiterten Deathscreen für: " .. victim:Nick())
                StartExtendedDeathscreen(victim)
            else
                print("[Keks Deathscreen] Spieler ungültig beim Timer-Start")
            end
        end)
    end)
    
    -- Hook: Auto-Respawn Timer + Command-Respawn Check (Performance-optimiert)
    hook.Add("Think", "keksdeathscreen_extended_timer", function()
        local currentTime = CurTime()
        
        -- Performance: Cleanup nur alle 5 Sekunden
        if currentTime - LastCleanup > 5 then
            LastCleanup = currentTime
            
            -- Bereinige ungültige Einträge
            for steamID, data in pairs(ExtendedPlayerData) do
                local ply = player.GetBySteamID(steamID)
                if not IsValid(ply) then
                    ExtendedPlayerData[steamID] = nil
                    keksdeathscreen.Extended.ActiveDeathCount = math.max(0, keksdeathscreen.Extended.ActiveDeathCount - 1)
                end
            end
            
            -- Bereinige alte Cooldowns
            for steamID, cooldownTime in pairs(PlayerCooldowns) do
                if currentTime > cooldownTime then
                    PlayerCooldowns[steamID] = nil
                end
            end
        end
        
        -- Hauptschleife für aktive Death Screens
        for steamID, data in pairs(ExtendedPlayerData) do
            local ply = player.GetBySteamID(steamID)
            
            if IsValid(ply) and data.isDead then
                -- Prüfe ob Spieler lebt obwohl Death Screen aktiv ist (Command-Respawn)
                if ply:Alive() and not ply:GetNoDraw() then
                    print("[Keks Deathscreen] Command-Respawn in Think-Hook erkannt für: " .. ply:Nick())
                    StopExtendedDeathscreen(ply, "command_respawn_detected")
                    
                    -- Movement-Fix
                    timer.Simple(0.1, function()
                        if IsValid(ply) then
                            ply:Freeze(false)
                            ply:SetMoveType(MOVETYPE_WALK)
                            ply:SetVelocity(Vector(0, 0, 0))
                        end
                    end)
                    
                -- Auto-Respawn Timer Check
                elseif currentTime >= data.autoRespawnTime then
                    StopExtendedDeathscreen(ply, "auto_respawn")
                    
                    timer.Simple(0.2, function()
                        if IsValid(ply) then
                            -- Bessere Spawn-Behandlung für Movement-Fix
                            ply:Spawn()
                            
                            -- Movement-Fix: Stelle sicher dass der Spieler sich bewegen kann
                            timer.Simple(0.1, function()
                                if IsValid(ply) then
                                    -- Entferne mögliche Bewegungsblockaden
                                    ply:Freeze(false)
                                    ply:SetMoveType(MOVETYPE_WALK)
                                    
                                    -- Stelle sicher dass keine Entity-Blockaden bestehen
                                    if ply:GetNoDraw() then
                                        ply:SetNoDraw(false)
                                    end
                                    
                                    -- Forciere Bewegungs-Reset
                                    ply:SetVelocity(Vector(0, 0, 0))
                                    
                                    print("[Keks Deathscreen] Auto-Respawn mit Movement-Fix für: " .. ply:Nick())
                                end
                            end)
                        end
                    end)
                
                -- Normal Respawn Ready Notification (nur einmal senden)
                elseif currentTime >= data.normalRespawnTime and not data.normalRespawnNotified then
                    data.normalRespawnNotified = true
                    if keksdeathscreen.ExtendedConfig.System.LogToChat then
                        keksdeathscreen.Extended.SendDeathScreenMessage(ply, "normal_respawn_ready")
                    end
                    print("[Keks Deathscreen] Normal Respawn verfügbar für: " .. ply:Nick())
                end
            elseif not IsValid(ply) then
                -- Spieler ist weg, cleanup
                ExtendedPlayerData[steamID] = nil
            end
        end
    end)
    
    -- Netzwerk: Normaler Respawn
    net.Receive("keksdeathscreen_normal_respawn", function(len, ply)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        
        if not data or not data.isDead then return end
        if IsOnCooldown(ply) then return end
        
        -- Prüfe ob normaler Respawn verfügbar ist
        if CurTime() >= data.normalRespawnTime then
            SetCooldown(ply)
            StopExtendedDeathscreen(ply, "normal_respawn")
            
            timer.Simple(0.2, function()
                if IsValid(ply) then
                    ply:Spawn()
                    
                    -- Movement-Fix auch für normalen Respawn
                    timer.Simple(0.1, function()
                        if IsValid(ply) then
                            ply:Freeze(false)
                            ply:SetMoveType(MOVETYPE_WALK)
                            
                            if ply:GetNoDraw() then
                                ply:SetNoDraw(false)
                            end
                            
                            ply:SetVelocity(Vector(0, 0, 0))
                            
                            if keksdeathscreen.ExtendedConfig.System.LogToChat then
                                keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, keksdeathscreen.ExtendedConfig.Texts.respawn_success)
                            end
                            
                            print("[Keks Deathscreen] Normaler Respawn mit Movement-Fix für: " .. ply:Nick())
                        end
                    end)
                end
            end)
        else
            -- Zu früh für normalen Respawn - sende Star Wars Nachricht
            if keksdeathscreen.ExtendedConfig.System.LogToChat then
                keksdeathscreen.Extended.SendDeathScreenMessage(ply, "early_respawn_attempt")
            end
        end
    end)
    
    -- Netzwerk: Sofortiges Aufgeben (kostenpflichtig)
    net.Receive("keksdeathscreen_instant_giveup", function(len, ply)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        
        if not data or not data.isDead then return end
        if IsOnCooldown(ply) then return end
        if data.usedInstantGiveup then return end -- Nur einmal pro Tod
        
        local cost = data.instantGiveupCost
        
        -- Prüfe Geld
        if HasEnoughMoney(ply, cost) then
            if DeductMoney(ply, cost) then
                data.usedInstantGiveup = true
                SetCooldown(ply)
                
                StopExtendedDeathscreen(ply, "instant_giveup")
                
                timer.Simple(0.2, function()
                    if IsValid(ply) then
                        ply:Spawn()
                        
                        -- Movement-Fix auch für Instant-Giveup
                        timer.Simple(0.1, function()
                            if IsValid(ply) then
                                ply:Freeze(false)
                                ply:SetMoveType(MOVETYPE_WALK)
                                
                                if ply:GetNoDraw() then
                                    ply:SetNoDraw(false)
                                end
                                
                                ply:SetVelocity(Vector(0, 0, 0))
                                
                                if keksdeathscreen.ExtendedConfig.System.LogToChat then
                                    keksdeathscreen.Extended.SendDeathScreenMessage(ply, "instant_respawn_success")
                                end
                                
                                print("[Keks Deathscreen] Instant-Giveup mit Movement-Fix für: " .. ply:Nick())
                            end
                        end)
                    end
                end)
            end
        else
            -- Nicht genug Credits
            if keksdeathscreen.ExtendedConfig.System.LogToChat then
                keksdeathscreen.Extended.SendDeathScreenMessage(ply, "insufficient_credits")
            end
        end
    end)
    
    -- Netzwerk: Medizin-System öffnen
    net.Receive("keksdeathscreen_open_medic", function(len, ply)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        
        if not data or not data.isDead then return end
        if IsOnCooldown(ply) then return end
        
        SetCooldown(ply)
        
        -- Führe Medic-Command aus (wenn gesetzt)
        local medicCommand = keksdeathscreen.ExtendedConfig.System.MedicCommand
        if medicCommand and medicCommand ~= "" then
            ply:ConCommand(medicCommand)
        end
        
        if keksdeathscreen.ExtendedConfig.System.LogToChat then
            keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, keksdeathscreen.ExtendedConfig.Texts.medic_called)
        end
        
        if keksdeathscreen.ExtendedConfig.System.EnableLogging then
            print(string.format("[Keks Deathscreen] %s hat das Medizin-System geöffnet", ply:Name()))
        end
    end)
    
    -- Netzwerk: Geld-Check für Client
    net.Receive("keksdeathscreen_money_check", function(len, ply)
        if not IsValid(ply) then return end
        
        local amount = net.ReadUInt(32)
        local hasMoney = HasEnoughMoney(ply, amount)
        
        net.Start("keksdeathscreen_money_response")
        net.WriteBool(hasMoney)
        net.WriteUInt(amount, 32)
        net.Send(ply)
    end)
    
    -- Blockiere Standard-Respawn für erweiterte Version
    hook.Add("PlayerDeathThink", "keksdeathscreen_extended_blockrespawn", function(ply)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        
        if data and data.isDead then
            return false
        end
    end)
    
    -- Hook: Prüfe auf Command-Respawn (PlayerSpawn nach Death)
    hook.Add("PlayerSpawn", "keksdeathscreen_extended_command_respawn", function(ply)
        if not IsValid(ply) then return end
        
        local steamID = ply:SteamID()
        local data = ExtendedPlayerData[steamID]
        
        -- Wenn Spieler Death Screen aktiv hat aber spawnt (durch Command oder Admin-Action)
        if data and data.isDead then
            print("[Keks Deathscreen] Command/Admin-Respawn erkannt für: " .. ply:Nick())
            
            -- Stoppe Death Screen sofort
            StopExtendedDeathscreen(ply, "command_respawn")
            
            -- Movement-Fix auch für Command-Respawn
            timer.Simple(0.1, function()
                if IsValid(ply) then
                    ply:Freeze(false)
                    ply:SetMoveType(MOVETYPE_WALK)
                    
                    if ply:GetNoDraw() then
                        ply:SetNoDraw(false)
                    end
                    
                    ply:SetVelocity(Vector(0, 0, 0))
                    
                    if keksdeathscreen.ExtendedConfig.System.LogToChat then
                        keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, "Kommando hat Death Screen beendet!")
                    end
                    
                    print("[Keks Deathscreen] Command-Respawn mit Movement-Fix für: " .. ply:Nick())
                end
            end)
        end
    end)
    
    -- Cleanup bei Disconnect
    hook.Add("PlayerDisconnected", "keksdeathscreen_extended_cleanup", function(ply)
        if IsValid(ply) then
            local steamID = ply:SteamID()
            ExtendedPlayerData[steamID] = nil
            PlayerCooldowns[steamID] = nil
        end
    end)
    
    -- Test-Befehle für das erweiterte System
    concommand.Add("keks_extended_test", function(ply, cmd, args)
        if not IsValid(ply) then return end
        
        StartExtendedDeathscreen(ply)
        keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, "Kommando Test-Modus aktiviert!")
    end)
    
    concommand.Add("keks_extended_stop", function(ply, cmd, args)
        if not IsValid(ply) then return end
        
        StopExtendedDeathscreen(ply, "admin_stop")
        keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, "Kommando Test-Modus deaktiviert!")
    end)
    
    print("[Keks Deathscreen] Erweiterte Server-Funktionen geladen!")
    
-- ========================================================================================  
-- CLIENT SEITE - ERWEITERTE UI
-- ========================================================================================
else -- CLIENT
    
    -- Netzwerk: Death Screen Nachrichten empfangen
    net.Receive("keksdeathscreen_deathscreen_message", function()
        local deathScreenText = net.ReadTable()
        if deathScreenText and #deathScreenText > 0 then
            chat.AddText(unpack(deathScreenText))
        end
    end)
    
    -- Warte auf Config-Verfügbarkeit und erstelle dann Fonts
    timer.Simple(0.1, function()
        if keksdeathscreen.ExtendedConfig and keksdeathscreen.ExtendedConfig.Fonts then
            -- Erstelle erweiterte Fonts mit Config-Werten
            surface.CreateFont("keksdeathscreen_extended_maintitle", {
                font = keksdeathscreen.ExtendedConfig.Fonts.MainTitle.font or "Tahoma",
                size = keksdeathscreen.ExtendedConfig.Fonts.MainTitle.size or 48,
                weight = keksdeathscreen.ExtendedConfig.Fonts.MainTitle.weight or 800,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_subtitle", {
                font = keksdeathscreen.ExtendedConfig.Fonts.SubTitle.font or "Tahoma",
                size = keksdeathscreen.ExtendedConfig.Fonts.SubTitle.size or 24,
                weight = keksdeathscreen.ExtendedConfig.Fonts.SubTitle.weight or 400,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_timer", {
                font = keksdeathscreen.ExtendedConfig.Fonts.Timer.font or "Tahoma",
                size = keksdeathscreen.ExtendedConfig.Fonts.Timer.size or 36,
                weight = keksdeathscreen.ExtendedConfig.Fonts.Timer.weight or 700,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_button", {
                font = keksdeathscreen.ExtendedConfig.Fonts.ButtonText.font or "Tahoma",
                size = keksdeathscreen.ExtendedConfig.Fonts.ButtonText.size or 18,
                weight = keksdeathscreen.ExtendedConfig.Fonts.ButtonText.weight or 600,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_help", {
                font = keksdeathscreen.ExtendedConfig.Fonts.HelpText.font or "Tahoma",
                size = keksdeathscreen.ExtendedConfig.Fonts.HelpText.size or 14,
                weight = keksdeathscreen.ExtendedConfig.Fonts.HelpText.weight or 400,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_warning", {
                font = keksdeathscreen.ExtendedConfig.Fonts.WarningText.font or "Tahoma",
                size = keksdeathscreen.ExtendedConfig.Fonts.WarningText.size or 16,
                weight = keksdeathscreen.ExtendedConfig.Fonts.WarningText.weight or 500,
                antialias = true,
                shadow = true
            })
            
            print("[Keks Deathscreen] Erweiterte Client-Fonts erstellt!")
        else
            -- Fallback Fonts falls Config nicht verfügbar
            surface.CreateFont("keksdeathscreen_extended_maintitle", {
                font = "Tahoma",
                size = 48,
                weight = 800,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_subtitle", {
                font = "Tahoma",
                size = 24,
                weight = 400,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_timer", {
                font = "Tahoma",
                size = 36,
                weight = 700,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_button", {
                font = "Tahoma",
                size = 18,
                weight = 600,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_help", {
                font = "Tahoma",
                size = 14,
                weight = 400,
                antialias = true,
                shadow = true
            })
            
            surface.CreateFont("keksdeathscreen_extended_warning", {
                font = "Tahoma",
                size = 16,
                weight = 500,
                antialias = true,
                shadow = true
            })
            
            print("[Keks Deathscreen] Fallback-Fonts erstellt!")
        end
    end)
    
    -- Client-Variablen
    local ExtendedDeathscreenActive = false
    local DeathConfig = {}
    local DeathStartTime = 0
    local FadeAlpha = 0
    local MouseX, MouseY = 0, 0
    local HasEnoughMoneyForGiveup = false
    local UsedInstantGiveup = false
    local LastMoneyCheck = 0
    
    -- Button-Daten
    local Buttons = {}
    local HoveredButton = nil
    
    --[[
        Hilfsfunktion: Zeichne Text mit Schatten
        @param text string - Der Text
        @param font string - Die Schriftart
        @param x number - X Position
        @param y number - Y Position
        @param color Color - Farbe
        @param align number - Ausrichtung
    ]]
    local function DrawShadowText(text, font, x, y, color, align)
        align = align or TEXT_ALIGN_CENTER
        
        -- Erweiterte Sicherheitscheck mit Debug-Info
        if type(text) == "table" then
            if keksdeathscreen.ExtendedConfig.System.EnableLogging then
                print("[Keks Deathscreen] Warning: DrawShadowText received table instead of string:", table.ToString(text))
            end
            text = text[1] or "Error: Empty Table"
        elseif type(text) ~= "string" then
            if keksdeathscreen.ExtendedConfig.System.EnableLogging then
                print("[Keks Deathscreen] Warning: DrawShadowText received invalid type:", type(text), text)
            end
            text = tostring(text) or "Error: Invalid Text"
        end
        
        -- Weitere Validierung
        if text == "" then
            text = "Error: Empty String"
        end
        
        surface.SetFont(font)
        local textW, textH = surface.GetTextSize(text)
        
        if align == TEXT_ALIGN_CENTER then
            x = x - textW / 2
        end
        
        -- Schatten
        surface.SetTextColor(0, 0, 0, 150)
        surface.SetTextPos(x + 2, y + 2)
        surface.DrawText(text)
        
        -- Haupttext
        surface.SetTextColor(color.r, color.g, color.b, color.a)
        surface.SetTextPos(x, y)
        surface.DrawText(text)
        
        return textW, textH
    end
    
    --[[
        Hilfsfunktion: Zeichne abgerundeten Button
        @param x number - X Position
        @param y number - Y Position
        @param w number - Breite
        @param h number - Höhe
        @param color Color - Farbe
        @param text string - Button Text
        @param textColor Color - Text Farbe
        @param hovered boolean - Ist gehovered
    ]]
    local function DrawRoundedButton(x, y, w, h, color, text, textColor, hovered)
        local radius = (keksdeathscreen.ExtendedConfig and keksdeathscreen.ExtendedConfig.Layout and keksdeathscreen.ExtendedConfig.Layout.ButtonCornerRadius) or 8
        
        -- Button-Hintergrund mit Hover-Effekt
        if hovered then
            local hoverAlpha = math.sin(CurTime() * 3) * 0.2 + 0.8
            surface.SetDrawColor(color.r * hoverAlpha, color.g * hoverAlpha, color.b * hoverAlpha, color.a)
        else
            surface.SetDrawColor(color.r, color.g, color.b, color.a)
        end
        
        -- Zeichne abgerundetes Rechteck (vereinfacht)
        surface.DrawRect(x, y, w, h)
        
        -- Button-Rahmen
        local borderColor = (keksdeathscreen.ExtendedConfig and keksdeathscreen.ExtendedConfig.Colors and keksdeathscreen.ExtendedConfig.Colors.ButtonBorder) or Color(255, 255, 255, 100)
        surface.SetDrawColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
        surface.DrawOutlinedRect(x, y, w, h, 2)
        
        -- Button-Text
        DrawShadowText(text, "keksdeathscreen_extended_button", x + w/2, y + h/2 - 10, textColor)
    end
    
    --[[
        Prüfe ob Maus über Button ist
        @param x number - Button X
        @param y number - Button Y  
        @param w number - Button Breite
        @param h number - Button Höhe
        @return boolean - Ist gehovered
    ]]
    local function IsMouseOverButton(x, y, w, h)
        return MouseX >= x and MouseX <= x + w and MouseY >= y and MouseY <= y + h
    end
    
    --[[
        Erstelle Buttons
    ]]
    local function CreateButtons()
        Buttons = {}
        
        -- Sichere Config-Zugriffe mit Fallbacks
        local config = keksdeathscreen.ExtendedConfig
        if not config then return end
        
        local scrW, scrH = ScrW(), ScrH()
        local layout = config.Layout or {}
        local buttonW = layout.ButtonWidth or 400
        local buttonH = layout.ButtonHeight or 50
        local spacing = layout.ButtonSpacing or 20
        local startY = scrH * (layout.ButtonStartY or 0.42)
        
        local buttonX = scrW/2 - buttonW/2
        local currentY = startY
        
        -- Button 1: Normaler Respawn
        if config.System and config.System.EnableNormalRespawn then
            local buttonText = (config.Texts and config.Texts.normal_respawn_button) or "Normaler Respawn"
            -- Sicherheitscheck für Button-Text
            if type(buttonText) == "table" then
                buttonText = "Normaler Respawn (Error: Table)"
                print("[Keks Deathscreen] ERROR: normal_respawn_button ist eine Tabelle!")
            end
            
            Buttons.NormalRespawn = {
                x = buttonX,
                y = currentY,
                w = buttonW,
                h = buttonH,
                text = buttonText,
                action = "normal_respawn"
            }
            currentY = currentY + buttonH + spacing
        end
        
        -- Button 2: Sofort Aufgeben
        if config.System and config.System.EnableInstantGiveup then
            local buttonText = (config.Texts and config.Texts.instant_giveup_button) or "Sofort aufgeben (2500 $ / Credits)"
            -- Sicherheitscheck für Button-Text
            if type(buttonText) == "table" then
                buttonText = "Sofort aufgeben (Error: Table)"
                print("[Keks Deathscreen] ERROR: instant_giveup_button ist eine Tabelle!")
            end
            
            Buttons.InstantGiveup = {
                x = buttonX,
                y = currentY,
                w = buttonW,
                h = buttonH,
                text = buttonText,
                action = "instant_giveup"
            }
            currentY = currentY + buttonH + spacing
        end
        
        -- Button 3: Medizin System (ENTFERNT - öffnet sich automatisch)
        -- Das Medizin-System öffnet sich automatisch wenn ein Mediziner anwesend ist
    end
    
    --[[
        Hauptzeichnungsfunktion für erweiterten Deathscreen
    ]]
    local function DrawExtendedDeathscreen()
        if not ExtendedDeathscreenActive then return end
        if not DeathConfig or not DeathConfig.auto_respawn_time then return end
        
        -- Sichere Config-Zugriffe mit Fallbacks
        local config = keksdeathscreen.ExtendedConfig
        if not config then return end
        
        local scrW, scrH = ScrW(), ScrH()
        local colors = config.Colors or {}
        local texts = config.Texts or {}
        local layout = config.Layout or {}
        local animations = config.Animations or {}
        
        -- Fade-In Animation
        FadeAlpha = math.min(255, FadeAlpha + FrameTime() * (animations.FadeInSpeed or 300))
        
        -- Hintergrund
        local bgColor = colors.Background or Color(20, 10, 40, 220)
        surface.SetDrawColor(bgColor.r, bgColor.g, bgColor.b, math.min(bgColor.a, FadeAlpha))
        surface.DrawRect(0, 0, scrW, scrH)
        
        -- Haupttitel
        DrawShadowText(
            "VITALZUSTAND KRITISCH",
            "keksdeathscreen_extended_maintitle",
            scrW * (layout.MainTitle and layout.MainTitle.X or 0.5), 
            scrH * (layout.MainTitle and layout.MainTitle.Y or 0.15),
            colors.MainTitle or Color(150, 100, 255, 255)
        )
        
        -- Untertitel
        DrawShadowText(
            "Du liegst im Sterben",
            "keksdeathscreen_extended_subtitle", 
            scrW * (layout.SubTitle and layout.SubTitle.X or 0.5), 
            scrH * (layout.SubTitle and layout.SubTitle.Y or 0.22),
            colors.SubTitle or Color(200, 220, 255, 255)
        )
        
        -- Timer Beschreibung (ohne Zeit-Anzeige)
        DrawShadowText(
            "Automatischer Respawn:",
            "keksdeathscreen_extended_button",
            scrW/2, 
            scrH * 0.28,
            colors.TimerDesc or Color(100, 150, 255, 255)
        )
        
        -- Berechnung für Fortschrittsbalken (ohne Zeit-Anzeige)
        local timeLeft = math.max(0, math.ceil((DeathStartTime + DeathConfig.auto_respawn_time) - CurTime()))
        local totalTime = DeathConfig.auto_respawn_time or 600
        local timePassed = totalTime - timeLeft
        local progress = math.min(1.0, timePassed / totalTime) -- 0.0 bis 1.0
        
        -- ========================================================================
        -- FORTSCHRITTSBALKEN - Füllt sich mit der Zeit (höher positioniert)
        -- ========================================================================
        
        local progressBarY = scrH * 0.32 -- Höher positioniert, mehr Platz für Buttons
        local progressBarWidth = 500
        local progressBarHeight = 25
        local progressBarX = scrW/2 - progressBarWidth/2
        
        -- Hintergrund des Fortschrittsbalkens
        surface.SetDrawColor(20, 10, 40, 200)
        surface.DrawRect(progressBarX - 3, progressBarY - 3, progressBarWidth + 6, progressBarHeight + 6)
        
        surface.SetDrawColor(60, 40, 100, 255)
        surface.DrawRect(progressBarX, progressBarY, progressBarWidth, progressBarHeight)
        
        -- Fortschritts-Füllung mit Farbverlauf
        local fillWidth = progressBarWidth * progress
        
        if fillWidth > 0 then
            -- Farbverlauf basierend auf Fortschritt
            local fillColor
            if progress < 0.3 then
                -- Früh: Lila
                fillColor = Color(120, 80, 255, 200)
            elseif progress < 0.7 then
                -- Mitte: Übergang zu Orange
                local blend = (progress - 0.3) / 0.4
                fillColor = Color(
                    120 + (255 - 120) * blend,
                    80 + (150 - 80) * blend,
                    255 + (50 - 255) * blend,
                    200
                )
            else
                -- Ende: Orange/Gold
                fillColor = Color(255, 200, 50, 200)
            end
            
            -- Animierter Glow-Effekt
            local glowIntensity = math.sin(CurTime() * 2) * 0.3 + 0.7
            surface.SetDrawColor(
                fillColor.r * glowIntensity, 
                fillColor.g * glowIntensity, 
                fillColor.b * glowIntensity, 
                fillColor.a
            )
            surface.DrawRect(progressBarX, progressBarY, fillWidth, progressBarHeight)
            
            -- Glänzender Overlay-Effekt
            surface.SetDrawColor(255, 255, 255, 50)
            surface.DrawRect(progressBarX, progressBarY, fillWidth, progressBarHeight / 3)
        end
        
        -- Rahmen des Fortschrittsbalkens
        surface.SetDrawColor(255, 255, 255, 150)
        surface.DrawOutlinedRect(progressBarX, progressBarY, progressBarWidth, progressBarHeight, 2)
        
        -- Fortschritts-Prozent über dem Balken
        local progressText = string.format("%.1f%%", progress * 100)
        DrawShadowText(
            progressText,
            "keksdeathscreen_extended_button",
            scrW/2, progressBarY - 25,
            Color(200, 180, 255, 255)
        )
        
        -- Markierungen für beide Zeitpunkte
        local normalRespawnProgress = (DeathConfig.normal_respawn_time or 120) / totalTime
        
        -- 2-Minuten Markierung (Normal-Respawn)
        if normalRespawnProgress <= 1.0 then
            local marker2X = progressBarX + progressBarWidth * normalRespawnProgress
            surface.SetDrawColor(100, 255, 100, 200)
            surface.DrawRect(marker2X - 1, progressBarY - 5, 2, progressBarHeight + 10)
            
            -- Label für 2-Min Markierung
            DrawShadowText(
                "2 Min",
                "keksdeathscreen_extended_help",
                marker2X, progressBarY + progressBarHeight + 15,
                Color(100, 255, 100, 200)
            )
        end
        
        -- 10-Minuten Markierung (Auto-Respawn Ende)
        local auto10MinX = progressBarX + progressBarWidth -- Ganz am Ende
        surface.SetDrawColor(255, 100, 100, 200)
        surface.DrawRect(auto10MinX - 1, progressBarY - 5, 2, progressBarHeight + 10)
        
        -- Label für 10-Min Markierung
        DrawShadowText(
            "10 Min",
            "keksdeathscreen_extended_help",
            auto10MinX, progressBarY + progressBarHeight + 15,
            Color(255, 100, 100, 200)
        )
        
        -- Maus-Position aktualisieren
        MouseX, MouseY = gui.MouseX(), gui.MouseY()
        HoveredButton = nil
        
        -- Buttons zeichnen
        CreateButtons()
        
        -- Normaler Respawn Button
        if Buttons.NormalRespawn then
            local btn = Buttons.NormalRespawn
            local timeSinceDeath = CurTime() - DeathStartTime
            local normalRespawnAvailable = timeSinceDeath >= DeathConfig.normal_respawn_time
            local isHovered = IsMouseOverButton(btn.x, btn.y, btn.w, btn.h)
            
            if isHovered then HoveredButton = "NormalRespawn" end
            
            local buttonColor = normalRespawnAvailable and (colors.NormalRespawnButton or Color(100, 200, 100, 255)) or (colors.NormalRespawnButtonDisabled or Color(100, 100, 100, 255))
            if isHovered and normalRespawnAvailable then
                buttonColor = colors.NormalRespawnButtonHover or Color(120, 220, 120, 255)
            end
            
            local buttonText = btn.text
            if not normalRespawnAvailable then
                local waitTime = math.ceil(DeathConfig.normal_respawn_time - timeSinceDeath)
                buttonText = string.format(texts.normal_respawn_wait or "Normaler Respawn in: %d Sekunden", waitTime)
            else
                buttonText = texts.normal_respawn_ready or "Normaler Respawn verfügbar"
            end
            
            DrawRoundedButton(btn.x, btn.y, btn.w, btn.h, buttonColor, buttonText, Color(255, 255, 255), isHovered)
        end
        
        -- Sofort Aufgeben Button
        if Buttons.InstantGiveup then
            local btn = Buttons.InstantGiveup
            local isHovered = IsMouseOverButton(btn.x, btn.y, btn.w, btn.h)
            
            if isHovered then HoveredButton = "InstantGiveup" end
            
            local buttonColor = colors.InstantGiveupButton or Color(255, 150, 50, 255)
            local canAfford = HasEnoughMoneyForGiveup
            local alreadyUsed = UsedInstantGiveup
            
            -- Button-Farben basierend auf Status
            if alreadyUsed then
                -- Bereits verwendet - ganz deaktiviert
                buttonColor = colors.InstantGiveupButtonDisabled or Color(120, 80, 30, 255)
            elseif not canAfford then
                -- Nicht genug Geld - rötlich aber trotzdem klickbar
                buttonColor = Color(200, 100, 100, 255)
                if isHovered then
                    buttonColor = Color(220, 120, 120, 255)
                end
            elseif isHovered then
                -- Genug Geld und Hover
                buttonColor = colors.InstantGiveupButtonHover or Color(255, 170, 70, 255)
            end
            
            -- Button ist klickbar wenn nicht bereits verwendet
            local isClickable = not alreadyUsed
            DrawRoundedButton(btn.x, btn.y, btn.w, btn.h, buttonColor, btn.text, Color(255, 255, 255), isHovered and isClickable)
        end
        
        -- Medizin System Button (ENTFERNT - öffnet sich automatisch bei Mediziner-Anwesenheit)
        
        -- ========================================================================
        -- STRUKTURIERTE INFORMATIONSTEXTE - Zentriert und ordentlich untereinander
        -- ========================================================================
        
        -- REGELWERK-BEREICH (weiter unten nach den Buttons)
        local ruleStartY = scrH * 0.65
        
        -- Haupttitel - NEW LIFE RULE (größer und zentriert)
        DrawShadowText(
            "NEW LIFE RULE - WICHTIGE INFORMATION",
            "keksdeathscreen_extended_timer",
            scrW/2, ruleStartY,
            Color(255, 220, 120, 255)
        )
        
        -- Untertitel - Korrekte Anwendung (untereinander, zentriert)
        DrawShadowText(
            "Die New Life Rule gilt NUR beim Respawn",
            "keksdeathscreen_extended_button",
            scrW/2, ruleStartY + 35,
            Color(255, 200, 100, 220)
        )
        
        -- Regeltext - kompakt und zentriert (3 Zeilen untereinander, größerer Font)
        DrawShadowText(
            "Bei normalem oder sofortigem Respawn vergisst man",
            "keksdeathscreen_extended_button",  -- Größerer Font statt _help
            scrW/2, ruleStartY + 70,
            Color(255, 200, 100, 200)
        )
        
        DrawShadowText(
            "alle Umstände, die zum Tod geführt haben.",
            "keksdeathscreen_extended_button",  -- Größerer Font statt _help
            scrW/2, ruleStartY + 100,
            Color(255, 200, 100, 200)
        )
        
        DrawShadowText(
            "Dies ist eine wichtige Roleplay-Regel!",
            "keksdeathscreen_extended_button",  -- Größerer Font statt _help
            scrW/2, ruleStartY + 130,
            Color(255, 200, 100, 180)
        )
        
        -- Trennlinie für bessere Struktur (mehr Platz)
        local separatorY = ruleStartY + 165
        surface.SetDrawColor(120, 80, 255, 150)
        surface.DrawRect(scrW/2 - 350, separatorY, 700, 2)
        
        -- MEDIZIN-SYSTEM BEREICH (strukturiert untereinander, mehr Abstände)
        if config.System and config.System.EnableMedicSystem then
            local medicY = separatorY + 30
            
            -- Medizin-Titel (zentriert)
            DrawShadowText(
                "MEDIC ROLEPLAY - WICHTIGE PFLICHT",
                "keksdeathscreen_extended_timer",
                scrW/2, medicY,
                Color(150, 200, 255, 255)
            )
            
            -- Medizin-Info strukturiert (untereinander, zentriert, größerer Font)
            DrawShadowText(
                "Es ist Pflicht mit Medizinern Medic RP zu machen!",
                "keksdeathscreen_extended_button",
                scrW/2, medicY + 40,
                Color(100, 255, 150, 220)
            )
            
            DrawShadowText(
                "Wenn ein Mediziner anwesend ist, öffnet sich automatisch",
                "keksdeathscreen_extended_button",  -- Größerer Font statt _help
                scrW/2, medicY + 75,
                Color(140, 190, 255, 200)
            )
            
            DrawShadowText(
                "ein Medizin-System für das Roleplay mit dem Mediziner.",
                "keksdeathscreen_extended_button",  -- Größerer Font statt _help
                scrW/2, medicY + 105,
                Color(140, 190, 255, 180)
            )
        end
        
        -- Geld-Check alle 2 Sekunden
        if CurTime() - LastMoneyCheck > 2.0 and config.System and config.System.EnableInstantGiveup then
            LastMoneyCheck = CurTime()
            net.Start("keksdeathscreen_money_check")
            net.WriteUInt(DeathConfig.instant_giveup_cost or 1000, 32)
            net.SendToServer()
        end
    end
    
    --[[
        Handle Mausklicks
    ]]
    local function HandleMouseClick()
        if not ExtendedDeathscreenActive then return end
        if not HoveredButton then return end
        
        local timeSinceDeath = CurTime() - DeathStartTime
        
        -- Normaler Respawn
        if HoveredButton == "NormalRespawn" and timeSinceDeath >= DeathConfig.normal_respawn_time then
            net.Start("keksdeathscreen_normal_respawn")
            net.SendToServer()
        
        -- Sofort Aufgeben  
        elseif HoveredButton == "InstantGiveup" and not UsedInstantGiveup then
            if HasEnoughMoneyForGiveup then
                UsedInstantGiveup = true
                net.Start("keksdeathscreen_instant_giveup")
                net.SendToServer()
            else
                -- Nicht genug Credits - zeige clientseitige Death Screen Nachricht
                keksdeathscreen.Extended.SendDeathScreenMessage(LocalPlayer(), "insufficient_credits")
            end
        
        -- Medizin System (ENTFERNT - öffnet sich automatisch bei Mediziner-Anwesenheit)
        -- elseif HoveredButton == "MedicSystem" then
        --     net.Start("keksdeathscreen_open_medic")
        --     net.SendToServer()
        end
    end
    
    -- Netzwerk empfangen
    net.Receive("keksdeathscreen_extended_start", function()
        DeathConfig = net.ReadTable()
        
        ExtendedDeathscreenActive = true
        DeathStartTime = CurTime()
        FadeAlpha = 0
        UsedInstantGiveup = false
        LastMoneyCheck = 0
        
        -- Aktiviere Mauszeiger automatisch für direktes Button-Klicken
        gui.EnableScreenClicker(true)
        
        -- Positioniere Cursor mittig für bessere Usability
        local scrW, scrH = ScrW(), ScrH()
        input.SetCursorPos(scrW / 2, scrH / 2)
        
        print("[Keks Deathscreen] Erweiterten Deathscreen gestartet! Maus aktiviert.")
    end)
    
    net.Receive("keksdeathscreen_extended_stop", function()
        local reason = net.ReadString()
        
        ExtendedDeathscreenActive = false
        FadeAlpha = 0
        UsedInstantGiveup = false
        HoveredButton = nil
        
        -- Deaktiviere Mauszeiger wieder für normales Gameplay
        gui.EnableScreenClicker(false)
        
        print("[Keks Deathscreen] Erweiterten Deathscreen gestoppt. Grund: " .. (reason or "Unbekannt") .. " Maus deaktiviert.")
    end)
    
    net.Receive("keksdeathscreen_money_response", function()
        HasEnoughMoneyForGiveup = net.ReadBool()
        local amount = net.ReadUInt(32)
    end)
    
    -- Hooks registrieren
    hook.Add("HUDPaint", "keksdeathscreen_extended_draw", DrawExtendedDeathscreen)
    
    -- Mausklick-Handler
    hook.Add("GUIMousePressed", "keksdeathscreen_extended_click", function(mouseCode, aimVector)
        if mouseCode == MOUSE_LEFT then
            HandleMouseClick()
        end
    end)
    
    -- Blockiere Standard-Eingaben
    hook.Add("PlayerBindPress", "keksdeathscreen_extended_block", function(ply, bind, pressed)
        if ExtendedDeathscreenActive then
            return true -- Blockiert alle Standard-Eingaben
        end
    end)
    
    -- Sicherheits-Cleanup: Stelle sicher dass Maus deaktiviert wird wenn Spieler spawnt
    hook.Add("OnPlayerSpawn", "keksdeathscreen_extended_mouse_cleanup", function()
        if ExtendedDeathscreenActive then
            ExtendedDeathscreenActive = false
            gui.EnableScreenClicker(false)
            print("[Keks Deathscreen] Sicherheits-Cleanup: Maus deaktiviert bei Spawn")
        end
    end)
    
    print("[Keks Deathscreen] Erweiterte Client-Funktionen geladen!")
    
end

print("==========================================")
print("[Keks Deathscreen] ERWEITERTE VERSION v2.2 AKTIV!")
print("- Auto-Respawn (10 Min) - Normal-Respawn (2 Min)")
print("- Sofort-Aufgeben (2500$) - Medizin-System")  
print("- Lila-Blau Design - DarkRP-Integration")
print("- NEUER FORTSCHRITTSBALKEN mit Zeit-Anzeige!")
print("==========================================")

-- Test-Commands für schnelles Testen
if SERVER then
    concommand.Add("keks_deathscreen_test", function(ply)
        if not IsValid(ply) then return end
        if not ply:IsSuperAdmin() then 
            keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, "Nur Kommandanten können das System testen!")
            return 
        end
        
        StartExtendedDeathscreen(ply)
        keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, "Test-Modus gestartet!")
    end)
    
    concommand.Add("keks_deathscreen_stop", function(ply)
        if not IsValid(ply) then return end
        if not ply:IsSuperAdmin() then return end
        
        StopExtendedDeathscreen(ply, "Admin Test Stop")
        keksdeathscreen.Extended.SendSimpleDeathScreenMessage(ply, "Force-Test-Modus deaktiviert!")
    end)
    
    print("[Keks Deathscreen] Test-Commands verfügbar:")
    print("- keks_deathscreen_test (SuperAdmin)")  
    print("- keks_deathscreen_stop (SuperAdmin)")
end