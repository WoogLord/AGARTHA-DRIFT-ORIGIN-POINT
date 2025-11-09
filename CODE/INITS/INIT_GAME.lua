-- INITIALIZATION FUNCTIONS
love.graphics.setDefaultFilter("nearest","nearest")

ScreenWidth, ScreenHeight = love.window.getDesktopDimensions()
WindWidth, WindHeight = ScreenWidth-math.floor(ScreenWidth*0.10),ScreenHeight-math.floor(ScreenHeight*0.10)

name = "Marc"
age = 26
isAlive = true
ADOPVersion = "AGARTHA:DRIFT-ORIGIN:POINT v0.0"
Font = love.graphics.newFont(20)
TestString="AGARTHA:DRIFT-ORIGIN:POINT, created by " .. name .. ", my age is " .. age .. " and I am " .. (isAlive and "Alive" or "Dead")

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
menuOptionsPaused = {"RESUME", "MAIN MENU", "QUIT"}
selOptionPause = 1

-- Sprite Sheet for Chess Pieces
spritesheetPieces = love.graphics.newImage("ASSETS/ART/SPRITESHEETS/SS_PLAYER_v0.0.png")
ssPiecesWidth, ssPiecesHeight = 32,32

-- make array later, also do looping through sprite sheet and have ids
playerIdle_ARR = {}
for i = 1, 4, 1 do
    playerIdle_ARR[i] = {love.graphics.newQuad(ssPiecesWidth*(i-1), 0, ssPiecesWidth, ssPiecesHeight, spritesheetPieces:getDimensions())}
end