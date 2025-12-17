-- INITIALIZATION FUNCTIONS
love.graphics.setDefaultFilter("nearest","nearest")

ScreenWidth, ScreenHeight = love.window.getDesktopDimensions()
WindWidth, WindHeight = ScreenWidth-math.floor(ScreenWidth*0.10),ScreenHeight-math.floor(ScreenHeight*0.10)

creatorFirstName = "Marc"
age = 26
isAlive = true
ADOPVersion = "HYPERBOREA:ASCENDING v0.0"
Font = love.graphics.newFont(20)
bigFont = love.graphics.newFont(32)
TestString="HYPERBOREA:ASCENDING, created by " .. creatorFirstName .. ", my age is " .. age .. " and I am " .. (isAlive and "Alive" or "Dead")

--==+==-- "ints" --==+==--
spriteTimer = 0
updownFloating = 0
timerNoInput = 0
graphicsScale = 3
tileWH = 32
moveSpeedDampener = 0.40
playerInventX, playerInventY = (WindWidth / 3) - tileWH/2, (WindHeight / 2) - tileWH/2
animStall = 4

--==+==-- "floats" --==+==--
turnChargeReduction = 0.05
musicVolume = 0.2
alphaDecay = 1

--==+==-- strings --==+==--
CurrentState = "MainMenu"
PriorState = "MainMenu"
PriorStatePaused = "MainMenu"

--==+==-- bools --==+==--
isFullScreen = true
isDebug = false
isInInventory = false
playerTurn = false

--==+==-- needed arrays --==+==--
combatants = {}

--==+== AUDIO ==+==--
-- SFX
sfxTitleLogoVocal = love.audio.newSource("ASSETS/SFX/stupidSFXforMenu.mp3", "static")

-- MUSIC
musTitleLoadCutscene = love.audio.newSource("ASSETS/MUSIC/erm.mp3", "stream")
musTitleScreen = love.audio.newSource("ASSETS/MUSIC/marcs 1trillionth game.mp3", "stream")
musPlayGameDefault = love.audio.newSource("ASSETS/MUSIC/scaccus.mp3", "stream")
musBattle = love.audio.newSource("ASSETS/MUSIC/ASCEND.mp3", "stream")

musPlayGameDefault:setVolume(musicVolume) -- motherflipper, this only applies to that music source...

--==+== UI ==+==--
VersionInfoString = ADOPVersion .. " - Made with " .. _VERSION
logoTitle = love.graphics.newImage("ASSETS/ART/UI/LOGO_TITLE_v0.0.png")
bgTitle = love.graphics.newImage("ASSETS/ART/UI/BACKGROUND_TITLE_v0.0.png")

-- paused
menuOptionsMain = {"PLAY", "OPTIONS", "QUIT"}
menuOptionsPaused = {"RESUME", "MAIN MENU", "QUIT"}
menuOptionsOptions = {"MUSIC VOLUME", "MAIN MENU"}
selOptionMain = 1
selOptionPause = 1
selOptionOptions = 1

function initSpriteSheets()
    -- Sprite Sheet for all Characters (loop? maybe an array)
    spritesheetPlayer = love.graphics.newImage("ASSETS/ART/SPRITESHEETS/SS_PLAYER_v0.1.png")
    ssPilot_ALL_Nothing = love.graphics.newImage("ASSETS/ART/SPRITESHEETS/PILOT_MASTER-SS-NothingRef_v0.1.png")
    -- spritesheetAnthony
    -- spritesheetAlfred

    ssEquipmentIcons = love.graphics.newImage("ASSETS/ART/SPRITESHEETS/EQUIPMENT_ICONS.png")
    equipmentIconQuads = {}
    eIconX, eIconY = ssEquipmentIcons:getDimensions()
    for i=1, (eIconX / tileWH), 1 do
        equipmentIconQuads[i] = {}
        for j=1, (eIconY / tileWH), 1 do
            equipmentIconQuads[i][j] = love.graphics.newQuad((i-1)*tileWH ,(j-1)*tileWH, tileWH, tileWH, ssEquipmentIcons:getDimensions())
        end
    end

    ssAbilityIcons = love.graphics.newImage("ASSETS/ART/SPRITESHEETS/ABILITY_ICONS.png")
    abilityIconQuads = {}
    aIconX, aIconY = ssAbilityIcons:getDimensions()
    for k=1, (aIconX / tileWH), 1 do
        abilityIconQuads[k] = {}
        for l=1, (aIconY / tileWH), 1 do
            abilityIconQuads[k][l] = love.graphics.newQuad((k-1)*tileWH ,(l-1)*tileWH, tileWH, tileWH, ssAbilityIcons:getDimensions())
        end
    end

    -- Tilemaps
    tilemapSubGround_01 = love.graphics.newImage("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-SUBGROUND.png")
    tilemapGround_01 = love.graphics.newImage("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-GROUND.png")
    tilemapGround_01_ImageData = love.image.newImageData("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-GROUND.png")
    -- tilemapGroundFluff_01
    -- tilemapColliders_01
    tilemapEnemies_01 = love.graphics.newImage("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-ENEMY_SPAWNS.png")
    encounterHitbox = love.graphics.newQuad(0, 0, tileWH, tileWH, tilemapEnemies_01:getDimensions())
    tilemapEnemies_01_ImageData = love.image.newImageData("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-ENEMY_SPAWNS.png")
    -- targetEnemyTile_ImageData = love.image.newImageData(32,32,tilemapEnemies_01_ImageData)
end

overworldEnemies = {}