-- Draw States

function drawPilotParts(_equipmentArray, _facingDirection, _x, _y, _scaleFactor)
        if _facingDirection == "Up" then
        
    elseif _facingDirection == "Left" then

    elseif _facingDirection == "Down" then

    elseif _facingDirection == "Right" then

    end
end

function drawMechParts(_equipmentArray, _facingDirection)

end

function drawMainMenu()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(bgTitle,0,0,0,graphicsScale*2,graphicsScale*2)
    -- have the scale factor be establi shed globally to handle resizing

    -- loop this
    -- for i, button in pairs(buttonsMainMenu) do
    --     drawButton(button)
    -- end

    love.graphics.setFont(bigFont)
    for i, option in ipairs(menuOptionsMain) do
        if i == selOptionMain then
            love.graphics.setColor(1, 0, 0)  -- Highlight selected option in red
        else
            love.graphics.setColor(1, 1, 1)  -- Normal color
        end
        -- are things not centered?  check here lol, fix #option
        love.graphics.print(option, currWindWidth / 2 - (#option * 10), currWindHeight / 2 + (i - 1) * 40)
    end     
    love.graphics.setColor(1, 1, 1)
    
    love.graphics.draw(logoTitle
        , currWindWidth / 2 - (3 * logoTitle:getWidth()) / 2
        , currWindHeight/2 - (3 *logoTitle:getHeight())-50 + updownFloating
        , 0
        , 3, 3)

end

function drawPaused()
    if isPaused == true then
        love.graphics.setColor(0, 0, 0, 0.65)
        love.graphics.rectangle("fill", 0, 0, currWindWidth, currWindHeight)

        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(Font)
        for i, option in ipairs(menuOptionsPaused) do
            if i == selOptionPause then
                love.graphics.setColor(1, 0, 0)  -- Highlight selected option in red
            else
                love.graphics.setColor(1, 1, 1)  -- Normal color
            end
            -- are things not centered?  check here lol, fix #option
            love.graphics.print(option, currWindWidth / 2 - (#option * 8), currWindHeight / 2 + (i - 1) * 40)
        end        
    end
end

function drawPlayer(_scaleFactor)
    love.graphics.setColor(1,1,1)
    _scaleFactor = _scaleFactor or 1
    playerScale = graphicsScale * _scaleFactor
    if player.isMechedUp then
        drawMechParts(player.mech.equipment, player.facingDirection, player.x, player.y, playerScale)
    else
        drawPilotParts(player.pilot.equipment, player.facingDirection, player.x, player.y, playerScale)
        love.graphics.draw(ssPilot_ALL_Nothing, player.CurrentAnimArray[animTiming], player.x, player.y, 0, playerScale, playerScale)
    end
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if player.isMechedUp then
            love.graphics.rectangle("fill", player.x - (tileWH * graphicsScale)/3, player.y + (tileWH * graphicsScale)+9, player.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", player.x - (tileWH * graphicsScale)/3, player.y + (tileWH * graphicsScale)+9, player.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", player.x - (tileWH * graphicsScale)/3, player.y + (tileWH * graphicsScale)+9, player.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", player.x - (tileWH * graphicsScale)/3, player.y + (tileWH * graphicsScale)+9, player.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
end

function drawAlly1()
    love.graphics.setColor(1, 0.5, 0.5)
    love.graphics.draw(spritesheetPlayer
        , player.CurrentAnimArray[animTiming]
        , ally1.x, ally1.y
        , 0
        , 3, 3
    )
    love.graphics.setColor(1,1,1)
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if ally1.isMechedUp then
            love.graphics.rectangle("fill", ally1.x - (tileWH * graphicsScale)/3, ally1.y + (tileWH * graphicsScale)+9, ally1.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally1.x - (tileWH * graphicsScale)/3, ally1.y + (tileWH * graphicsScale)+9, ally1.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", ally1.x - (tileWH * graphicsScale)/3, ally1.y + (tileWH * graphicsScale)+9, ally1.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally1.x - (tileWH * graphicsScale)/3, ally1.y + (tileWH * graphicsScale)+9, ally1.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
end

function drawAlly2()
    love.graphics.setColor(0.5, 0.5, 1)
    love.graphics.draw(spritesheetPlayer
        , player.CurrentAnimArray[animTiming]
        , ally2.x, ally2.y
        , 0
        , 3, 3
    )
    love.graphics.setColor(1,1,1)
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if ally2.isMechedUp then
            love.graphics.rectangle("fill", ally2.x - (tileWH * graphicsScale)/3, ally2.y + (tileWH * graphicsScale)+9, ally2.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally2.x - (tileWH * graphicsScale)/3, ally2.y + (tileWH * graphicsScale)+9, ally2.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", ally2.x - (tileWH * graphicsScale)/3, ally2.y + (tileWH * graphicsScale)+9, ally2.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally2.x - (tileWH * graphicsScale)/3, ally2.y + (tileWH * graphicsScale)+9, ally2.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
end

function drawOverworld()
    -- draw ground
        -- camera needed here maybe
        -- so player now has mapX and mapY, we can just use player
        -- so we need an offset based off the center and scale of the tile set
    -- local mapX, mapY = tilemapGround_01:getDimensions()
    local mapOffsetX = tileWH * graphicsScale * (-1 * player.mapTileX)
    local mapOffsetY = tileWH * graphicsScale * (-1 * player.mapTileY)
    local drawnMapOffsetX = mapOffsetX + player.x
    local drawnMapOffsetY = mapOffsetY + player.y
    
    love.graphics.draw(tilemapSubGround_01, drawnMapOffsetX, drawnMapOffsetY, 0 , graphicsScale, graphicsScale)
    love.graphics.draw(tilemapGround_01, drawnMapOffsetX, drawnMapOffsetY, 0 , graphicsScale, graphicsScale)
    -- playerInitX, playerInitY
    -- draw colliders
    -- draw enemy
    love.graphics.draw(tilemapEnemies_01, drawnMapOffsetX, drawnMapOffsetY, 0 , graphicsScale, graphicsScale)
    
    ghostParticles = {}

    -- table.insert(ghostParticles)
    if alphaDecay > 0 then    
        alphaDecay = math.max(alphaDecay - (spriteTimer / 128), 0)
        love.graphics.setColor(1,1,1,alphaDecay)
        love.graphics.rectangle("fill", overworldEnemies[4].x * math.sin(spriteTimer / 4), overworldEnemies[4].y, 12, 12, 15)
    end

    drawPlayer()
    -- draw Foreground
end

function drawBattle()
    -- draw far bg
    -- draw all parallaxables below here (including 2nd bg)

    -- ALSO SCALE PLAYERS/ENEMIES LINEARLY BY SCREEN POSITIONING FOR DEPTH
    drawEnemies()
    drawPlayer()
    if ally1.inParty then drawAlly1() end
    if ally2.inParty then drawAlly2() end
    battleUI(ally1, player, ally2, enemy_01)
end

function drawEnemies()
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.draw(spritesheetPlayer
        , player.CurrentAnimArray[animTiming]
        , enemy_01.x, enemy_01.y
        , 0
        , 3, 3
    )
    love.graphics.setColor(1,1,1)
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if enemy_01.isMechedUp then
            love.graphics.rectangle("fill", enemy_01.x - (tileWH * graphicsScale)/3, enemy_01.y + (tileWH * graphicsScale)+9, enemy_01.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", enemy_01.x - (tileWH * graphicsScale)/3, enemy_01.y + (tileWH * graphicsScale)+9, enemy_01.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", enemy_01.x - (tileWH * graphicsScale)/3, enemy_01.y + (tileWH * graphicsScale)+9, enemy_01.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", enemy_01.x - (tileWH * graphicsScale)/3, enemy_01.y + (tileWH * graphicsScale)+9, enemy_01.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
    
end

function drawInventory()
    drawPlayer(2)
    inventoryUI()
    -- drawHeldItem
    if heldItem then
        local mx, my = love.mouse.getPosition()
        if heldItem.equipmentType == "gloves" then
            love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[heldItem.equipmentID][9]
                , mx - (tileWH * graphicsScale * 0.5), my - (tileWH * graphicsScale * 0.5), 0, graphicsScale, graphicsScale)
        end
    end
end

function drawOptionsMenu()
    love.graphics.setFont(bigFont)
    for i, option in ipairs(menuOptionsOptions) do
        if i == selOptionOptions then love.graphics.setColor(0, 0, 1) else love.graphics.setColor(1, 1, 1) end
        love.graphics.print(option, currWindWidth / 2 - (#option * 10), currWindHeight / 2 + (i - 1) * 40)
    end
    for j=1, 20, 1 do 
        if math.floor(musicVolume*20) == j then love.graphics.setColor(0, 0, 1) else love.graphics.setColor(1, 1, 1) end
        love.graphics.rectangle("fill", currWindWidth / 2 + (#menuOptionsOptions[1] * 10) + (j*12), currWindHeight / 2 + 15, 6, 6)
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(musicVolume*100, currWindWidth / 2 + (#menuOptionsOptions[1] * 10) + 250, currWindHeight / 2)
end

function drawDebug()
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(Font)
    love.graphics.print(TestString, 5, currWindHeight-25-Font:getHeight(VersionInfoString))
    love.graphics.print("Player.x,.y: "..player.x..", "..player.y, 5, currWindHeight-45-Font:getHeight(VersionInfoString))
    love.graphics.print("Player.mapTileX,.mapTileY: "..player.mapTileX..", "..player.mapTileY, 5, currWindHeight-65-Font:getHeight(VersionInfoString))
    love.graphics.print("overworldEnemies[4].x,.y: "..overworldEnemies[enemyTestIndex].x..", "..overworldEnemies[enemyTestIndex].y, 5, currWindHeight-85-Font:getHeight(VersionInfoString))
    love.graphics.print("overworldEnemies[4].mapTileX,.mapTileY: "..overworldEnemies[enemyTestIndex].mapTileX..", "..overworldEnemies[enemyTestIndex].mapTileY, 5, currWindHeight-105-Font:getHeight(VersionInfoString))
    local debugTarget = ""
    if currentTarget == nil then debugTarget = "" else debugTarget = currentTarget.name end
    love.graphics.print("currentTarget: "..debugTarget, 5, currWindHeight-125-Font:getHeight(VersionInfoString))
end