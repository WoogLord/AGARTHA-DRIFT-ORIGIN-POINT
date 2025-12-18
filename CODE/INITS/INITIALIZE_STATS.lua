-- Stat initialization
local BaseClass = {}
BaseClass.__index = BaseClass

-- TODO: change to baseClass
-- attempt to have function for PLAYER extension and another function for ENEMY extension
-- this way i dont have to recreate this array and can split out fields...

-- Also, add abilities array elsewhere to handle all that

function BaseClass:new(
          _name, _x, _y
        , _inParty, _inBattle, _isMechedUp
        , _facingDirection, _currentAnimState, _currentAnimArrIndex
    
        , _pilotLevel, _pilotXP
        , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , _pilotVitality, _pilotStrength, _pilotInstinct
        , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , _pilotAbility_01Level, _pilotAbility_02Level, _pilotAbility_03Level, _pilotAbility_04Level
        , _pilotAbility_05Level, _pilotAbility_06Level, _pilotAbility_07Level, _pilotAbility_08Level
        , _pilotEquipmentHead, _pilotEquipmentBack
        , _pilotEquipmentShoulders, _pilotEquipmentChest
        , _pilotEquipmentRArm, _pilotEquipmentLArm
        , _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
        , _pilotEquipmentGloves, _pilotEquipmentPants
        , _pilotEquipmentRLeg, _pilotEquipmentLLeg
        , _pilotEquipmentBoots
        , _pilotEquipmentHeadXP, _pilotEquipmentBackXP
        , _pilotEquipmentShouldersXP, _pilotEquipmentChestXP
        , _pilotEquipmentRArmXP, _pilotEquipmentLArmXP
        , _pilotEquipmentRWeaponXP, _pilotEquipmentLWeaponXP
        , _pilotEquipmentGlovesXP, _pilotEquipmentPantsXP
        , _pilotEquipmentRLegXP, _pilotEquipmentLLegXP
        , _pilotEquipmentBootsXP

        , _mechLevel, _mechXP
        , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , _mechVitality, _mechStrength, _mechInstinct
        , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , _mechAbility_01Level, _mechAbility_02Level, _mechAbility_03Level, _mechAbility_04Level
        , _mechAbility_05Level, _mechAbility_06Level, _mechAbility_07Level, _mechAbility_08Level
        , _mechEquipmentHead, _mechEquipmentBack
        , _mechEquipmentRShoulder, _mechEquipmentLShoulder
        , _mechEquipmentChassis
        , _mechEquipmentRArm, _mechEquipmentLArm
        , _mechEquipmentRWeapon, _mechEquipmentLWeapon
        , _mechEquipmentRLeg, _mechEquipmentLLeg
        , _mechEquipmentAuxillary, _mechEquipmentThrusters
        , _mechEquipmentHeadXP, _mechEquipmentBackXP
        , _mechEquipmentRShoulderXP, _mechEquipmentLShoulderXP
        , _mechEquipmentChassisXP
        , _mechEquipmentRArmXP, _mechEquipmentLArmXP
        , _mechEquipmentRWeaponXP, _mechEquipmentLWeaponXP
        , _mechEquipmentRLegXP, _mechEquipmentLLegXP
        , _mechEquipmentAuxillaryXP, _mechEquipmentThrustersXP
    )
    local tAC = {} -- tAC = tempBaseClass
    setmetatable(tAC, BaseClass)

    tAC.name, tAC.x, tAC.y = _name, _x, _y
    tAC.inParty, tAC.inBattle, tAC.isMechedUp = _inParty, _inBattle, _isMechedUp
    tAC.facingDirection, tAC.currentAnimState, tAC.currentAnimArrIndex = _facingDirection, _currentAnimState, _currentAnimArrIndex

    tAC.pilot = {
        level = _pilotLevel, xp = _pilotXP
        , hp = _pilotHP, maxHP = _pilotMaxHP, focus = _pilotFocus, maxFocus =  _pilotMaxFocus
        , vitality = _pilotVitality, strength = _pilotStrength, instinct = _pilotInstinct
        , speed = _pilotSpeed, startTurnCharge = _pilotStartTurnChg, currentTurnCharge = _pilotCurrTurnChg, maxTurnCharge = _pilotMaxTurnChg
        , abilities = {
              {abilityID = _pilotAbility_01, abilityLevel = _pilotAbility_01Level}
            , {abilityID = _pilotAbility_02, abilityLevel = _pilotAbility_02Level}
            , {abilityID = _pilotAbility_03, abilityLevel = _pilotAbility_03Level}
            , {abilityID = _pilotAbility_04, abilityLevel = _pilotAbility_04Level}
            , {abilityID = _pilotAbility_05, abilityLevel = _pilotAbility_05Level}
            , {abilityID = _pilotAbility_06, abilityLevel = _pilotAbility_06Level}
            , {abilityID = _pilotAbility_07, abilityLevel = _pilotAbility_07Level}
            , {abilityID = _pilotAbility_08, abilityLevel = _pilotAbility_08Level}
        }
        , equipment = {
              head = {equipmentID = _pilotEquipmentHead, itemXp = _pilotEquipmentHeadXP}
            , back = {equipmentID = _pilotEquipmentBack, itemXp = _pilotEquipmentBackXP} 
            , shoulders = {equipmentID = _pilotEquipmentShoulders, itemXp = _pilotEquipmentShouldersXP}
            , chest = {equipmentID = _pilotEquipmentChest, itemXp = _pilotEquipmentChestXP}
            , rightArm = {equipmentID = _pilotEquipmentRArm, itemXp = _pilotEquipmentRArmXP}
            , leftArm = {equipmentID = _pilotEquipmentLArm, itemXp = _pilotEquipmentLArmXP}
            , rightWeapon = {equipmentID = _pilotEquipmentRWeapon, itemXp = _pilotEquipmentRWeaponXP}
            , leftWeapon = {equipmentID = _pilotEquipmentLWeapon, itemXp = _pilotEquipmentLWeaponXP}
            , gloves = {equipmentID = _pilotEquipmentGloves, itemXp = _pilotEquipmentGlovesXP}
            , pants = {equipmentID = _pilotEquipmentPants, itemXp = _pilotEquipmentPantsXP}
            , rightLeg = {equipmentID = _pilotEquipmentRLeg, itemXp = _pilotEquipmentRLegXP}
            , leftLeg = {equipmentID = _pilotEquipmentLLeg, itemXp = _pilotEquipmentLLegXP}
            , boots = {equipmentID = _pilotEquipmentBoots, itemXp = _pilotEquipmentBootsXP}
        }
    }
    tAC.mech = {
        level = _mechLevel, xp = _mechXP
        , hp = _mechHP, maxHP = _mechMaxHP, focus = _mechFocus, maxFocus = _mechMaxFocus
        , vitality = _mechVitality, strength = _mechStrength, instinct = _mechInstinct
        , speed = _mechSpeed, startTurnCharge = _mechStartTurnChg, currentTurnCharge = _mechCurrTurnChg, maxTurnCharge = _mechMaxTurnChg
        , abilities = {
              {abilityID = _mechAbility_01, abilityLevel = _mechAbility_01Level}
            , {abilityID = _mechAbility_02, abilityLevel = _mechAbility_02Level}
            , {abilityID = _mechAbility_03, abilityLevel = _mechAbility_03Level}
            , {abilityID = _mechAbility_04, abilityLevel = _mechAbility_04Level}
            , {abilityID = _mechAbility_05, abilityLevel = _mechAbility_05Level}
            , {abilityID = _mechAbility_06, abilityLevel = _mechAbility_06Level}
            , {abilityID = _mechAbility_07, abilityLevel = _mechAbility_07Level}
            , {abilityID = _mechAbility_08, abilityLevel = _mechAbility_08Level}
        }
        , equipment = {
              head = {equipmentID = _mechEquipmentHead, itemXp = _mechEquipmentHeadXP}
            , back = {equipmentID = _mechEquipmentBack, itemXp = _mechEquipmentBackXP}
            , rightShoulder = {equipmentID = _mechEquipmentRShoulder, itemXp = _mechEquipmentRShoulderXP}
            , leftShoulder = {equipmentID = _mechEquipmentLShoulder, itemXp = _mechEquipmentLShoulderXP}
            , chassis = {equipmentID = _mechEquipmentChassis, itemXp = _mechEquipmentChassisXP}
            , rightArm = {equipmentID = _mechEquipmentRArm, itemXp = _mechEquipmentRArmXP}
            , leftArm = {equipmentID = _mechEquipmentLArm, itemXp = _mechEquipmentLArmXP}
            , rightWeapon = {equipmentID = _mechEquipmentRWeapon, itemXp = _mechEquipmentRWeaponXP}
            , leftWeapon = {equipmentID = _mechEquipmentLWeapon, itemXp = _mechEquipmentLWeaponXP}
            , rightLeg = {equipmentID = _mechEquipmentRLeg, itemXp = _mechEquipmentRLegXP}
            , leftLeg = {equipmentID = _mechEquipmentLLeg, itemXp = _mechEquipmentLLegXP}
            , auxillary = {equipmentID = _mechEquipmentAuxillary, itemXp = _mechEquipmentAuxillaryXP}
            , thrusters = {equipmentID = _mechEquipmentThrusters, itemXp = _mechEquipmentThrustersXP}
        }
    }
    return tAC
end

function BaseClass:PrintData()
    local print1 = "\n--==+==-- BaseClass --==+==--"
        .."\nname: "..self.name.."\nx: "..self.x.."\ny: "..self.y
        .."\ninParty: "..tostring(self.inParty).."\ninBattle: "..tostring(self.inBattle).."\nisMechedUp: "..tostring(self.isMechedUp)
        .."\nfacingDirection: "..self.facingDirection.."\ncurrentAnimState: "..self.currentAnimState
        .."\ncurrentAnimArrIndex: "..self.currentAnimArrIndex
        .."\n\n--== Pilot ==--"
        .."\nlevel: "..self.pilot.level.."\nxp: "..self.pilot.xp
        .."\nHP: "..self.pilot.hp.."\nmaxHP: "..self.pilot.maxHP.."\nfocus: "..self.pilot.focus.."\nmaxFocus: "..self.pilot.maxFocus
        .."\nvitality: "..self.pilot.vitality.."\nstrength: "..self.pilot.strength.."\ninstinct: "..self.pilot.instinct
        .."\nspeed: "..self.pilot.speed.."\nstartTurnCharge: "..self.pilot.startTurnCharge
        .."\ncurrentTurnChg: "..self.pilot.currentTurnCharge.."\nmaxTurnCharge: "..self.pilot.maxTurnCharge
        .."\n\n-- Pilot Abilities --"
        .."\nability_01: "..self.pilot.abilities[1].abilityID.."\nability_02: "..self.pilot.abilities[2].abilityID
        .."\nability_03: "..self.pilot.abilities[3].abilityID.."\nability_04: "..self.pilot.abilities[4].abilityID
        .."\nability_05: "..self.pilot.abilities[5].abilityID.."\nability_06: "..self.pilot.abilities[6].abilityID
        .."\nability_07: "..self.pilot.abilities[7].abilityID.."\nability_08: "..self.pilot.abilities[8].abilityID
        .."\nability_01Level: "..self.pilot.abilities[1].abilityLevel.."\nability_02Level: "..self.pilot.abilities[2].abilityLevel
        .."\nability_03Level: "..self.pilot.abilities[3].abilityLevel.."\nability_04Level: "..self.pilot.abilities[4].abilityLevel
        .."\nability_05Level: "..self.pilot.abilities[5].abilityLevel.."\nability_06Level: "..self.pilot.abilities[6].abilityLevel
        .."\nability_07Level: "..self.pilot.abilities[7].abilityLevel.."\nability_08Level: "..self.pilot.abilities[8].abilityLevel
        .."\n\n-- Pilot Equipment --"
        .."\nhead: "..self.pilot.equipment.head.equipmentID.."\nback: "..self.pilot.equipment.back.equipmentID
        .."\nshoulders: "..self.pilot.equipment.shoulders.equipmentID.."\nchest: "..self.pilot.equipment.chest.equipmentID
        .."\nrightarm: "..self.pilot.equipment.rightArm.equipmentID.."\nleftarm: "..self.pilot.equipment.leftArm.equipmentID
        .."\nrightWeapon: "..self.pilot.equipment.rightWeapon.equipmentID.."\nleftWeapon: "..self.pilot.equipment.leftWeapon.equipmentID
        .."\ngloves: "..self.pilot.equipment.gloves.equipmentID.."\npants: "..self.pilot.equipment.pants.equipmentID
        .."\nrightLeg: "..self.pilot.equipment.rightLeg.equipmentID.."\nleftLeg: "..self.pilot.equipment.leftLeg.equipmentID
        .."\nboots: "..self.pilot.equipment.boots.equipmentID
        .."\nheadXP: "..self.pilot.equipment.head.itemXp.."\nbackXP: "..self.pilot.equipment.back.itemXp
        .."\nshouldersXP: "..self.pilot.equipment.shoulders.itemXp.."\nchestXP: "..self.pilot.equipment.chest.itemXp
        .."\nrightarmXP: "..self.pilot.equipment.rightArm.itemXp.."\nleftarmXP: "..self.pilot.equipment.leftArm.itemXp
        .."\nrightWeaponXP: "..self.pilot.equipment.rightWeapon.itemXp.."\nleftWeaponXP: "..self.pilot.equipment.leftWeapon.itemXp
        .."\nglovesXP: "..self.pilot.equipment.gloves.itemXp.."\npantsXP: "..self.pilot.equipment.pants.itemXp
        .."\nrightLegXP: "..self.pilot.equipment.rightLeg.itemXp.."\nleftLegXP: "..self.pilot.equipment.leftLeg.itemXp
        .."\nbootsXP: "..self.pilot.equipment.boots.itemXp
    local print2 = "\n\n--== Mech ==--"
        .."\nlevel: "..self.mech.level.."\nxp: "..self.mech.xp
        .."\nHP: "..self.mech.hp.."\nmaxHP: "..self.mech.maxHP.."\nfocus: "..self.mech.focus.."\nmaxFocus: "..self.mech.maxFocus
        .."\nvitality: "..self.mech.vitality.."\nstrength: "..self.mech.strength.."\ninstinct: "..self.mech.instinct
        .."\nspeed: "..self.mech.speed.."\nstartTurnCharge: "..self.mech.startTurnCharge
        .."\ncurrentTurnChg: "..self.mech.currentTurnCharge.."\nmaxTurnCharge: "..self.mech.maxTurnCharge
        .."\n\n-- Mech Abilities --"
        .."\nability_01: "..self.mech.abilities[1].abilityID.."\nability_02: "..self.mech.abilities[2].abilityID
        .."\nability_03: "..self.mech.abilities[3].abilityID.."\nability_04: "..self.mech.abilities[4].abilityID
        .."\nability_05: "..self.mech.abilities[5].abilityID.."\nability_06: "..self.mech.abilities[6].abilityID
        .."\nability_07: "..self.mech.abilities[7].abilityID.."\nability_08: "..self.mech.abilities[8].abilityID
        .."\nability_01Level: "..self.mech.abilities[1].abilityLevel.."\nability_02Level: "..self.mech.abilities[2].abilityLevel
        .."\nability_03Level: "..self.mech.abilities[3].abilityLevel.."\nability_04Level: "..self.mech.abilities[4].abilityLevel
        .."\nability_05Level: "..self.mech.abilities[5].abilityLevel.."\nability_06Level: "..self.mech.abilities[6].abilityLevel
        .."\nability_07Level: "..self.mech.abilities[7].abilityLevel.."\nability_08Level: "..self.mech.abilities[8].abilityLevel
        .."\n\n-- Mech Equipment --"
        .."\nhead: "..self.mech.equipment.head.equipmentID.."\nback: "..self.mech.equipment.back.equipmentID
        .."\nrightShoulder: "..self.mech.equipment.rightShoulder.equipmentID.."\nleftShoulder: "..self.mech.equipment.leftShoulder.equipmentID
        .."\nchassis: "..self.mech.equipment.chassis.equipmentID
        .."\nrightarm: "..self.mech.equipment.rightArm.equipmentID.."\nleftarm: "..self.mech.equipment.leftArm.equipmentID
        .."\nrightWeapon: "..self.mech.equipment.rightWeapon.equipmentID.."\nleftWeapon: "..self.mech.equipment.leftWeapon.equipmentID
        .."\nrightLeg: "..self.mech.equipment.rightLeg.equipmentID.."\nleftLeg: "..self.mech.equipment.leftLeg.equipmentID
        .."\nauxillary: "..self.mech.equipment.auxillary.equipmentID.."\nthrusters: "..self.mech.equipment.thrusters.equipmentID
        .."\nheadXP: "..self.mech.equipment.head.itemXp.."\nbackXP: "..self.mech.equipment.back.itemXp
        .."\nrightShoulderXP: "..self.mech.equipment.rightShoulder.itemXp.."\nleftShoulderXP: "..self.mech.equipment.leftShoulder.itemXp
        .."\nchassisXP: "..self.mech.equipment.chassis.itemXp
        .."\nrightarmXP: "..self.mech.equipment.rightArm.itemXp.."\nleftarmXP: "..self.mech.equipment.leftArm.itemXp
        .."\nrightWeaponXP: "..self.mech.equipment.rightWeapon.itemXp.."\nleftWeaponXP: "..self.mech.equipment.leftWeapon.itemXp
        .."\nrightLegXP: "..self.mech.equipment.rightLeg.itemXp.."\nleftLegXP: "..self.mech.equipment.leftLeg.itemXp
        .."\nauxillaryXP: "..self.mech.equipment.auxillary.itemXp.."\nthrustersXP: "..self.mech.equipment.thrusters.itemXp
        .."\n"
    print(print1..print2
    )
end

function initParty()
    --==+==--
    --#region Marc
    Marc = BaseClass:new(
        --   _name, _x, _y
        "Marc", (WindWidth / 2 + tileWH), (WindHeight / 2 + tileWH)
        -- , _inParty, _inBattle, _isMechedUp
        , true, false, false
        -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
        , "Down", "Idle", 3 -- 3 is IdleDown

        --== Pilot Stats ==--
        -- , _pilotLevel, _pilotXP
        , 1, 0
        -- , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , 10, 10, 25, 25
        -- , _pilotVitality, _pilotStrength, _pilotInstinct
        , 5, 5, 5
        -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , 10, 10, 0, 150
        -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _pilotAbility_01Level, _pilotAbility_02Level, _pilotAbility_03Level, _pilotAbility_04Level
        -- , _pilotAbility_05Level, _pilotAbility_06Level, _pilotAbility_07Level, _pilotAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Pilot Equipment ==--
        -- , _pilotEquipmentHead, _pilotEquipmentBack, _pilotEquipmentShoulders, _pilotEquipmentChest
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _pilotEquipmentRArm, _pilotEquipmentLArm, _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
        , 1, 1, 1, 1
        -- , _pilotEquipmentGloves, _pilotEquipmentPants, _pilotEquipmentRLeg, _pilotEquipmentLLeg, _pilotEquipmentBoots
        , 2, 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0
        , 150, 0, 0, 0, 0

        --== Mech Stats ==--
        -- , _mechLevel, _mechXP
        , 1, 0
        -- , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , 15, 15, 25, 25
        -- , _mechVitality, _mechStrength, _mechInstinct
        , 5, 5, 5
        -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , 10, 30, 0, 100
        -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _mechAbility_01Level, _mechAbility_02Level, _mechAbility_03Level, _mechAbility_04Level
        -- , _mechAbility_05Level, _mechAbility_06Level, _mechAbility_07Level, _mechAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Mech Equipment ==--
        -- , _mechEquipmentHead, _mechEquipmentBack, _mechEquipmentRShoulder, _mechEquipmentLShoulder
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _mechEquipmentChassis, _mechEquipmentRArm, _mechEquipmentLArm, _mechEquipmentRWeapon, _mechEquipmentLWeapon
        , 1, 1, 1, 1, 1
        -- , _mechEquipmentRLeg, _mechEquipmentLLeg, _mechEquipmentAuxillary, _mechEquipmentThrusters
        , 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0
        , 0, 0, 0, 0
    )   
    Marc:PrintData()
    --#endregion Marc  
    --#region BISHOP
    BISHOP = BaseClass:new(
        --   _name, _x, _y
        "BISHOP", (WindWidth / 2 + tileWH), (WindHeight / 2 + tileWH)
        -- , _inParty, _inBattle, _isMechedUp
        , true, false, false
        -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
        , "Down", "Idle", 3 -- 3 is IdleDown

        --== Pilot Stats ==--
        -- , _pilotLevel, _pilotXP
        , 1, 0
        -- , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , 10, 10, 25, 25
        -- , _pilotVitality, _pilotStrength, _pilotInstinct
        , 5, 10, 0
        -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , 5, 0, 0, 150
        -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _pilotAbility_01Level, _pilotAbility_02Level, _pilotAbility_03Level, _pilotAbility_04Level
        -- , _pilotAbility_05Level, _pilotAbility_06Level, _pilotAbility_07Level, _pilotAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Pilot Equipment ==--
        -- , _pilotEquipmentHead, _pilotEquipmentBack, _pilotEquipmentShoulders, _pilotEquipmentChest
        , 1, 1, 1, 2 -- Magic numbers?  could be "Nothing"
        -- , _pilotEquipmentRArm, _pilotEquipmentLArm, _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
        , 1, 1, 1, 1
        -- , _pilotEquipmentGloves, _pilotEquipmentPants, _pilotEquipmentRLeg, _pilotEquipmentLLeg, _pilotEquipmentBoots
        , 1, 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0

        --== Mech Stats ==--
        -- , _mechLevel, _mechXP
        , 1, 0
        -- , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , 15, 15, 25, 25
        -- , _mechVitality, _mechStrength, _mechInstinct
        , 5, 15, 0
        -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , 5, 30, 0, 100
        -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _mechAbility_01Level, _mechAbility_02Level, _mechAbility_03Level, _mechAbility_04Level
        -- , _mechAbility_05Level, _mechAbility_06Level, _mechAbility_07Level, _mechAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Mech Equipment ==--
        -- , _mechEquipmentHead, _mechEquipmentBack, _mechEquipmentRShoulder, _mechEquipmentLShoulder
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _mechEquipmentChassis, _mechEquipmentRArm, _mechEquipmentLArm, _mechEquipmentRWeapon, _mechEquipmentLWeapon
        , 1, 1, 1, 1, 1
        -- , _mechEquipmentRLeg, _mechEquipmentLLeg, _mechEquipmentAuxillary, _mechEquipmentThrusters
        , 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0
        , 0, 0, 0, 0
    )   
    BISHOP:PrintData()
    --#endregion BISHOP
    --#region Alfred
    Alfred = BaseClass:new(
        --   _name, _x, _y
        "Alfred", (WindWidth / 2 + tileWH), (WindHeight / 2 + tileWH)
        -- , _inParty, _inBattle, _isMechedUp
        , true, false, false
        -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
        , "Down", "Idle", 3 -- 3 is IdleDown

        --== Pilot Stats ==--
        -- , _pilotLevel, _pilotXP
        , 1, 0
        -- , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , 10, 10, 50, 50
        -- , _pilotVitality, _pilotStrength, _pilotInstinct
        , 5, 0, 10
        -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , 15, 0, 0, 75
        -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _pilotAbility_01Level, _pilotAbility_02Level, _pilotAbility_03Level, _pilotAbility_04Level
        -- , _pilotAbility_05Level, _pilotAbility_06Level, _pilotAbility_07Level, _pilotAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Pilot Equipment ==--
        -- , _pilotEquipmentHead, _pilotEquipmentBack, _pilotEquipmentShoulders, _pilotEquipmentChest
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _pilotEquipmentRArm, _pilotEquipmentLArm, _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
        , 1, 1, 1, 1
        -- , _pilotEquipmentGloves, _pilotEquipmentPants, _pilotEquipmentRLeg, _pilotEquipmentLLeg, _pilotEquipmentBoots
        , 1, 1, 1, 1, 2
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0

        --== Mech Stats ==--
        -- , _mechLevel, _mechXP
        , 1, 0
        -- , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , 10, 10, 50, 50
        -- , _mechVitality, _mechStrength, _mechInstinct
        , 5, 0, 25
        -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , 10, 25, 0, 50
        -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _mechAbility_01Level, _mechAbility_02Level, _mechAbility_03Level, _mechAbility_04Level
        -- , _mechAbility_05Level, _mechAbility_06Level, _mechAbility_07Level, _mechAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Mech Equipment ==--
        -- , _mechEquipmentHead, _mechEquipmentBack, _mechEquipmentRShoulder, _mechEquipmentLShoulder
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _mechEquipmentChassis, _mechEquipmentRArm, _mechEquipmentLArm, _mechEquipmentRWeapon, _mechEquipmentLWeapon
        , 1, 1, 1, 1, 1
        -- , _mechEquipmentRLeg, _mechEquipmentLLeg, _mechEquipmentAuxillary, _mechEquipmentThrusters
        , 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0
        , 0, 0, 0, 0
    )   
    Alfred:PrintData()
    --#endregion Alfred

    Marc.Animations = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)

    -- Look gamer, I know this SEEMS complicated, by imagine the sheer POWER achieved by this
    -- if i can make this loopable..., imagine the customization!
    -- Marc.Animations.Pilot.Head = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.back = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.shoulders = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.chest = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.rightArm = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.leftArm = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.rightWeapon = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.leftWeapon = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.gloves = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.pants = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.rightLeg = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.leftLeg = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    -- Marc.Animations.Pilot.boots = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)

    BISHOP.Animations = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)
    Alfred.Animations = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)

    player = Marc
    player.mapTileX, player.mapTileY = 1, 1

    player.playerInitX, player.playerInitY = player.x, player.y
    player.mapTrueX, player.mapTrueY = (player.mapTileX * tileWH) , (player.mapTileY * tileWH)

    ally1 = BISHOP
    ally2 = Alfred

    statsManager(player)
    statsManager(ally1)
    statsManager(ally2)
    healToFull(player)
    healToFull(ally1)
    healToFull(ally2)
end

function initEnemies()
    currentBattleEnemies = {
        "Rat"
    }
    --#region Rat
    Rat = BaseClass:new(
        --   _name, _x, _y
        "Rattimus", (WindWidth / 2 + tileWH), (WindHeight / 2 + tileWH)
        -- , _inParty, _inBattle, _isMechedUp
        , false, false, false
        -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
        , "Left", "Idle", 3 -- 3 is IdleDown

        --== Pilot Stats ==--
        -- , _pilotLevel, _pilotXP
        , 1, 0
        -- , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , 5, 5, 15, 15
        -- , _pilotVitality, _pilotStrength, _pilotInstinct
        , 5, 5, 5
        -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , 25, 70, 0, 75
        -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _pilotAbility_01Level, _pilotAbility_02Level, _pilotAbility_03Level, _pilotAbility_04Level
        -- , _pilotAbility_05Level, _pilotAbility_06Level, _pilotAbility_07Level, _pilotAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Pilot Equipment ==--
        -- , _pilotEquipmentHead, _pilotEquipmentBack, _pilotEquipmentShoulders, _pilotEquipmentChest
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _pilotEquipmentRArm, _pilotEquipmentLArm, _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
        , 1, 1, 1, 1
        -- , _pilotEquipmentGloves, _pilotEquipmentPants, _pilotEquipmentRLeg, _pilotEquipmentLLeg, _pilotEquipmentBoots
        , 1, 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0

        --== Mech Stats ==--
        -- , _mechLevel, _mechXP
        , 1, 0
        -- , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , 10, 10, 50, 50
        -- , _mechVitality, _mechStrength, _mechInstinct
        , 5, 0, 25
        -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , 10, 25, 0, 50
        -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , 2, 3, 1, 1
        , 1, 1, 1, 1
        -- , _mechAbility_01Level, _mechAbility_02Level, _mechAbility_03Level, _mechAbility_04Level
        -- , _mechAbility_05Level, _mechAbility_06Level, _mechAbility_07Level, _mechAbility_08Level
        , 1, 1, 1, 1
        , 1, 1, 1, 1

        --== Mech Equipment ==--
        -- , _mechEquipmentHead, _mechEquipmentBack, _mechEquipmentRShoulder, _mechEquipmentLShoulder
        , 1, 1, 1, 1 -- Magic numbers?  could be "Nothing"
        -- , _mechEquipmentChassis, _mechEquipmentRArm, _mechEquipmentLArm, _mechEquipmentRWeapon, _mechEquipmentLWeapon
        , 1, 1, 1, 1, 1
        -- , _mechEquipmentRLeg, _mechEquipmentLLeg, _mechEquipmentAuxillary, _mechEquipmentThrusters
        , 1, 1, 1, 1
        -- xp
        , 0, 0, 0, 0
        , 0, 0, 0, 0, 0
        , 0, 0, 0, 0
    )   
    Rat:PrintData()

    --#endregion
    Rat.xpValue = 5
    Rat.unitID = 01
    enemyIDArr = {
            ID = {01}
        , Arr = {Rat}
    }
end