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
buttonHealToFullInventory = {x = 100, y = 150, w = 200, h = 50, r = 0.1, b = 0.1, g = 0.1, label = "HEAL 2 FULL"}
buttonsEquipmentInventoryPilot = {
      head = 
        {x = playerInventX + (tileWH * graphicsScale * 0.5), y = playerInventY - (tileWH * graphicsScale * 2.1)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , back = 
        {x = playerInventX - (tileWH * graphicsScale * 0.6), y = playerInventY - (tileWH * graphicsScale * 1.9)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , shoulders = 
        {x = playerInventX + (tileWH * graphicsScale * 1.6), y = playerInventY - (tileWH * graphicsScale * 1.9)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , chest = 
        {x = playerInventX + (tileWH * graphicsScale * 0.5), y = playerInventY - (tileWH * graphicsScale * 1.0)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , rightArm = 
        {x = playerInventX - (tileWH * graphicsScale * 0.8), y = playerInventY - (tileWH * graphicsScale * 0.8)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , leftArm = 
        {x = playerInventX + (tileWH * graphicsScale * 1.8), y = playerInventY - (tileWH * graphicsScale * 0.8)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , rightWeapon = 
        {x = playerInventX - (tileWH * graphicsScale * 1.9), y = playerInventY - (tileWH * graphicsScale * 0.8)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , leftWeapon = 
        {x = playerInventX + (tileWH * graphicsScale * 2.9), y = playerInventY - (tileWH * graphicsScale * 0.8)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , gloves = 
        {x = playerInventX - (tileWH * graphicsScale * 1.1), y = playerInventY + (tileWH * graphicsScale * 0.3)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , pants = 
        {x = playerInventX + (tileWH * graphicsScale * 2.1), y = playerInventY + (tileWH * graphicsScale * 0.3)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , rightLeg = 
        {x = playerInventX - (tileWH * graphicsScale * 0.9), y = playerInventY + (tileWH * graphicsScale * 1.5)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , leftLeg = 
        {x = playerInventX + (tileWH * graphicsScale * 1.9), y = playerInventY + (tileWH * graphicsScale * 1.5)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
    , boots = 
        {x = playerInventX + (tileWH * graphicsScale * 0.5), y = playerInventY + (tileWH * graphicsScale * 2.1)
        , w = tileWH * graphicsScale, h = tileWH * graphicsScale, r = 0.1, b = 0.1, g = 0.1, label = ""}
}

function drawButton(_button)
    if _button.r then
        love.graphics.setColor(_button.r,_button.b,_button.g)
    else 
        love.graphics.setColor(0.5,0.5,0.5)
    end
    if _button.invis then love.graphics.setColor(0,0,0,0) end
    love.graphics.rectangle("fill",_button.x, _button.y, _button.w, _button.h)
    love.graphics.setColor(1,1,1)
    if _button.invis then else love.graphics.printf(_button.label, _button.x, _button.y + _button.h /3, _button.w, "center") end
end

function addFloater(_number, _target, _r, _g, _b)
    local floaterX, floaterY = _target.x, _target.y
    table.insert(floater, {
          text = _number
        , x = floaterX, y = floaterY
        , r = _r, g = _g, b = _b
        , targetY = floaterY - (10 * graphicsScale)
        , time = 0
    })
    love.graphics.print(_number, floaterX, floaterY, 0, graphicsScale, graphicsScale)
end

function doFloaters()
    for i, f in ipairs(floater) do
        f.y = f.y + ((f.targetY-f.y) / (10 * graphicsScale))
        f.time = f.time + 1
        if f.time > 60 then
            table.remove(floater, i)
        end
    end
end

function battleUI(_party1, _party2, _party3, _enemy1, _enemy2, _enemy3)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", 0, 0, currWindWidth, 200)
    
    partyBattleArr = {_party1, _party2, _party3}
    enemyBattleArr = {_enemy1, _enemy2, _enemy3}
    battleUIOffsetY = 50

    for i=1,#partyBattleArr, 1 do
        local yOff = (battleUIOffsetY * i) - 30
        local unit = partyBattleArr[i]
        local stats = (unit.inParty and unit.isMechedUp) and unit.mech or unit.pilot
        local tFocusName = unit.isMechedUp and "Heat" or "Stamina"
        local tInMech = unit.isMechedUp and "M" or "P"
        -- name
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("["..tInMech.."]-"..unit.name, 25, yOff, 400, "left")
        -- hp
        if unit.isMechedUp then love.graphics.setColor(0.7, 1, 0.7) else love.graphics.setColor(1, 0.5, 0.5) end
        love.graphics.printf("HP:"..stats.hp.."/"..stats.maxHP, 50, yOff, 400, "right")
        -- mana
        if unit.isMechedUp then love.graphics.setColor(1, 0.7, 0) else love.graphics.setColor(0.5, 0.5, 1) end
        love.graphics.printf(tFocusName..":"..stats.focus.."/"..stats.maxFocus, 50, 25 + yOff, 400, "right")     
    end
    for i=1,#enemyBattleArr, 1 do
        local yOff = (battleUIOffsetY * i) - 30
        local unit = enemyBattleArr[i]
        local stats = (unit.inBattle and unit.isMechedUp) and unit.mech or unit.pilot
        local tFocusName = unit.isMechedUp and "Heat" or "Stamina"
        local tInMech = unit.isMechedUp and "M" or "P"
        -- name
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("["..tInMech.."]-"..unit.name, currWindWidth - 425, yOff, 400, "left")
        -- hp
        if unit.isMechedUp then love.graphics.setColor(0.7, 1, 0.7) else love.graphics.setColor(1, 0.5, 0.5) end
        love.graphics.printf("HP:"..stats.hp.."/"..stats.maxHP, currWindWidth - 450, yOff, 400, "right")
        -- mana
        if unit.isMechedUp then love.graphics.setColor(1, 0.7, 0) else love.graphics.setColor(0.5, 0.5, 1) end
        love.graphics.printf(tFocusName..":"..stats.focus.."/"..stats.maxFocus, currWindWidth - 450, 25 + yOff, 400, "right")     
    end

    -- draw buttons for all combatants
    targetButtons = {}
    abilityButtons = {}
    if battleState == battleState_ARR.allyTurnMenu then
        for i=1, #combatants do
            -- dont use tileWH here, use the collision hitbox when i make that
            if combatants[i] == currentTarget then
                -- draw abilities
                local stats = activeUnit.isMechedUp and activeUnit.mech or activeUnit.pilot
                for a=1, #stats.abilities do
                    local abilX = (tileWH * 0.5) + currentTarget.x + (math.cos(math.rad(a * 365 / 8)) * (tileWH + 2) * graphicsScale)
                    local abilY = (tileWH * 0.5) + currentTarget.y - (math.sin(math.rad(a * 365 / 8)) * (tileWH + 2) * graphicsScale)
                    local abilScale = 2
                    local abilityDescriptionString = tostring(bigAbilityArray.vanityNames[stats.abilities[a].abilityID]).." (CD: "..tostring(bigAbilityArray.stats.cooldown[stats.abilities[a].abilityID])..")"
                        .."\nFocus Cost:"..tostring(bigAbilityArray.stats.focusCostBase[stats.abilities[a].abilityID])
                        .."\n"..tostring(bigAbilityArray.description[stats.abilities[a].abilityID])
                    local tIsAbilityActive = true
                    love.graphics.setColor(0.5,0.5,0.5,0.25) 
                    love.graphics.rectangle("fill", abilX, abilY, (tileWH+2) * abilScale, (tileWH+2) * abilScale)

                    -- currentTarget checks
                    -- enemies
                    if (currentTarget == enemy_01 or currentTarget == enemy_02 or currentTarget == enemy_03) and bigAbilityArray.stats.targets[stats.abilities[a].abilityID] == "Enemies" then
                    -- allies
                    elseif (currentTarget == player or currentTarget == ally1 or currentTarget == ally2) and bigAbilityArray.stats.targets[stats.abilities[a].abilityID] == "Allies" then
                    -- self
                    elseif currentTarget == activeUnit and bigAbilityArray.stats.targets[stats.abilities[a].abilityID] == "Self" then
                    else tIsAbilityActive = false end

                    if (bigAbilityArray.stats.focusCostBase[stats.abilities[a].abilityID] 
                        + (bigAbilityArray.stats.focusCostPer[stats.abilities[a].abilityID] * stats.abilities[a].abilityLevel)) > stats.focus then
                        abilityDescriptionString = abilityDescriptionString.."\n".."NOT ENOUGH FOCUS" -- dont know how i feel about this
                        tIsAbilityActive = false
                        love.graphics.setColor(0.1,0.1,0.1)
                    elseif tIsAbilityActive then 
                        love.graphics.setColor(1,1,1)
                    else
                        love.graphics.setColor(0.1,0.1,0.1) 
                        abilityDescriptionString = abilityDescriptionString.."\n".."NOT APPLICABLE TARGET" -- dont know how i feel about this
                    end


                    -- Check for no ability assigned
                    if stats.abilities[a].abilityID == 1 then
                        -- don't draw an icon
                    else
                        love.graphics.draw(ssAbilityIcons, abilityIconQuads[stats.abilities[a].abilityID % 10][math.floor(stats.abilities[a].abilityID / 10) + 1]
                            , abilX, abilY, 0, 2, 2
                        )
                    end

                    abilityButtons[a] = {x = abilX, y = abilY, w = tileWH * abilScale, h = tileWH * abilScale, label = stats.abilities[a].abilityID, invis = true, isAbilityActive = tIsAbilityActive}
                    drawButton(abilityButtons[a])
                    if isMouseOverButton(abilityButtons[a]) then
                        -- draw descriptions
                        love.graphics.printf(abilityDescriptionString
                            , abilityButtons[a].x
                            , abilityButtons[a].y + (((tileWH * abilScale) - Font:getHeight(tostring(bigAbilityArray.vanityNames[stats.abilities[a].abilityID]))) * 0.5)
                            , 200, "left")
                    end
                end
                love.graphics.setColor(0,0,1.0,0.25)    
            else
                love.graphics.setColor(1.0,0,0,0.25)
            end
            love.graphics.rectangle("fill", combatants[i].x, combatants[i].y, tileWH * graphicsScale, tileWH * graphicsScale)
            targetButtons[i] = {x = combatants[i].x, y = combatants[i].y, w = tileWH * graphicsScale, h = tileWH * graphicsScale, label = "", invis = true}
            drawButton(targetButtons[i])
            if isMouseOverButton(targetButtons[i]) then
                -- draw descriptions
                love.graphics.printf(tostring(combatants[i].name).."\nLv: "..tostring(combatants[i].pilot.level), targetButtons[i].x
                    , targetButtons[i].y + (((tileWH * graphicsScale) - Font:getHeight(tostring(combatants[i].name))) * 0.5)
                    , tileWH * graphicsScale, "center")
            end
        end
    end
end

function inventoryUI()
    love.graphics.setColor(1, 1, 1)
    local pPE = player.pilot.equipment
    local stats = player.isMechedUp and player.mech or player.pilot
    -- draw bg art here

    -- healToFull button
    drawButton(buttonHealToFullInventory)

    -- titles
    love.graphics.print("EQUIPMENT", playerInventX + (tileWH * graphicsScale * 0.4), playerInventY - (currWindHeight / 4))
    love.graphics.print("INVENTORY", (WindWidth / 3 * 2) + (tileWH * graphicsScale * 2.6), playerInventY - (currWindHeight / 4))

    -- draw inventory
    for i=1, #buttonsInventory, 1 do
        drawButton(buttonsInventory[i])
        -- draw inventory icons
        -- ssEquipmentIcons
        if inventoryArray[i].equipmentIndex == 0 or inventoryArray[i].equipmentID == 0 then
            -- print("Error?!, no id or equipmentIndex to be rendered")
        else
            -- print(inventoryArray[i].equipmentIndex)
            -- print(inventoryArray[i].equipmentID) 
            love.graphics.draw(ssEquipmentIcons
                , equipmentIconQuads[inventoryArray[i].equipmentID][inventoryArray[i].equipmentIndex]
            , buttonsInventory[i].x, buttonsInventory[i].y, 0, graphicsScale, graphicsScale)
        end
    end

    -- draw equips Inventory
    drawButton(buttonsEquipmentInventoryPilot.head)
    drawButton(buttonsEquipmentInventoryPilot.back)
    drawButton(buttonsEquipmentInventoryPilot.shoulders)
    drawButton(buttonsEquipmentInventoryPilot.chest)
    drawButton(buttonsEquipmentInventoryPilot.rightArm)
    drawButton(buttonsEquipmentInventoryPilot.leftArm)
    drawButton(buttonsEquipmentInventoryPilot.rightWeapon)
    drawButton(buttonsEquipmentInventoryPilot.leftWeapon)
    drawButton(buttonsEquipmentInventoryPilot.gloves)
    drawButton(buttonsEquipmentInventoryPilot.pants)
    drawButton(buttonsEquipmentInventoryPilot.rightLeg)
    drawButton(buttonsEquipmentInventoryPilot.leftLeg)
    drawButton(buttonsEquipmentInventoryPilot.boots)

    -- draw equipment icons
    -- ssEquipmentIcons

    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.head.equipmentID][1]
        , buttonsEquipmentInventoryPilot.head.x, buttonsEquipmentInventoryPilot.head.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.back.equipmentID][2]
        , buttonsEquipmentInventoryPilot.back.x, buttonsEquipmentInventoryPilot.back.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.shoulders.equipmentID][3]
        , buttonsEquipmentInventoryPilot.shoulders.x, buttonsEquipmentInventoryPilot.shoulders.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.chest.equipmentID][4]
        , buttonsEquipmentInventoryPilot.chest.x, buttonsEquipmentInventoryPilot.chest.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.rightArm.equipmentID][5]
        , buttonsEquipmentInventoryPilot.rightArm.x, buttonsEquipmentInventoryPilot.rightArm.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.leftArm.equipmentID][6]
        , buttonsEquipmentInventoryPilot.leftArm.x, buttonsEquipmentInventoryPilot.leftArm.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.rightWeapon.equipmentID][7]
        , buttonsEquipmentInventoryPilot.rightWeapon.x, buttonsEquipmentInventoryPilot.rightWeapon.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.leftWeapon.equipmentID][8]
        , buttonsEquipmentInventoryPilot.leftWeapon.x, buttonsEquipmentInventoryPilot.leftWeapon.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.gloves.equipmentID][9]
        , buttonsEquipmentInventoryPilot.gloves.x, buttonsEquipmentInventoryPilot.gloves.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.pants.equipmentID][10]
        , buttonsEquipmentInventoryPilot.pants.x, buttonsEquipmentInventoryPilot.pants.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.rightLeg.equipmentID][11]
        , buttonsEquipmentInventoryPilot.rightLeg.x, buttonsEquipmentInventoryPilot.rightLeg.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.leftLeg.equipmentID][12]
        , buttonsEquipmentInventoryPilot.leftLeg.x, buttonsEquipmentInventoryPilot.leftLeg.y, 0, graphicsScale, graphicsScale)
    love.graphics.draw(ssEquipmentIcons, equipmentIconQuads[pPE.boots.equipmentID][13]
        , buttonsEquipmentInventoryPilot.boots.x, buttonsEquipmentInventoryPilot.boots.y, 0, graphicsScale, graphicsScale)

    -- draw current stats
    local tYOffStats = currWindHeight / 4
    love.graphics.printf(player.name.."'s STATS", 50, tYOffStats, 200, "center")
    love.graphics.printf("----------------", 50, tYOffStats + 15, 200, "center")
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.printf("HP:", 50, tYOffStats + 30, 100, "right")
    love.graphics.printf(stats.hp.."/"..stats.maxHP, 150, tYOffStats + 30, 200, "left")
    love.graphics.setColor(0.5, 0.5, 1)
    love.graphics.printf("Stamina:", 50, tYOffStats + 60, 100, "right")
    love.graphics.printf(stats.focus.."/"..stats.maxFocus, 150, tYOffStats + 60, 200, "left")
    love.graphics.setColor(0.5, 1, 0.5)
    love.graphics.printf("Vitality:", 50, tYOffStats + 90, 100, "right")
    love.graphics.printf(stats.vitality, 150, tYOffStats + 90, 200, "left")
    love.graphics.setColor(0.75, 0.5, 0.5)
    love.graphics.printf("Strength:", 50, tYOffStats + 120, 100, "right")
    love.graphics.printf(stats.strength, 150, tYOffStats + 120, 200, "left")
    love.graphics.setColor(0.75, 0.75 ,0.25)
    love.graphics.printf("Instinct:", 50, tYOffStats + 150, 100, "right")
    love.graphics.printf(stats.instinct, 150, tYOffStats + 150, 200, "left")
    love.graphics.setColor(0.75, 0 ,0.75)
    love.graphics.printf("Speed:", 50, tYOffStats + 180, 100, "right")
    love.graphics.printf(stats.speed, 150, tYOffStats + 180, 200, "left")
    love.graphics.setColor(1, 1, 1)

    -- draw picked up Item

    -- draw description
    for j=1, #buttonsInventory, 1 do
        if isMouseOverButton(buttonsInventory[j]) then
            -- draw descriptions
            love.graphics.printf(tostring(getEquipStatsFromInventory(j)), buttonsInventory[j].x+tileWH, buttonsInventory[j].y+tileWH, 200, "left")
        end
    end

    if isMouseOverButton(buttonsEquipmentInventoryPilot.head) then
        love.graphics.printf(tostring(mainEquipmentPilotHeadArray.description[pPE.head.equipmentID])
            , buttonsEquipmentInventoryPilot.head.x+tileWH, buttonsEquipmentInventoryPilot.head.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.back) then
        love.graphics.printf(tostring(mainEquipmentPilotBackArray.description[pPE.back.equipmentID])
            , buttonsEquipmentInventoryPilot.back.x+tileWH, buttonsEquipmentInventoryPilot.back.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.shoulders) then
        love.graphics.printf(tostring(mainEquipmentPilotShouldersArray.description[pPE.shoulders.equipmentID])
            , buttonsEquipmentInventoryPilot.shoulders.x+tileWH, buttonsEquipmentInventoryPilot.shoulders.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.chest) then
        love.graphics.printf(tostring(mainEquipmentPilotChestArray.description[pPE.chest.equipmentID])
            , buttonsEquipmentInventoryPilot.chest.x+tileWH, buttonsEquipmentInventoryPilot.chest.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightArm) then
        love.graphics.printf(tostring(mainEquipmentPilotRArmArray.description[pPE.rightArm.equipmentID])
            , buttonsEquipmentInventoryPilot.rightArm.x+tileWH, buttonsEquipmentInventoryPilot.rightArm.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftArm) then
        love.graphics.printf(tostring(mainEquipmentPilotLArmArray.description[pPE.leftArm.equipmentID])
            , buttonsEquipmentInventoryPilot.leftArm.x+tileWH, buttonsEquipmentInventoryPilot.leftArm.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightWeapon) then
        love.graphics.printf(tostring(mainEquipmentPilotRWeaponArray.description[pPE.rightWeapon.equipmentID])
            , buttonsEquipmentInventoryPilot.rightWeapon.x+tileWH, buttonsEquipmentInventoryPilot.rightWeapon.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftWeapon) then
        love.graphics.printf(tostring(mainEquipmentPilotLWeaponArray.description[pPE.leftWeapon.equipmentID])
            , buttonsEquipmentInventoryPilot.leftWeapon.x+tileWH, buttonsEquipmentInventoryPilot.leftWeapon.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then
        love.graphics.printf(tostring(mainEquipmentPilotGlovesArray.description[pPE.gloves.equipmentID])
            , buttonsEquipmentInventoryPilot.gloves.x+tileWH, buttonsEquipmentInventoryPilot.gloves.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.pants) then
        love.graphics.printf(tostring(mainEquipmentPilotPantsArray.description[pPE.pants.equipmentID])
            , buttonsEquipmentInventoryPilot.pants.x+tileWH, buttonsEquipmentInventoryPilot.pants.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightLeg) then
        love.graphics.printf(tostring(mainEquipmentPilotRLegArray.description[pPE.rightLeg.equipmentID])
            , buttonsEquipmentInventoryPilot.rightLeg.x+tileWH, buttonsEquipmentInventoryPilot.rightLeg.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftLeg) then
        love.graphics.printf(tostring(mainEquipmentPilotLLegArray.description[pPE.leftLeg.equipmentID])
            , buttonsEquipmentInventoryPilot.leftLeg.x+tileWH, buttonsEquipmentInventoryPilot.leftLeg.y+tileWH, 200, "left")
    elseif isMouseOverButton(buttonsEquipmentInventoryPilot.boots) then
        love.graphics.printf(tostring(mainEquipmentPilotBootsArray.description[pPE.boots.equipmentID])
            , buttonsEquipmentInventoryPilot.boots.x+tileWH, buttonsEquipmentInventoryPilot.boots.y+tileWH, 200, "left")
    end
end