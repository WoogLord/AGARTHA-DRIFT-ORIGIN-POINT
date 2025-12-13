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
inventoryArray[2] = {
    equipmentType = "pants"
    , equipmentID = 2
    , equipmentIndex = 10
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
    elseif inventoryArray[_inventorySpotToCheck].equipmentType == "gloves" then
        return mainEquipmentPilotGlovesArray.description[inventoryArray[_inventorySpotToCheck].equipmentID]
    elseif inventoryArray[_inventorySpotToCheck].equipmentType == "pants" then
        return mainEquipmentPilotPantsArray.description[inventoryArray[_inventorySpotToCheck].equipmentID]
    end
end

-- function called in INPUTS.lua
function pickUpItem(_x, _y, _buttonPressed)
    activeAlly = player
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
            if isMouseOverButton(buttonsEquipmentInventoryPilot.head) then -- 1
                if activeAlly.pilot.equipment.head.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "head"
                        , equipmentID = activeAlly.pilot.equipment.head.equipmentID
                        , equipmentIndex = 1
                        , itemXp = activeAlly.pilot.equipment.head.itemXp
                    }
                    activeAlly.pilot.equipment.head.equipmentID = 1
                    activeAlly.pilot.equipment.head.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.back) then -- 2
                if activeAlly.pilot.equipment.back.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "back"
                        , equipmentID = activeAlly.pilot.equipment.back.equipmentID
                        , equipmentIndex = 2
                        , itemXp = activeAlly.pilot.equipment.back.itemXp
                    }
                    activeAlly.pilot.equipment.back.equipmentID = 1
                    activeAlly.pilot.equipment.back.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.shoulders) then -- 3
                if activeAlly.pilot.equipment.shoulders.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "shoulders"
                        , equipmentID = activeAlly.pilot.equipment.shoulders.equipmentID
                        , equipmentIndex = 3
                        , itemXp = activeAlly.pilot.equipment.shoulders.itemXp
                    }
                    activeAlly.pilot.equipment.shoulders.equipmentID = 1
                    activeAlly.pilot.equipment.shoulders.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.chest) then -- 4
                if activeAlly.pilot.equipment.chest.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "chest"
                        , equipmentID = activeAlly.pilot.equipment.chest.equipmentID
                        , equipmentIndex = 4
                        , itemXp = activeAlly.pilot.equipment.chest.itemXp
                    }
                    activeAlly.pilot.equipment.chest.equipmentID = 1
                    activeAlly.pilot.equipment.chest.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightArm) then -- 5
                if activeAlly.pilot.equipment.rightArm.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "rightArm"
                        , equipmentID = activeAlly.pilot.equipment.rightArm.equipmentID
                        , equipmentIndex = 5
                        , itemXp = activeAlly.pilot.equipment.rightArm.itemXp
                    }
                    activeAlly.pilot.equipment.rightArm.equipmentID = 1
                    activeAlly.pilot.equipment.rightArm.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftArm) then -- 6
                if activeAlly.pilot.equipment.leftArm.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "leftArm"
                        , equipmentID = activeAlly.pilot.equipment.leftArm.equipmentID
                        , equipmentIndex = 6
                        , itemXp = activeAlly.pilot.equipment.leftArm.itemXp
                    }
                    activeAlly.pilot.equipment.leftArm.equipmentID = 1
                    activeAlly.pilot.equipment.leftArm.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightWeapon) then -- 7
                if activeAlly.pilot.equipment.rightWeapon.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "rightWeapon"
                        , equipmentID = activeAlly.pilot.equipment.rightWeapon.equipmentID
                        , equipmentIndex = 7
                        , itemXp = activeAlly.pilot.equipment.rightWeapon.itemXp
                    }
                    activeAlly.pilot.equipment.rightWeapon.equipmentID = 1
                    activeAlly.pilot.equipment.rightWeapon.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftWeapon) then -- 8
                if activeAlly.pilot.equipment.leftWeapon.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "leftWeapon"
                        , equipmentID = activeAlly.pilot.equipment.leftWeapon.equipmentID
                        , equipmentIndex = 8
                        , itemXp = activeAlly.pilot.equipment.leftWeapon.itemXp
                    }
                    activeAlly.pilot.equipment.leftWeapon.equipmentID = 1
                    activeAlly.pilot.equipment.leftWeapon.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then -- 9
                if activeAlly.pilot.equipment.gloves.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "gloves"
                        , equipmentID = activeAlly.pilot.equipment.gloves.equipmentID
                        , equipmentIndex = 9
                        , itemXp = activeAlly.pilot.equipment.gloves.itemXp
                    }
                    activeAlly.pilot.equipment.gloves.equipmentID = 1
                    activeAlly.pilot.equipment.gloves.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.pants) then -- 10
                if activeAlly.pilot.equipment.pants.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "pants"
                        , equipmentID = activeAlly.pilot.equipment.pants.equipmentID
                        , equipmentIndex = 10
                        , itemXp = activeAlly.pilot.equipment.pants.itemXp
                    }
                    activeAlly.pilot.equipment.pants.equipmentID = 1
                    activeAlly.pilot.equipment.pants.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightLeg) then -- 11
                if activeAlly.pilot.equipment.rightLeg.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "rightLeg"
                        , equipmentID = activeAlly.pilot.equipment.rightLeg.equipmentID
                        , equipmentIndex = 11
                        , itemXp = activeAlly.pilot.equipment.rightLeg.itemXp
                    }
                    activeAlly.pilot.equipment.rightLeg.equipmentID = 1
                    activeAlly.pilot.equipment.rightLeg.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftLeg) then -- 12
                if activeAlly.pilot.equipment.leftLeg.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "leftLeg"
                        , equipmentID = activeAlly.pilot.equipment.leftLeg.equipmentID
                        , equipmentIndex = 12
                        , itemXp = activeAlly.pilot.equipment.leftLeg.itemXp
                    }
                    activeAlly.pilot.equipment.leftLeg.equipmentID = 1
                    activeAlly.pilot.equipment.leftLeg.itemXp = 0
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.boots) then -- 13
                if activeAlly.pilot.equipment.boots.equipmentID == 1 then
                else
                    heldItem = {
                        equipmentType = "boots"
                        , equipmentID = activeAlly.pilot.equipment.boots.equipmentID
                        , equipmentIndex = 13
                        , itemXp = activeAlly.pilot.equipment.boots.itemXp
                    }
                    activeAlly.pilot.equipment.boots.equipmentID = 1
                    activeAlly.pilot.equipment.boots.itemXp = 0
                end
            end
        else -- do stuff if heldItem exists
            if isMouseOverButton(buttonsEquipmentInventoryPilot.head) then -- 1
                if heldItem.equipmentType == "head" then
                    if activeAlly.pilot.equipment.head.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.head.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.head.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "head"
                            , equipmentID = activeAlly.pilot.equipment.head.equipmentID
                            , equipmentIndex = 1
                            , itemXp = activeAlly.pilot.equipment.head.itemXp
                        }
                        activeAlly.pilot.equipment.head.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.head.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.back) then -- 2
                if heldItem.equipmentType == "back" then
                    if activeAlly.pilot.equipment.back.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.back.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.back.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "back"
                            , equipmentID = activeAlly.pilot.equipment.back.equipmentID
                            , equipmentIndex = 2
                            , itemXp = activeAlly.pilot.equipment.back.itemXp
                        }
                        activeAlly.pilot.equipment.back.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.back.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.shoulders) then -- 3
                if heldItem.equipmentType == "shoulders" then
                    if activeAlly.pilot.equipment.shoulders.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.shoulders.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.shoulders.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "shoulders"
                            , equipmentID = activeAlly.pilot.equipment.shoulders.equipmentID
                            , equipmentIndex = 3
                            , itemXp = activeAlly.pilot.equipment.shoulders.itemXp
                        }
                        activeAlly.pilot.equipment.shoulders.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.shoulders.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.chest) then -- 4
                if heldItem.equipmentType == "chest" then
                    if activeAlly.pilot.equipment.chest.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.chest.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.chest.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "chest"
                            , equipmentID = activeAlly.pilot.equipment.chest.equipmentID
                            , equipmentIndex = 4
                            , itemXp = activeAlly.pilot.equipment.chest.itemXp
                        }
                        activeAlly.pilot.equipment.chest.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.chest.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightArm) then -- 5
                if heldItem.equipmentType == "rightArm" then
                    if activeAlly.pilot.equipment.rightArm.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.rightArm.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.rightArm.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "rightArm"
                            , equipmentID = activeAlly.pilot.equipment.rightArm.equipmentID
                            , equipmentIndex = 5
                            , itemXp = activeAlly.pilot.equipment.rightArm.itemXp
                        }
                        activeAlly.pilot.equipment.rightArm.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.rightArm.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftArm) then -- 6
                if heldItem.equipmentType == "leftArm" then
                    if activeAlly.pilot.equipment.leftArm.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.leftArm.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.leftArm.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "leftArm"
                            , equipmentID = activeAlly.pilot.equipment.leftArm.equipmentID
                            , equipmentIndex = 6
                            , itemXp = activeAlly.pilot.equipment.leftArm.itemXp
                        }
                        activeAlly.pilot.equipment.leftArm.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.leftArm.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightWeapon) then -- 7
                if heldItem.equipmentType == "rightWeapon" then
                    if activeAlly.pilot.equipment.rightWeapon.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.rightWeapon.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.rightWeapon.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "rightWeapon"
                            , equipmentID = activeAlly.pilot.equipment.rightWeapon.equipmentID
                            , equipmentIndex = 7
                            , itemXp = activeAlly.pilot.equipment.rightWeapon.itemXp
                        }
                        activeAlly.pilot.equipment.rightWeapon.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.rightWeapon.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftWeapon) then -- 8
                if heldItem.equipmentType == "leftWeapon" then
                    if activeAlly.pilot.equipment.leftWeapon.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.leftWeapon.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.leftWeapon.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "leftWeapon"
                            , equipmentID = activeAlly.pilot.equipment.leftWeapon.equipmentID
                            , equipmentIndex = 8
                            , itemXp = activeAlly.pilot.equipment.leftWeapon.itemXp
                        }
                        activeAlly.pilot.equipment.leftWeapon.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.leftWeapon.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.gloves) then -- 9
                if heldItem.equipmentType == "gloves" then
                    if activeAlly.pilot.equipment.gloves.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.gloves.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.gloves.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "gloves"
                            , equipmentID = activeAlly.pilot.equipment.gloves.equipmentID
                            , equipmentIndex = 9
                            , itemXp = activeAlly.pilot.equipment.gloves.itemXp
                        }
                        activeAlly.pilot.equipment.gloves.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.gloves.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.pants) then -- 10
                if heldItem.equipmentType == "pants" then
                    if activeAlly.pilot.equipment.pants.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.pants.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.pants.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "pants"
                            , equipmentID = activeAlly.pilot.equipment.pants.equipmentID
                            , equipmentIndex = 10
                            , itemXp = activeAlly.pilot.equipment.pants.itemXp
                        }
                        activeAlly.pilot.equipment.pants.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.pants.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.rightLeg) then -- 11
                if heldItem.equipmentType == "rightLeg" then
                    if activeAlly.pilot.equipment.rightLeg.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.rightLeg.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.rightLeg.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "rightLeg"
                            , equipmentID = activeAlly.pilot.equipment.rightLeg.equipmentID
                            , equipmentIndex = 11
                            , itemXp = activeAlly.pilot.equipment.rightLeg.itemXp
                        }
                        activeAlly.pilot.equipment.rightLeg.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.rightLeg.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.leftLeg) then -- 12
                if heldItem.equipmentType == "leftLeg" then
                    if activeAlly.pilot.equipment.leftLeg.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.leftLeg.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.leftLeg.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "leftLeg"
                            , equipmentID = activeAlly.pilot.equipment.leftLeg.equipmentID
                            , equipmentIndex = 12
                            , itemXp = activeAlly.pilot.equipment.leftLeg.itemXp
                        }
                        activeAlly.pilot.equipment.leftLeg.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.leftLeg.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            elseif isMouseOverButton(buttonsEquipmentInventoryPilot.boots) then -- 13
                if heldItem.equipmentType == "boots" then
                    if activeAlly.pilot.equipment.boots.equipmentID == 1 then -- if no item equipped
                        -- place heldItem
                        activeAlly.pilot.equipment.boots.equipmentID = heldItem.equipmentID
                        activeAlly.pilot.equipment.boots.itemXp = heldItem.itemXp
                        heldItem = {
                            equipmentType = ""
                            , equipmentID = 1
                            , equipmentIndex = 0
                            , itemXp = 0
                        }                    
                    else
                        heldItemBuffer = {
                            equipmentType = "boots"
                            , equipmentID = activeAlly.pilot.equipment.boots.equipmentID
                            , equipmentIndex = 13
                            , itemXp = activeAlly.pilot.equipment.boots.itemXp
                        }
                        activeAlly.pilot.equipment.boots.equipmentID = heldItemBuffer.equipmentID
                        activeAlly.pilot.equipment.boots.itemXp = heldItemBuffer.itemXp
                        heldItem = heldItemBuffer
                    end
                end
            end
        end
    end
end