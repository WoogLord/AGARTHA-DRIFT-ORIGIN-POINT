local dir = love.filesystem.getSourceBaseDirectory()
package.path = dir .. "/?.lua;" .. dir .. "/?/init.lua;" .. package.path

-- HELPERS
local toolFunctions require "CODE.HELPERS.TOOLS"

-- INITS folder
local initGame require "CODE.INITS.INIT_GAME"
local initStats require "CODE.INITS.INITIALIZE_STATS"
local initOverworld require "CODE.INITS.INIT_OVERWORLD"

-- DRAW folder
local uiFunctions require "CODE.DRAW.UI"
local drawFunctions require "CODE.DRAW.DRAW"

-- UPDATE folder
local inputFunctions require "CODE.UPDATE.INPUTS"
local audioManagerFunctions require "CODE.UPDATE.AUDIO_MANAGER"
local statsManagerFunctions require "CODE.UPDATE.STATS_MANAGER"
local overworldManagerFunctions require "CODE.UPDATE.OVERWORLD_MANAGER"
local battleManagerFunctions require "CODE.UPDATE.BATTLE_MANAGER"
local animManagerFunctions require "CODE.UPDATE.ANIM_MANAGER"
local inventoryManagerFunctions require "CODE.UPDATE.INVENTORY_MANAGER"

function love.load()
    musTitleLoadCutscene:setVolume(0.25)
    musTitleLoadCutscene:play()

    print("Screen Width: " .. ScreenWidth)
    print("Screen Height: " .. ScreenHeight)
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setMode(WindWidth, WindHeight)
    love.window.setFullscreen(isFullScreen)
    love.graphics.setFont(Font)

    initSpriteSheets()
    initEquipment()
    initParty()
    initEnemies()
    spawnEnemies()
end

function love.update(dt)
    love.timer.sleep(1/60)
    spriteTimer = spriteTimer + dt
    animTiming = math.ceil(spriteTimer*animStall % 4)
    
    updownFloating = math.sin(love.timer.getTime()) * 10

    if player.inBattle then battleManager(dt)
    else overworldManager() end

    if isInInventory then 
        playerInventX, playerInventY = (WindWidth / 3) - tileWH/2, (WindHeight / 2) - tileWH/2
        player.x, player.y = playerInventX, playerInventY
    elseif player.inBattle then
        player.x, player.y = currWindWidth / 4, currWindHeight / 2
    else
        player.x, player.y = (WindWidth / 2 + tileWH), (WindHeight / 2 + tileWH) 
    end
    speedManager(dt)
    musicManager()
    animStateMachine(player)
    doFloaters()
end

function love.draw()
    currWindWidth, currWindHeight = love.graphics.getDimensions()
    love.graphics.setColor(1,1,1)

    if CurrentState == "MainMenu" then drawMainMenu()
    elseif CurrentState == "Options" then drawOptionsMenu()
    elseif CurrentState == "Play" then
        if player.inBattle then drawBattle()
        elseif isInInventory then drawInventory()
        else drawOverworld() end
    end

    for i, f in ipairs(floater) do
        love.graphics.setColor(f.r, f.g, f.b)
        love.graphics.print(f.text, f.x, f.y, 0, graphicsScale, graphicsScale)
    end

    drawPaused()
    
    -- Debug stuff
    if isDebug then drawDebug() end

    -- VERSIONING
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(Font)
    love.graphics.print(VersionInfoString, 5, currWindHeight-5-Font:getHeight(VersionInfoString))
end
