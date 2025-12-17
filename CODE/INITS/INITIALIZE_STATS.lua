-- Stat initialization
local AllyClass = {}
AllyClass.__index = AllyClass

-- TODO: change to baseClass
-- attempt to have function for PLAYER extension and another function for ENEMY extension
-- this way i dont have to recreate this array and can split out fields...

-- Also, add abilities array elsewhere to handle all that

function AllyClass:new(
          _name, _x, _y
        , _inParty, _inBattle, _isMechedUp
        , _facingDirection, _currentAnimState, _currentAnimArrIndex

        , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , _pilotAttack
        , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
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

        , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , _mechAttack
        , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
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
    local tAC = {} -- tAC = tempAllyClass
    setmetatable(tAC, AllyClass)

    tAC.name, tAC.x, tAC.y = _name, _x, _y
    tAC.inParty, tAC.inBattle, tAC.isMechedUp = _inParty, _inBattle, _isMechedUp
    tAC.facingDirection, tAC.currentAnimState, tAC.currentAnimArrIndex = _facingDirection, _currentAnimState, _currentAnimArrIndex

    tAC.pilot = {
        hp = _pilotHP, maxHP = _pilotMaxHP, focus = _pilotFocus, maxFocus =  _pilotMaxFocus
        , attack = _pilotAttack
        , speed = _pilotSpeed, startTurnCharge = _pilotStartTurnChg, currentTurnCharge = _pilotCurrTurnChg, maxTurnCharge = _pilotMaxTurnChg
        , abilities = {
              ability_01 = _pilotAbility_01, ability_02 = _pilotAbility_02, ability_03 = _pilotAbility_03, ability_04 = _pilotAbility_04
            , ability_05 = _pilotAbility_05, ability_06 = _pilotAbility_06, ability_07 = _pilotAbility_07, ability_08 = _pilotAbility_08
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
        hp = _mechHP, maxHP = _mechMaxHP, focus = _mechFocus, maxFocus = _mechMaxFocus
        , attack = _mechAttack
        , speed = _mechSpeed, startTurnCharge = _mechStartTurnChg, currentTurnCharge = _mechCurrTurnChg, maxTurnCharge = _mechMaxTurnChg
        , abilities = {
              ability_01 = _mechAbility_01, ability_02 = _mechAbility_02, ability_03 = _mechAbility_03, ability_04 = _mechAbility_04
            , ability_05 = _mechAbility_05, ability_06 = _mechAbility_06, ability_07 = _mechAbility_07, ability_08 = _mechAbility_08
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

function AllyClass:PrintData()
    print("\n--==+==-- AllyClass --==+==--"
        .."\nname: "..self.name.."\nx: "..self.x.."\ny: "..self.y
        .."\ninParty: "..tostring(self.inParty).."\ninBattle: "..tostring(self.inBattle).."\nisMechedUp: "..tostring(self.isMechedUp)
        .."\nfacingDirection: "..self.facingDirection.."\ncurrentAnimState: "..self.currentAnimState
        .."\ncurrentAnimArrIndex: "..self.currentAnimArrIndex
        .."\n\n--== Pilot ==--"
        .."\nHP: "..self.pilot.hp.."\nmaxHP: "..self.pilot.maxHP.."\nfocus: "..self.pilot.focus.."\nmaxFocus: "..self.pilot.maxFocus
        .."\nattack: "..self.pilot.attack
        .."\nspeed: "..self.pilot.speed.."\nstartTurnCharge: "..self.pilot.startTurnCharge
        .."\ncurrentTurnChg: "..self.pilot.currentTurnCharge.."\nmaxTurnCharge: "..self.pilot.maxTurnCharge
        .."\n\n-- Pilot Abilities --"
        .."\nability_01: "..self.pilot.abilities.ability_01.."\nability_02: "..self.pilot.abilities.ability_02
        .."\nability_03: "..self.pilot.abilities.ability_03.."\nability_04: "..self.pilot.abilities.ability_04
        .."\nability_05: "..self.pilot.abilities.ability_05.."\nability_06: "..self.pilot.abilities.ability_06
        .."\nability_07: "..self.pilot.abilities.ability_07.."\nability_08: "..self.pilot.abilities.ability_08
        .."\n\n-- Pilot Equipment --"
        .."\nhead: "..self.pilot.equipment.head.equipmentID.."\nback: "..self.pilot.equipment.back.equipmentID
        .."\nshoulders: "..self.pilot.equipment.shoulders.equipmentID.."\nchest: "..self.pilot.equipment.chest.equipmentID
        .."\nrightarm: "..self.pilot.equipment.rightArm.equipmentID.."\nleftarm: "..self.pilot.equipment.leftArm.equipmentID
        .."\nrightWeapon: "..self.pilot.equipment.rightWeapon.equipmentID.."\nleftWeapon: "..self.pilot.equipment.leftWeapon.equipmentID
        .."\ngloves: "..self.pilot.equipment.gloves.equipmentID.."\npants: "..self.pilot.equipment.pants.equipmentID
        .."\nrightLeg: "..self.pilot.equipment.rightLeg.equipmentID.."\nleftLeg: "..self.pilot.equipment.leftLeg.equipmentID
        .."\nboots: "..self.pilot.equipment.boots.equipmentID
        .."\n\n--== Mech ==--"
        .."\nHP: "..self.mech.hp.."\nmaxHP: "..self.mech.maxHP.."\nfocus: "..self.mech.focus.."\nmaxFocus: "..self.mech.maxFocus
        .."\nattack: "..self.mech.attack
        .."\nspeed: "..self.mech.speed.."\nstartTurnCharge: "..self.mech.startTurnCharge
        .."\ncurrentTurnChg: "..self.mech.currentTurnCharge.."\nmaxTurnCharge: "..self.mech.maxTurnCharge
        .."\n\n-- Mech Abilities --"
        .."\nability_01: "..self.mech.abilities.ability_01.."\nability_02: "..self.mech.abilities.ability_02
        .."\nability_03: "..self.mech.abilities.ability_03.."\nability_04: "..self.mech.abilities.ability_04
        .."\nability_05: "..self.mech.abilities.ability_05.."\nability_06: "..self.mech.abilities.ability_06
        .."\nability_07: "..self.mech.abilities.ability_07.."\nability_08: "..self.mech.abilities.ability_08
        .."\n\n-- Mech Equipment --"
        .."\nhead: "..self.mech.equipment.head.equipmentID.."\nback: "..self.mech.equipment.back.equipmentID
        .."\nrightShoulder: "..self.mech.equipment.rightShoulder.equipmentID.."\nleftShoulder: "..self.mech.equipment.leftShoulder.equipmentID
        .."\nchassis: "..self.mech.equipment.chassis.equipmentID
        .."\nrightarm: "..self.mech.equipment.rightArm.equipmentID.."\nleftarm: "..self.mech.equipment.leftArm.equipmentID
        .."\nrightWeapon: "..self.mech.equipment.rightWeapon.equipmentID.."\nleftWeapon: "..self.mech.equipment.leftWeapon.equipmentID
        .."\nrightLeg: "..self.mech.equipment.rightLeg.equipmentID.."\nleftLeg: "..self.mech.equipment.leftLeg.equipmentID
        .."\nauxillary: "..self.mech.equipment.auxillary.equipmentID.."\nthrusters: "..self.mech.equipment.thrusters.equipmentID
        .."\n"
    )
end

--#region testClass
local testAllyClass = AllyClass:new(
    --   _name, _x, _y
    "Test", 128, 128
    -- , _inParty, _inBattle, _isMechedUp
    , true, false, false
    -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
    , "Down", "Idle", 3 -- 3 is IdleDown

    --== Pilot Stats ==--
    -- , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
    , 10, 10, 25, 25
    -- , _pilotAttack
    , 1
    -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
    , 10, 10, 0, 150
    -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
    -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
    , 2, 3, 1, 1
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
    -- , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
    , 15, 15, 25, 25
    -- , _mechAttack
    , 1
    -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
    , 10, 30, 0, 100
    -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
    -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
    , 2, 3, 1, 1
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
testAllyClass:PrintData()
--#endregion test

function initParty()
    --==+==--
    --#region Marc
    Marc = AllyClass:new(
        --   _name, _x, _y
        "Marc", (WindWidth / 2 + tileWH), (WindHeight / 2 + tileWH)
        -- , _inParty, _inBattle, _isMechedUp
        , true, false, false
        -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
        , "Down", "Idle", 3 -- 3 is IdleDown

        --== Pilot Stats ==--
        -- , _pilotHP, _pilotMaxHP, _pilotFocus, _pilotMaxFocus
        , 10, 10, 25, 25
        -- , _pilotAttack
        , 1
        -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , 10, 10, 0, 150
        -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , 2, 3, 1, 1
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
        -- , _mechHP, _mechMaxHP, _mechFocus, _mechMaxFocus
        , 15, 15, 25, 25
        -- , _mechAttack
        , 1
        -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , 10, 30, 0, 100
        -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , 2, 3, 1, 1
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
    --#endregion Marc  
    --#region BISHOP
    BISHOP = {
          x = WindWidth / 2 + tileWH
        , y = WindHeight / 2 + tileWH
        , mapTileX = 8
        , mapTileY = 8
        , inParty = true
        , name = "BISHOP"
        , pilot = {
              hp = 15
            , maxHP = 15
            , focus = 25
            , maxFocus = 25
            , speed = 10
            , startTurnCharge = 0
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {2,3,1,1,1,1,1,1}
        }
        , isMechedUp = true
        , mech = {
              hp = 35
            , maxHP = 35
            , focus = 15
            , maxFocus = 15
            , speed = 15
            , startTurnCharge = 50
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {2,3,1,1,1,1,1,1}
        }
        , facingDirection = "Down"
        , currentAnimState = "Idle"
        , currentAnimArrIndex = 3 -- Facing Down
        , inBattle = false
        , animationArray = {
              VanityNames = {
                "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
            }
            , Frames = {
                4,4,4,4
            }
            , Direction = {
                "Up", "Left", "Down", "Right"
            }
            , State = {
                "Idle", "Idle", "Idle", "Idle"
            }
            , SpriteSheetRow = {
                0, 1, 2, 3
            }
            , Animations = { -- loop this later
                {}, {}, {}, {}
            }
        }
    }
    --#endregion BISHOP
    --#region Alfred
    Alfred = {
          x = WindWidth / 2 + tileWH
        , y = WindHeight / 2 + tileWH
        , mapTileX = 8
        , mapTileY = 8
        , inParty = true
        , name = "Alfred"
        , pilot = {
              hp = 10
            , maxHP = 10
            , focus = 35
            , maxFocus = 35
            , speed = 11
            , startTurnCharge = 0
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {2,3,1,1,1,1,1,1}
        }
        , isMechedUp = false
        , mech = {
              hp = 17
            , maxHP = 17
            , focus = 30
            , maxFocus = 30
            , speed = 9
            , startTurnCharge = 0
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {2,3,1,1,1,1,1,1}
        }
        , facingDirection = "Down"
        , currentAnimState = "Idle"
        , currentAnimArrIndex = 3 -- Facing Down
        , inBattle = false
        , animationArray = {
              VanityNames = {
                "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
            }
            , Frames = {
                4,4,4,4
            }
            , Direction = {
                "Up", "Left", "Down", "Right"
            }
            , State = {
                "Idle", "Idle", "Idle", "Idle"
            }
            , SpriteSheetRow = {
                0, 1, 2, 3
            }
            , Animations = { -- loop this later
                {}, {}, {}, {}
            }
        }
    }
    --#endregion Alfred

    Marc.Animations = mainAnimationArray:BuildAnimations(ssPilot_ALL_Nothing)

    player = Marc
    player.mapTileX, player.mapTileY = 1, 1

    for i = 1, #BISHOP.animationArray.VanityNames, 1 do
        for j = 1, BISHOP.animationArray.Frames[i], 1 do
            BISHOP.animationArray.Animations[i][j] = love.graphics.newQuad(
                tileWH*(j-1), BISHOP.animationArray.SpriteSheetRow[i] * tileWH, tileWH, tileWH, spritesheetPlayer:getDimensions()
            )
        end
    end
    for i = 1, #Alfred.animationArray.VanityNames, 1 do
        for j = 1, Alfred.animationArray.Frames[i], 1 do
            Alfred.animationArray.Animations[i][j] = love.graphics.newQuad(
                tileWH*(j-1), Alfred.animationArray.SpriteSheetRow[i] * tileWH, tileWH, tileWH, spritesheetPlayer:getDimensions()
            )
        end
    end

    player.playerInitX, player.playerInitY = player.x, player.y
    player.mapTrueX, player.mapTrueY = (player.mapTileX * tileWH) , (player.mapTileY * tileWH)

    ally1 = BISHOP
    ally2 = Alfred
end

function initEnemies()
    currentBattleEnemies = {
        "Rat"
    }

    Rat = {
          x = WindWidth / 2 + tileWH
        , y = WindHeight / 2 + tileWH
        , name = "Rattimus"
        , unitID = 01
        , pilot = {
              hp = 5
            , maxHP = 5
            , focus = 15
            , maxFocus = 15
            , speed = 5
            , startTurnCharge = 70
            , currentTurnCharge = 0
            , maxTurnCharge = 75
            , abilities = {}
            , xpValue = 5
            , aiScript = function () end
        }
        , isMechedUp = false
        , mech = {
              hp = 8
            , maxHP = 8
            , focus = 20
            , maxFocus = 20
            , speed = 5
            , startTurnCharge = 45
            , currentTurnCharge = 0
            , maxTurnCharge = 50
            , abilities = {}
            , xpValue = 15
            , aiScript = function () end
        }
        , facingDirection = "Left"
        , currentAnimState = "Idle"
        , currentAnimArrIndex = 2 -- Facing Down
        , inBattle = false
        , animationArray = {
              VanityNames = {
                "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
            }
            , Frames = {
                4,4,4,4
            }
            , Direction = {
                "Up", "Left", "Down", "Right"
            }
            , State = {
                "Idle", "Idle", "Idle", "Idle"
            }
            , SpriteSheetRow = {
                0, 1, 2, 3
            }
            , Animations = { -- loop this later
                {}, {}, {}, {}
            }
        }
    }
    enemyIDArr = {
            ID = {01}
        , Arr = {Rat}
    }
end