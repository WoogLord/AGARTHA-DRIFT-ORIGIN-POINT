local EquipmentClass = {}
EquipmentClass.__index = EquipmentClass

function EquipmentClass:new(
        _vanityNames, _description
        , _baseHP, _baseAttack, _baseSpeed
    )
    local tEC = {} -- tEC = tempEquipmentClass
    setmetatable(tEC, EquipmentClass)

    tEC.vanityNames, tEC.description = _vanityNames, _description
    tEC.stats = {
        baseHP = _baseHP, baseAttack = _baseAttack, baseSpeed = _baseSpeed
    }
    return tEC
end

function initEquipment()
    -- this needs to contain a MASSIVE array for each equipmentType
    mainEquipmentPilotGlovesArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING", "RECRUIT"
        }
        , { -- description
            "You are not wearing anything..."
            , "Standard issue, warmth and grip are reserved for higher ranks apparently."
        }
        , { -- baseHP
            0, 3
        }
        , { -- baseAttack
            0, 2
        }
        , { -- baseSpeed
            0, 3
        }
    )
    print(mainEquipmentPilotGlovesArray.description[2])
end

function statsManager()
    -- modify player stats CONSTANTLY, later make this on equipment swap!

    --== Health ==--
    player.pilot.maxHP = 10 
        + mainEquipmentPilotGlovesArray.stats.baseHP[player.pilot.equipment.gloves]
    -- player.pilot.hp = player.pilot.maxHP

    --== Attack ==--
    player.pilot.attack = 1 
        + mainEquipmentPilotGlovesArray.stats.baseAttack[player.pilot.equipment.gloves]
    
    --== Speed ==--
    player.pilot.speed = 10 
        + mainEquipmentPilotGlovesArray.stats.baseSpeed[player.pilot.equipment.gloves]
end

function speedManager(_dt)
    if player.isMechedUp then
        moveSpeed = (100 + player.mech.speed) * _dt * moveSpeedDampener
    else
        moveSpeed = (100 + player.pilot.speed) * _dt * moveSpeedDampener
    end
end