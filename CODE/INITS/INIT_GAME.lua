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

--==+== UI ==+==--
VersionInfoString = ADOPVersion .. " - Made with " .. _VERSION
