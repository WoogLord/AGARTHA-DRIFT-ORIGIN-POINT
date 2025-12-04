-- UI

-- BUTTON DECS
buttonsMainMenu = {
    play = {x = 100, y = 150, w = 200, h = 50, label = "PLAY"}
    , settings = {x = 100, y = 250, w = 200, h = 50, label = "SETTINGS"}
    , quit = {x = 100, y = 350, w = 200, h = 50, label = "QUIT"}
    , collection = {x = 100, y = 450, w = 200, h = 50, label = "COLLECTION"}
    , languages = {x = 100, y = 550, w = 200, h = 50, label = "ENGLISH"}
    , profile = {x = 100, y = 650, w = 200, h = 50, label = "P1"}
    , discord = {x = 100, y = 750, w = 200, h = 50, label = "DISCORD"}
}
buttonsSettings = {
    back = {x = 100, y = 150, w = 200, h = 50, label = "BACK", r=200, g=0, b=0}
}

buttonsInventory = {}
for i=1, 36, 1 do
    buttonsInventory[i] = {
          x = (WindWidth / 3 * 2) + ((i % 6) * tileWH * graphicsScale) + (12 * (i % 6))
        , y = (WindHeight / 4) + ((math.ceil(i / 6) - 1) * tileWH * graphicsScale) + (12 * (math.ceil(i / 6) - 1))
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale
        , r = 0.1, b = 0.1, g = 0.1
        , label = ""
    }
end

function drawButton(button)
    if button.r then 
        love.graphics.setColor(button.r,button.b,button.g)
    else 
        love.graphics.setColor(0.5,0.5,0.5)
    end
    love.graphics.rectangle("fill",button.x, button.y, button.w, button.h)
    love.graphics.setColor(1,1,1)
    love.graphics.printf(button.label, button.x, button.y + button.h /3, button.w, "center")
end

function battleUI(_party1, _party2, _party3, _enemy1, _enemy2, _enemy3)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", 0, 0, currWindWidth, 200)
    
    partyBattleArr = {_party1, _party2, _party3}
    battleUIOffsetY = 50

    for i=1,#partyBattleArr, 1 do
        local yOff = (battleUIOffsetY * i) - 30
        if partyBattleArr[i].inParty then
            if partyBattleArr[i].isMechedUp then
                -- name
                love.graphics.setColor(1, 1, 1)
                love.graphics.printf("[M]-"..partyBattleArr[i].name, 25, yOff, 400, "left")
                -- hp
                love.graphics.setColor(0.7, 1, 0.7)
                love.graphics.printf("HP:"..partyBattleArr[i].mech.hp.."/"..partyBattleArr[i].mech.maxHP, 50, yOff, 400, "right")
                -- mana
                love.graphics.setColor(1, 0.7, 0)
                love.graphics.printf("Heat:"..partyBattleArr[i].mech.heat.."/"..partyBattleArr[i].mech.maxHeat, 50, 25 + yOff, 400, "right") 
            else 
                -- name
                love.graphics.setColor(1, 1, 1)
                love.graphics.printf("[P]-"..partyBattleArr[i].name, 25, yOff, 400, "left")
                -- hp
                love.graphics.setColor(1, 0.5, 0.5)
                love.graphics.printf("HP:"..partyBattleArr[i].pilot.hp.."/"..partyBattleArr[i].pilot.maxHP, 50, yOff, 400, "right")
                -- mana
                love.graphics.setColor(0.5, 0.5, 1)
                love.graphics.printf("Stamina:"..partyBattleArr[i].pilot.stamina.."/"..partyBattleArr[i].pilot.maxStam, 50, 25 + yOff, 400, "right") 
            end
        end        
    end
end

function inventoryUI()
    for i=1, #buttonsInventory, 1 do
        drawButton(buttonsInventory[i])
    end
end