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
        if isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then
            if helditem then
                if helditem.equipmentType == "gloves" then
                    heldItemBuffer = player.pilot.equipment.gloves
                    player.pilot.equipment.gloves = heldItem.equipmentID
                    heldItem = heldItemBuffer
                    print(buttonsEquipmentInventoryPilot.gloves.x)
                end
            else
                helditem = player.pilot.equipment.gloves
                player.pilot.equipment.gloves = 1
            end
        end
    end
end