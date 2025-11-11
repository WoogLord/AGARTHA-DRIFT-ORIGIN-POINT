local dir = love.filesystem.getSourceBaseDirectory()
package.path = dir .. "/?.lua;" .. dir .. "/?/init.lua;" .. package.path

-- INITS folder
local initGame require "CODE.INITS.INIT_GAME"
local initStats require "CODE.INITS.INITIALIZE_STATS"

-- DRAW folder
local uiFunctions require "CODE.DRAW.UI"
local drawFunctions require "CODE.DRAW.DRAW"

-- UPDATE folder
local inputFunctions require "CODE.UPDATE.INPUTS"
local cameraFunctions require "CODE.UPDATE.CAMERA"
local audioManagerFunctions require "CODE.UPDATE.AUDIO_MANAGER"
local statsManagerFunctions require "CODE.UPDATE.STATS_MANAGER"

function love.load()
    musTitleLoadCutscene:setVolume(0.25)
    musTitleLoadCutscene:play()

    print("Screen Width: " .. ScreenWidth)
    print("Screen Height: " .. ScreenHeight)
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setMode(WindWidth, WindHeight)
    love.window.setFullscreen(isFullScreen)
    love.graphics.setFont(Font)

    initParty()
end

function love.update(dt)
    love.timer.sleep(1/60)
    spriteTimer=spriteTimer + dt
    animTiming = math.ceil(spriteTimer % 4)
    print(animTiming)
    
    updownFloating = math.sin(love.timer.getTime()) * 10

    if player_ARR.isMechedUp then
        moveSpeed = player_ARR.mech.moveSpeed * dt
    else
        moveSpeed = player_ARR.pilot.moveSpeed * dt
    end

    musicManager()
    
end

function love.draw()
    currWindWidth, currWindHeight = love.graphics.getDimensions()
    love.graphics.setColor(1,1,1)
    if CurrentState == "MainMenu" then
        drawMainMenu()  
    elseif CurrentState == "Play" then
        drawPlayer()
    end
    drawPaused()
    
    -- Debug stuff
    love.graphics.print(TestString, 5, currWindHeight-25-Font:getHeight(VersionInfoString))
    love.graphics.print(VersionInfoString, 5, currWindHeight-5-Font:getHeight(VersionInfoString))
end
