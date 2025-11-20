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

--==+== AUDIO ==+==--
-- SFX
sfxTitleLogoVocal = love.audio.newSource("ASSETS/SFX/stupidSFXforMenu.mp3", "static")

-- MUSIC
musTitleLoadCutscene = love.audio.newSource("ASSETS/MUSIC/erm.mp3", "stream")
musTitleScreen = love.audio.newSource("ASSETS/MUSIC/marcs 1trillionth game.mp3", "stream")
musPlayGameDefault = love.audio.newSource("ASSETS/MUSIC/scaccus.mp3", "stream")

musPlayGameDefault:setVolume(.5)

--==+==-- "ints" --==+==--
spriteTimer = 0
updownFloating = 0
timerNoInput = 0
graphicsScale = 3
ssWidth, ssHeight = 32,32

--==+==-- "floats" --==+==--
turnChargeReduction = 0.05

--==+==-- strings --==+==--
CurrentState = "MainMenu"
PriorState = ""
PriorStatePaused = ""

--==+==-- bools --==+==--
isFullScreen = true
isDebug = false

--==+== UI ==+==--
VersionInfoString = ADOPVersion .. " - Made with " .. _VERSION
logoTitle = love.graphics.newImage("ASSETS/ART/UI/LOGO_TITLE_v0.0.png")
bgTitle = love.graphics.newImage("ASSETS/ART/UI/BACKGROUND_TITLE_v0.0.png")

-- paused
menuOptionsMain = {"PLAY", "OPTIONS", "QUIT"}
menuOptionsPaused = {"RESUME", "MAIN MENU", "QUIT"}
selOptionMain = 1
selOptionPause = 1

-- Sprite Sheet for all Characters (loop? maybe an array)
spritesheetPlayer = love.graphics.newImage("ASSETS/ART/SPRITESHEETS/SS_PLAYER_v0.1.png")
-- spritesheetAnthony
-- spritesheetAlfred

-- Tilemaps
tilemapGround_01 = love.graphics.newImage("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-GROUND.png")
tilemapGround_01_ImageData = love.image.newImageData("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-GROUND.png")
-- tilemapGroundFluff_01
-- tilemapColliders_01
tilemapEnemies_01 = love.graphics.newImage("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-ENEMY_SPAWNS.png")
encounterHitbox = love.graphics.newQuad(0, 0, ssWidth, ssHeight, tilemapEnemies_01:getDimensions())
tilemapEnemies_01_ImageData = love.image.newImageData("ASSETS/ART/TILEMAPS/TILEMAP_MASTER-ENEMY_SPAWNS.png")
-- targetEnemyTile_ImageData = love.image.newImageData(32,32,tilemapEnemies_01_ImageData)

overworldEnemies = {}