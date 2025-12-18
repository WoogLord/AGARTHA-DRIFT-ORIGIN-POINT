local EquipmentClass = {}
EquipmentClass.__index = EquipmentClass

function EquipmentClass:new(
        _vanityNames, _description
        , _baseVitality, _baseStrength, _baseSpeed
    )
    local tEC = {} -- tEC = tempEquipmentClass
    setmetatable(tEC, EquipmentClass)

    tEC.vanityNames, tEC.description = _vanityNames, _description
    tEC.stats = {
        baseVitality = _baseVitality, baseStrength = _baseStrength, baseSpeed = _baseSpeed
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
        , { -- baseVitality
            0, 3
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0, 3
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0, 3
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0, 3
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0, 3
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
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
        , { -- baseVitality
            0
        }
        , { -- baseStrength
            0
        }
        , { -- baseSpeed
            0
        }
    )
end

local AbilityClass = {}
AbilityClass.__index = AbilityClass

function AbilityClass:new(
        _vanityNames, _description, _abilityID
        , _maxLevel
        , _focusCostBase, _focusCostPer
        , _hpCostBase, _hpCostPer
    )
    local tAC = {} -- tAC = tempAbilityClass
    setmetatable(tAC, AbilityClass)

    tAC.vanityNames, tAC.description, tAC.abilityID = _vanityNames, _description, _abilityID
    tAC.stats = {
        maxLevel = _maxLevel
        , focusCostBase = _focusCostBase, focusCostPer = _focusCostPer
        , hpCostBase = _hpCostBase, hpCostPer = _hpCostPer
    }
    return tAC
end

bigAbilityArray = {
      vanityNames = {"", "Leading Strike", "Destroy", "Suppression"
    }
    , description = {"", "Deal 170% of your strength as damage", "Deal 420% of your strength as damage", "Reduce damage taken by 70% for 3 turns"
    }
    , abilityID = {1, 2, 3, 4
    }
    , stats = {
          maxLevel = {1, 1, 1, 1
        }
        , cooldown = {0, 0, 1, 5
        }
        , focusCostBase = {0, 0, 100, 0
        }
        , focusCostPer = {0, 0, 0, 0
        }
        , hpCostBase = {0, 0, 0, 0
        }
        , hpCostPer = {0, 0, 0, 0
        }
        , animation = {"None", "Strike", "Strike", "Cast"
        }
        , abilityType = {"None", "Attack", "Attack", "Buff"
        }
        , targets = {"None", "Enemies", "Enemies", "Self"
        }
        , buffElement = {"None", "None", "None", "Physical"
        }
        , attackElement = {"None", "Physical", "Physical", "None"
        }
        , dispelAmount = {0, 0, 0, 0
        }
        , dispelElement = {"None", "None", "None", "None"
        }
        , dispelBuffOrDebuff = {"None", "None", "None", "None"
        }
        , dispelChance = {0, 0, 0, 0
        }
        , dispelResist = {0, 0, 0, 0
        }
        , vitalityScale = {0, 0, 0, 0
        }
        , strengthScale = {0, 1.7, 4.2, 0
        }
        , instinctScale = {0, 0, 0, 0
        }
        , speedScale = {0, 0, 0, 0
        }
        , additionalBase = {0, 0, 0, 0
        }
        , critChanceMod = {1, 1, 1, 1
        }
        , critDamageMod = {1, 1, 1, 1
        }
        , vitalityScaleDoT = {0, 0, 0, 0
        }
        , strengthScaleDoT = {0, 0, 0, 0
        }
        , instinctScaleDoT = {0, 0, 0, 0
        }
        , speedScaleDoT = {0, 0, 0, 0
        }
        , additionalBaseDoT = {0, 0, 0, 0
        }
        , vitalityScaleBarrier = {0, 0, 0, 0
        }
        , strengthScaleBarrier = {0, 0, 0, 0
        }
        , instinctScaleBarrier = {0, 0, 0, 0
        }
        , speedScaleBarrier = {0, 0, 0, 0
        }
        , additionalBaseBarrier = {0, 0, 0, 0
        }
        , stunTurns = {0, 0, 0, 0
        }
        , buffTurns = {0, 0, 0, 3
        }
        , selfBuffChance = {0, 0, 0, 0
        }
        , debuffTurns = {0, 0, 0, 0
        }
        , damageReductionFlat = {0, 0, 0, 0
        }
        , damageReductionPct = {0, 0, 0, 0.7
        }
        , damageReductionElement ={"None", "None", "None", "None"
        }
        , damagePenetrationFlat = {0, 0, 0, 0
        }
        , damagePenetrationPct = {0, 0, 0, 0
        }
        , damagePenetrationElement ={"None", "None", "None", "None"
        }
    }
}

-- THIS COULD BE EPIC BUT NOOOOOOOOOOOOOOO LUA MADE THIS NOT ACTUALLY RETURN TABLE REFS  (see INVENTORY_MANAGER -> getEquipStatsFromInventory for why my rant matters lol)
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

    local tStats = _target.isMechedUp and _target.mech or _target.pilot 
    local tEquip = _target.isMechedUp and _target.mech.equipment or _target.pilot.equipment 
    
    --   head = _pilotEquipmentHead, back = _pilotEquipmentBack
    -- , shoulders = _pilotEquipmentShoulders, chest = _pilotEquipmentChest
    -- , rightArm = _pilotEquipmentRArm, leftArm = _pilotEquipmentLArm
    -- , rightWeapon = _pilotEquipmentRWeapon, leftWeapon = _pilotEquipmentLWeapon
    -- , gloves = _pilotEquipmentGloves, pants = _pilotEquipmentPants
    -- , rightLeg = _pilotEquipmentRLeg, leftLeg = _pilotEquipmentLLeg
    -- , boots = _pilotEquipmentBoots

    --==-- Aggregates / Base Values --==--
    --== Vitality ==--
    tStats.vitality = 5
        + pHeadStats.baseVitality[tEquip.head.equipmentID]
        + pBackStats.baseVitality[tEquip.back.equipmentID]
        + pShouldersStats.baseVitality[tEquip.shoulders.equipmentID]
        + pChestStats.baseVitality[tEquip.chest.equipmentID]
        + pRArmStats.baseVitality[tEquip.rightArm.equipmentID]
        + pLArmStats.baseVitality[tEquip.leftArm.equipmentID]
        + pGlovesStats.baseVitality[tEquip.gloves.equipmentID]
        + pPantsStats.baseVitality[tEquip.pants.equipmentID]
        + pRLegStats.baseVitality[tEquip.rightLeg.equipmentID]
        + pLLegStats.baseVitality[tEquip.leftLeg.equipmentID]
        + pBootsStats.baseVitality[tEquip.boots.equipmentID]

        + pRWeaponStats.baseVitality[tEquip.rightWeapon.equipmentID]
        + pLWeaponStats.baseVitality[tEquip.leftWeapon.equipmentID]

    --== Strength ==--
    tStats.strength = 0
        + pHeadStats.baseStrength[tEquip.head.equipmentID]
        + pBackStats.baseStrength[tEquip.back.equipmentID]
        + pShouldersStats.baseStrength[tEquip.shoulders.equipmentID]
        + pChestStats.baseStrength[tEquip.chest.equipmentID]
        + pRArmStats.baseStrength[tEquip.rightArm.equipmentID]
        + pLArmStats.baseStrength[tEquip.leftArm.equipmentID]
        + pGlovesStats.baseStrength[tEquip.gloves.equipmentID]
        + pPantsStats.baseStrength[tEquip.pants.equipmentID]
        + pRLegStats.baseStrength[tEquip.rightLeg.equipmentID]
        + pLLegStats.baseStrength[tEquip.leftLeg.equipmentID]
        + pBootsStats.baseStrength[tEquip.boots.equipmentID]

        + pRWeaponStats.baseStrength[tEquip.rightWeapon.equipmentID]
        + pLWeaponStats.baseStrength[tEquip.leftWeapon.equipmentID]

    --== Speed ==--
    tStats.speed = 10 
        + pHeadStats.baseSpeed[tEquip.head.equipmentID]
        + pBackStats.baseSpeed[tEquip.back.equipmentID]
        + pShouldersStats.baseSpeed[tEquip.shoulders.equipmentID]
        + pChestStats.baseSpeed[tEquip.chest.equipmentID]
        + pRArmStats.baseSpeed[tEquip.rightArm.equipmentID]
        + pLArmStats.baseSpeed[tEquip.leftArm.equipmentID]
        + pGlovesStats.baseSpeed[tEquip.gloves.equipmentID]
        + pPantsStats.baseSpeed[tEquip.pants.equipmentID]
        + pRLegStats.baseSpeed[tEquip.rightLeg.equipmentID]
        + pLLegStats.baseSpeed[tEquip.leftLeg.equipmentID]
        + pBootsStats.baseSpeed[tEquip.boots.equipmentID]

        + pRWeaponStats.baseSpeed[tEquip.rightWeapon.equipmentID]
        + pLWeaponStats.baseSpeed[tEquip.leftWeapon.equipmentID]

    --== HP ==--
    tStats.maxHP = tStats.vitality * 5
    if tStats.hp > tStats.maxHP then
        tStats.hp = tStats.maxHP        
    end

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

function healToFull(_target)
    _target.pilot.hp = _target.pilot.maxHP
    _target.pilot.focus = _target.pilot.maxFocus
    _target.mech.hp = _target.mech.maxHP
    _target.mech.focus = _target.mech.maxFocus
end