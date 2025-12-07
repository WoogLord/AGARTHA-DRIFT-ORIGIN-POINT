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
    --   head = _pilotEquipmentHead, back = _pilotEquipmentBack
    -- , shoulders = _pilotEquipmentShoulders, chest = _pilotEquipmentChest
    -- , rightArm = _pilotEquipmentRArm, leftArm = _pilotEquipmentLArm
    -- , rightWeapon = _pilotEquipmentRWeapon, leftWeapon = _pilotEquipmentLWeapon
    -- , gloves = _pilotEquipmentGloves, pants = _pilotEquipmentPants
    -- , rightLeg = _pilotEquipmentRLeg, leftLeg = _pilotEquipmentLLeg
    -- , boots = _pilotEquipmentBoots
    mainEquipmentPilotHeadArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING", "RECRUIT"
        }
        
        , { -- description
            "BALD BALD BALD BALD BALD" -- NOTHING
            , "Covers my Norwood 8" -- RECRUIT
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
    mainEquipmentPilotBackArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "...heh... epic..." -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
    mainEquipmentPilotShouldersArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "...that's a weight off my... you know..." -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
    mainEquipmentPilotChestArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING", "RECRUIT"
        }
        , { -- description
            "N- Nice tits, y- you grow 'em yourself?" -- NOTHING
            , "FINALLY, my slight gyno is covered." -- RECRUIT
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
    mainEquipmentPilotRArmArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "EXODIA, RIGHT ARM OF THE CHOSEN ONE" -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
    mainEquipmentPilotLArmArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "EXODIA, RI- *makes fingers L's* L- LEFT ARM OF THE CHOSEN ONE" -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
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
    mainEquipmentPilotPantsArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING", "RECRUIT"
        }
        , { -- description
            "...Is there a breeze in here?" -- NOTHING
            , "not assless, I checked." -- RECRUIT
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
    mainEquipmentPilotRLegArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "EXODIA, RIGHT LEG OF THE CHOSEN ONE" -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
    mainEquipmentPilotLLegArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "EXODIA, LEFT LEG OF THE CHOSEN ONE" -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
    mainEquipmentPilotBootsArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING", "RECRUIT"
        }
        , { -- description
            "PUT THOSE GRIPPERS AWAY" -- NOTHING
            , "Tactical, 7 inch zipper, matte black, I have a big abscess in between my toes its really starting to squi-" -- RECRUIT
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
    
    --== WEAPONS ==--
    mainEquipmentPilotRWeaponArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "Why I oughtta!" -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
    mainEquipmentPilotLWeaponArray = EquipmentClass:new(
        { -- vanityNames
            "NOTHING"
        }
        , { -- description
            "Let me at 'em!" -- NOTHING
        }
        , { -- baseHP
            0
        }
        , { -- baseAttack
            0
        }
        , { -- baseSpeed
            0
        }
    )
end

equipKey = {
    pilot = {"head", "back", "shoulders", "chest", "rightArm", "leftArm", "rightWeapon", "leftWeapon", "gloves", "pants", "rightLeg", "leftLeg", "boots"}
    , mech = {}
    , pilotArrays = {
          mainEquipmentPilotHeadArray
        , mainEquipmentPilotBackArray
        , mainEquipmentPilotShouldersArray
        , mainEquipmentPilotChestArray
        , mainEquipmentPilotRArmArray
        , mainEquipmentPilotLArmArray
        , mainEquipmentPilotRWeaponArray
        , mainEquipmentPilotLWeaponArray
        , mainEquipmentPilotGlovesArray
        , mainEquipmentPilotPantsArray
        , mainEquipmentPilotRLegArray
        , mainEquipmentPilotLLegArray
        , mainEquipmentPilotBootsArray
    }
    , mechArrays = {
        
    }
}

function statsManager(_target)
    -- modify player stats CONSTANTLY, later make this on equipment swap!
    local pHeadStats = mainEquipmentPilotHeadArray.stats
    local pBackStats = mainEquipmentPilotBackArray.stats
    local pShouldersStats = mainEquipmentPilotShouldersArray.stats
    local pChestStats = mainEquipmentPilotChestArray.stats
    local pRArmStats = mainEquipmentPilotRArmArray.stats
    local pLArmStats = mainEquipmentPilotLArmArray.stats
    local pGlovesStats = mainEquipmentPilotGlovesArray.stats
    local pPantsStats = mainEquipmentPilotPantsArray.stats
    local pRLegStats = mainEquipmentPilotRLegArray.stats
    local pLLegStats = mainEquipmentPilotLLegArray.stats
    local pBootsStats = mainEquipmentPilotBootsArray.stats

    local pRWeaponStats = mainEquipmentPilotRWeaponArray.stats
    local pLWeaponStats = mainEquipmentPilotLWeaponArray.stats

    if _target.isMechedUp then
        tStats = _target.mech
        tEquip = _target.mech.equipment
    else
        tStats = _target.pilot
        tEquip = _target.pilot.equipment
    end
    --   head = _pilotEquipmentHead, back = _pilotEquipmentBack
    -- , shoulders = _pilotEquipmentShoulders, chest = _pilotEquipmentChest
    -- , rightArm = _pilotEquipmentRArm, leftArm = _pilotEquipmentLArm
    -- , rightWeapon = _pilotEquipmentRWeapon, leftWeapon = _pilotEquipmentLWeapon
    -- , gloves = _pilotEquipmentGloves, pants = _pilotEquipmentPants
    -- , rightLeg = _pilotEquipmentRLeg, leftLeg = _pilotEquipmentLLeg
    -- , boots = _pilotEquipmentBoots

    --==-- Aggregates / Base Values --==--
    --== Health ==--
    tStats.maxHP = 10 
        + pHeadStats.baseHP[tEquip.head]
        + pBackStats.baseHP[tEquip.back]
        + pShouldersStats.baseHP[tEquip.shoulders]
        + pChestStats.baseHP[tEquip.chest]
        + pRArmStats.baseHP[tEquip.rightArm]
        + pLArmStats.baseHP[tEquip.leftArm]
        + pGlovesStats.baseHP[tEquip.gloves]
        + pPantsStats.baseHP[tEquip.pants]
        + pRLegStats.baseHP[tEquip.rightLeg]
        + pLLegStats.baseHP[tEquip.leftLeg]
        + pBootsStats.baseHP[tEquip.boots]

        + pRWeaponStats.baseHP[tEquip.rightWeapon]
        + pLWeaponStats.baseHP[tEquip.leftWeapon]

    --== Attack ==--
    tStats.attack = 1 
        + pHeadStats.baseAttack[tEquip.head]
        + pBackStats.baseAttack[tEquip.back]
        + pShouldersStats.baseAttack[tEquip.shoulders]
        + pChestStats.baseAttack[tEquip.chest]
        + pRArmStats.baseAttack[tEquip.rightArm]
        + pLArmStats.baseAttack[tEquip.leftArm]
        + pGlovesStats.baseAttack[tEquip.gloves]
        + pPantsStats.baseAttack[tEquip.pants]
        + pRLegStats.baseAttack[tEquip.rightLeg]
        + pLLegStats.baseAttack[tEquip.leftLeg]
        + pBootsStats.baseAttack[tEquip.boots]

        + pRWeaponStats.baseAttack[tEquip.rightWeapon]
        + pLWeaponStats.baseAttack[tEquip.leftWeapon]

    --== Speed ==--
    tStats.speed = 10 
        + pHeadStats.baseSpeed[tEquip.head]
        + pBackStats.baseSpeed[tEquip.back]
        + pShouldersStats.baseSpeed[tEquip.shoulders]
        + pChestStats.baseSpeed[tEquip.chest]
        + pRArmStats.baseSpeed[tEquip.rightArm]
        + pLArmStats.baseSpeed[tEquip.leftArm]
        + pGlovesStats.baseSpeed[tEquip.gloves]
        + pPantsStats.baseSpeed[tEquip.pants]
        + pRLegStats.baseSpeed[tEquip.rightLeg]
        + pLLegStats.baseSpeed[tEquip.leftLeg]
        + pBootsStats.baseSpeed[tEquip.boots]

        + pRWeaponStats.baseSpeed[tEquip.rightWeapon]
        + pLWeaponStats.baseSpeed[tEquip.leftWeapon]

    if _target.isMechedUp then
        -- Mech specific formulas
    else
        -- Pilot specific formulas
    end

    --==-- Multipliers go here --==--
end

function speedManager(_dt)
    if player.isMechedUp then
        moveSpeed = (100 + player.mech.speed) * _dt * moveSpeedDampener
    else
        moveSpeed = (100 + player.pilot.speed) * _dt * moveSpeedDampener
    end
end