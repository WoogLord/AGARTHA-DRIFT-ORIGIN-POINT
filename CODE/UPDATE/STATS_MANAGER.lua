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
            "You are not wearing anything..." -- NOTHING
            , "Standard issue, warmth and grip are reserved for higher ranks apparently." -- RECRUIT
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

function statsManager(_target)
    -- modify player stats CONSTANTLY, later make this on equipment swap!
    local pGloveStats = mainEquipmentPilotGlovesArray.stats
    if _target.isMechedUp then
        tStats = _target.mech
        tEquip = _target.mech.equipment
    else
        tStats = _target.pilot
        tEquip = _target.pilot.equipment
    end

    --== Health ==--
    tStats.maxHP = 10 
        + pGloveStats.baseHP[tEquip.gloves]
    -- player.pilot.hp = player.pilot.maxHP

    --== Attack ==--
    tStats.attack = 1 
        + pGloveStats.baseAttack[tEquip.gloves]
    
    --== Speed ==--
    tStats.speed = 10 
        + pGloveStats.baseSpeed[tEquip.gloves]

    if _target.isMechedUp then
        -- Mech specific formulas
    else
        -- Pilot specific formulas
    end
end

function speedManager(_dt)
    if player.isMechedUp then
        moveSpeed = (100 + player.mech.speed) * _dt * moveSpeedDampener
    else
        moveSpeed = (100 + player.pilot.speed) * _dt * moveSpeedDampener
    end
end