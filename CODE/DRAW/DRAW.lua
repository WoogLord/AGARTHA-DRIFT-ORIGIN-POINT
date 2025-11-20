-- Draw States
function drawMainMenu()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(bgTitle,0,0,0,6,6)
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

function drawPlayer()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(spritesheetPlayer
        , CurrentAnimArray[animTiming]
        , player.x, player.y
        , 0
        , 3, 3
    )
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if player.isMechedUp then
            love.graphics.rectangle("fill", player.x - (ssWidth * graphicsScale)/3, player.y + (ssHeight * graphicsScale)+9, player.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", player.x - (ssWidth * graphicsScale)/3, player.y + (ssHeight * graphicsScale)+9, player.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", player.x - (ssWidth * graphicsScale)/3, player.y + (ssHeight * graphicsScale)+9, player.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", player.x - (ssWidth * graphicsScale)/3, player.y + (ssHeight * graphicsScale)+9, player.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
end

function drawAlly1()
    love.graphics.setColor(1, 0.5, 0.5)
    love.graphics.draw(spritesheetPlayer
        , CurrentAnimArray[animTiming]
        , ally1.x, ally1.y
        , 0
        , 3, 3
    )
    love.graphics.setColor(1,1,1)
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if ally1.isMechedUp then
            love.graphics.rectangle("fill", ally1.x - (ssWidth * graphicsScale)/3, ally1.y + (ssHeight * graphicsScale)+9, ally1.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally1.x - (ssWidth * graphicsScale)/3, ally1.y + (ssHeight * graphicsScale)+9, ally1.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", ally1.x - (ssWidth * graphicsScale)/3, ally1.y + (ssHeight * graphicsScale)+9, ally1.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally1.x - (ssWidth * graphicsScale)/3, ally1.y + (ssHeight * graphicsScale)+9, ally1.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
end

function drawAlly2()
    love.graphics.setColor(0.5, 0.5, 1)
    love.graphics.draw(spritesheetPlayer
        , CurrentAnimArray[animTiming]
        , ally2.x, ally2.y
        , 0
        , 3, 3
    )
    love.graphics.setColor(1,1,1)
    if player.inBattle then 
        -- currTurnCharge
        love.graphics.setColor(0.5, 0, 0.5)
        if ally2.isMechedUp then
            love.graphics.rectangle("fill", ally2.x - (ssWidth * graphicsScale)/3, ally2.y + (ssHeight * graphicsScale)+9, ally2.mech.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally2.x - (ssWidth * graphicsScale)/3, ally2.y + (ssHeight * graphicsScale)+9, ally2.mech.currentTurnCharge, 15)
        else
            love.graphics.rectangle("fill", ally2.x - (ssWidth * graphicsScale)/3, ally2.y + (ssHeight * graphicsScale)+9, ally2.pilot.maxTurnCharge, 15)
            love.graphics.setColor(0.75, 0 ,0.75)
            love.graphics.rectangle("fill", ally2.x - (ssWidth * graphicsScale)/3, ally2.y + (ssHeight * graphicsScale)+9, ally2.pilot.currentTurnCharge, 15)
        end
    end
    love.graphics.setColor(1,1,1)
end

function drawOverworld()
    -- draw ground
        -- camera needed here maybe
        -- so player now has mapX and mapY, we can just use player
        -- so we need an offset based off the center and scale of the tile set
    local mapOffsetX = ssWidth * (-1 * player.mapTileX * graphicsScale)
    local mapOffsetY = ssHeight * (-1 * player.mapTileY * graphicsScale)

    love.graphics.draw(tilemapGround_01
        ,mapOffsetX,mapOffsetY
        ,0,3,3)
    -- playerInitX, playerInitY
    -- draw colliders
    -- draw enemy
    love.graphics.draw(tilemapEnemies_01
        ,mapOffsetX,mapOffsetY
        ,0,3,3)
        
    drawPlayer()
    -- draw Foreground
end

function drawBattle()
    drawEnemies()
    drawPlayer()
    if ally1.inParty then drawAlly1() end
    if ally2.inParty then drawAlly2() end
    battleUI(ally1, player, ally2)
end

function drawEnemies()
    
end