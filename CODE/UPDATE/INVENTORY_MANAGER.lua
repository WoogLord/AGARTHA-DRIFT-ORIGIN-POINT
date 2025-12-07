-- think this is needed
inventoryArray = {}
for i=1, 36, 1 do
    inventoryArray[i] = {
        equipmentType = ""
        , equipmentID = 0
        , itemXp = 0
    }
    print(inventoryArray[i].equipmentType)
end

inventoryArray[1] = {
        equipmentType = "gloves"
        , equipmentID = 2
        , itemXp = 0
    }
function getEquipStatsFromInventory(_inventorySpotToCheck)
    local tempEquipArray = {}
    if inventoryArray[_inventorySpotToCheck].equipmentType == "" then
        return ""
    else
        print(equipKey.pilot)
        print(inventoryArray[_inventorySpotToCheck].equipmentType)
        print(returnIndexGivenArrayValue(equipKey.pilot, inventoryArray[_inventorySpotToCheck].equipmentType))
        tempEquipArray = equipKey.pilotArrays[returnIndexGivenArrayValue(equipKey.pilot, inventoryArray[_inventorySpotToCheck].equipmentType)]
        print(inventoryArray[_inventorySpotToCheck].equipmentID)
        return tempEquipArray.description[inventoryArray[_inventorySpotToCheck].equipmentID]
    end
end

function pickUpItem()

end