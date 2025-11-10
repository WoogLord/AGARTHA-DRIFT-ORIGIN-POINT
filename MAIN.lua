local dir = love.filesystem.getSourceBaseDirectory()
package.path = dir .. "/?.lua;" .. dir .. "/?/init.lua;" .. package.path


local initGame require "CODE.INITS.INIT_GAME"
local initStats require "CODE.INITS.INITIALIZE_STATS"
local uiFunctions require "CODE.DRAW.UI"
local drawFunctions require "CODE.DRAW.DRAW"
local inputFunctions require "CODE.UPDATE.INPUTS"
local cameraFunctions require "CODE.UPDATE.CAMERA"

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

    -- Make a stats updater
    if player_ARR.isMechedUp then
        moveSpeed = player_ARR.mech.moveSpeed * dt
    else
        moveSpeed = player_ARR.pilot.moveSpeed * dt
    end

    -- Shove this into an audio manager later
    if CurrentState == "MainMenu" then
        if not musTitleLoadCutscene:isPlaying() then
            if not musTitleScreen:isPlaying() then
                sfxTitleLogoVocal:play()
                musTitleScreen:play()
            end
        end
    elseif CurrentState == "Play" then
        playerControls()
        if not musPlayGameDefault:isPlaying() then
            musTitleScreen:stop()
            musTitleLoadCutscene:stop()
            musPlayGameDefault:play()
        end
    end
end

function love.draw()
    currWindWidth, currWindHeight = love.graphics.getDimensions()
    love.graphics.setColor(1,1,1)
    if CurrentState == "MainMenu" then
        drawMainMenu()  
    elseif CurrentState == "Play" then
        drawPlayer()
    end
    love.graphics.print(TestString, 5, currWindHeight-25-Font:getHeight(VersionInfoString))
    love.graphics.print(VersionInfoString, 5, currWindHeight-5-Font:getHeight(VersionInfoString))
    drawPaused()
end