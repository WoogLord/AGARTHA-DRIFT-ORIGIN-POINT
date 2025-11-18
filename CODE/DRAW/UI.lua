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
        if partyBattleArr[i] then
            local yOff = battleUIOffsetY * i
            if partyBattleArr[i].isMechedUp then
                love.graphics.setColor(0.7, 1, 0.7)
                love.graphics.printf("HP:"..partyBattleArr[i].mech.hp.."/"..partyBattleArr[i].mech.maxHP, 50, yOff, 400, "left") 
                love.graphics.setColor(1, 0.7, 0)
                love.graphics.printf("HP:"..partyBattleArr[i].mech.heat.."/"..partyBattleArr[i].mech.maxHeat, 50, 25 + yOff, 400, "left") 
            else 
                love.graphics.setColor(1, 0.5, 0.5)
                love.graphics.printf("HP:"..partyBattleArr[i].pilot.hp.."/"..partyBattleArr[i].pilot.maxHP, 50, yOff, 400, "left") 
                love.graphics.setColor(0.5, 0.5, 1)
                love.graphics.printf("HP:"..partyBattleArr[i].pilot.stamina.."/"..partyBattleArr[i].pilot.maxStam, 50, 25 + yOff, 400, "left") 
            end
        end        
    end
end