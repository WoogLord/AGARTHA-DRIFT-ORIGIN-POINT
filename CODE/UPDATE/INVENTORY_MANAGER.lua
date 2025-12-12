-- think this is needed
inventoryArray = {}
for i=1, 36, 1 do
    inventoryArray[i] = {
        equipmentType = ""
        , equipmentID = 0
        , equipmentIndex = 0
        , itemXp = 0
    }
    print(inventoryArray[i].equipmentType)
end

inventoryArray[1] = {
    equipmentType = "gloves"
    , equipmentID = 2
    , equipmentIndex = 9
    , itemXp = 0
}
heldItem = {
    equipmentType = ""
    , equipmentID = 1
    , equipmentIndex = 0
    , itemXp = 0
}
heldItemBuffer = {
    equipmentType = ""
    , equipmentID = 1
    , equipmentIndex = 0
    , itemXp = 0
}
function getEquipStatsFromInventory(_inventorySpotToCheck)
    if inventoryArray[_inventorySpotToCheck].equipmentType == "" then
        return ""
    elseif
        -- print(equipKey.pilot)
        -- print(inventoryArray[_inventorySpotToCheck].equipmentType)
        -- print(returnIndexGivenArrayValue(equipKey.pilot, inventoryArray[_inventorySpotToCheck].equipmentType))
        -- local index = returnIndexGivenArrayValue(equipKey.pilot, inventoryArray[_inventorySpotToCheck].equipmentType)
        -- tempEquipArray = equipKey.pilotArrays[index]
        -- print(inventoryArray[_inventorySpotToCheck].equipmentID)
        -- print(tempEquipArray)
        -- print(equipKey.pilotArrays[9])
        -- return tempEquipArray.description[inventoryArray[_inventorySpotToCheck].equipmentID]

        -- I WANTED AN ELEGANT SOLUTION
        -- LUA GAVE ME NOTHING
        -- BRUTEFORCE INITIATE
        inventoryArray[_inventorySpotToCheck].equipmentType == "gloves" then
        return mainEquipmentPilotGlovesArray.description[inventoryArray[_inventorySpotToCheck].equipmentID]
    elseif inventoryArray[_inventorySpotToCheck].equipmentType == "pants" then

    end
end

-- function called in INPUTS.lua
function pickUpItem(_x, _y, _buttonPressed)
    for i=1, #buttonsInventory, 1 do
        if isMouseOverButton(buttonsInventory[i]) then
            if _buttonPressed == 1 then
                if heldItem then
                    heldItemBuffer = inventoryArray[i]
                    inventoryArray[i] = heldItem
                    heldItem = heldItemBuffer
                else
                    heldItemBuffer = inventoryArray[i]
                    heldItem = heldItemBuffer
                    inventoryArray[i] = {
                        equipmentType = ""
                        , equipmentID = 0
                        , equipmentIndex = 0
                        , itemXp = 0
                    }
                end
            end
        end
    end
    if _buttonPressed == 1 then
        print("heldItem: "..heldItem.equipmentType..","..heldItem.equipmentID..","..heldItem.equipmentIndex..","..heldItem.itemXp)
        print("heldItemBuffer: "..heldItemBuffer.equipmentType..","..heldItemBuffer.equipmentID..","..heldItemBuffer.equipmentIndex..","..heldItemBuffer.itemXp)
        if heldItem.equipmentType == "" then 
            -- do stuff if heldItem is nil
            if isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then -- 9
                if player.pilot.equipment.gloves.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "gloves"
                        , equipmentID = player.pilot.equipment.gloves.equipmentID
                        , equipmentIndex = 9
                        , itemXp = player.pilot.equipment.gloves.itemXp
                    }
                    player.pilot.equipment.gloves.equipmentID = 1
                    player.pilot.equipment.gloves.itemXp = 0
                end
            end
        else -- do stuff if heldItem exists
            if isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then -- 9
                if heldItem.equipmentType == "gloves" then
                    if player.pilot.equipment.gloves.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        player.pilot.equipment.gloves.equipmentID = heldItem.equipmentID
                        player.pilot.equipment.gloves.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "gloves"
                            , equipmentID = player.pilot.equipment.gloves.equipmentID
                            , equipmentIndex = 9
                            , itemXp = player.pilot.equipment.gloves.itemXp
                        }
                        player.pilot.equipment.gloves.equipmentID = heldItemBuffer.equipmentID
                        player.pilot.equipment.gloves.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                        
                    end
                end
            end
        end
        -- if isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then
        --     if helditem then -- if heldItem exists (not nil)
        --         if helditem.equipmentType == "gloves" then
        --             heldItemBuffer = {
        --                 equipmentType = "gloves"
        --                 , equipmentID = player.pilot.equipment.gloves.equipmentID
        --                 , equipmentIndex = 9
        --                 , itemXp = player.pilot.equipment.gloves.itemXp
        --             }
        --             player.pilot.equipment.gloves.equipmentID = heldItem.equipmentID
        --             player.pilot.equipment.gloves.itemXp = heldItem.itemXp
        --             heldItem = heldItemBuffer
        --         end
        --     else -- if heldItem is nil
        --         -- heldItem = equipment
        --         -- equipment = nil
        --         --
        --         heldItemBuffer = {
        --             equipmentType = "gloves" -- not here
        --             , equipmentID = player.pilot.equipment.gloves.equipmentID
        --             , equipmentIndex = 9 -- not here
        --             , itemXp = player.pilot.equipment.gloves.itemXp
        --         }
        --         print(heldItemBuffer.equipmentType.." "..heldItemBuffer.equipmentID.." "..heldItemBuffer.equipmentIndex.." "..heldItemBuffer.itemXp)
        --         heldItem = heldItemBuffer
        --         print(heldItem.equipmentType.." "..heldItem.equipmentID.." "..heldItem.equipmentIndex.." "..heldItem.itemXp)
        --         player.pilot.equipment.gloves.equipmentID = 1
        --         player.pilot.equipment.gloves.itemXp = 0
        --         print(heldItem.equipmentType.." "..heldItem.equipmentID.." "..heldItem.equipmentIndex.." "..heldItem.itemXp)
        --         -- heldItem = heldItemBuffer
        --     end
        -- end
    end
end