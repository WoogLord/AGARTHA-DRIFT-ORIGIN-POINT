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
        + pHeadStats.baseHP[tEquip.head.equipmentID]
        + pBackStats.baseHP[tEquip.back.equipmentID]
        + pShouldersStats.baseHP[tEquip.shoulders.equipmentID]
        + pChestStats.baseHP[tEquip.chest.equipmentID]
        + pRArmStats.baseHP[tEquip.rightArm.equipmentID]
        + pLArmStats.baseHP[tEquip.leftArm.equipmentID]
        + pGlovesStats.baseHP[tEquip.gloves.equipmentID]
        + pPantsStats.baseHP[tEquip.pants.equipmentID]
        + pRLegStats.baseHP[tEquip.rightLeg.equipmentID]
        + pLLegStats.baseHP[tEquip.leftLeg.equipmentID]
        + pBootsStats.baseHP[tEquip.boots.equipmentID]

        + pRWeaponStats.baseHP[tEquip.rightWeapon.equipmentID]
        + pLWeaponStats.baseHP[tEquip.leftWeapon.equipmentID]

    --== Attack ==--
    tStats.attack = 1 
        + pHeadStats.baseAttack[tEquip.head.equipmentID]
        + pBackStats.baseAttack[tEquip.back.equipmentID]
        + pShouldersStats.baseAttack[tEquip.shoulders.equipmentID]
        + pChestStats.baseAttack[tEquip.chest.equipmentID]
        + pRArmStats.baseAttack[tEquip.rightArm.equipmentID]
        + pLArmStats.baseAttack[tEquip.leftArm.equipmentID]
        + pGlovesStats.baseAttack[tEquip.gloves.equipmentID]
        + pPantsStats.baseAttack[tEquip.pants.equipmentID]
        + pRLegStats.baseAttack[tEquip.rightLeg.equipmentID]
        + pLLegStats.baseAttack[tEquip.leftLeg.equipmentID]
        + pBootsStats.baseAttack[tEquip.boots.equipmentID]

        + pRWeaponStats.baseAttack[tEquip.rightWeapon.equipmentID]
        + pLWeaponStats.baseAttack[tEquip.leftWeapon.equipmentID]

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