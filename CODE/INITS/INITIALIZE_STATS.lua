-- Stat initialization
local AllyClass = {}
AllyClass.__index = AllyClass

function AllyClass:new(
          _name, _x, _y
        , _inParty, _inBattle, _isMechedUp
        , _facingDirection, _currentAnimState, _currentAnimArrIndex

        , _pilotHP, _pilotMaxHP, _pilotStamina, _pilotMaxStam
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

        , _mechHP, _mechMaxHP, _mechHeat, _mechMaxHeat
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
    )
    local tAC = {} -- tAC = tempAllyClass
    setmetatable(tAC, AllyClass)

    tAC.name, tAC.x, tAC.y = _name, _x, _y
    tAC.inParty, tAC.inBattle, tAC.isMechedUp = _inParty, _inBattle, _isMechedUp
    tAC.facingDirection, tAC.currentAnimState, tAC.currentAnimArrIndex = _facingDirection, _currentAnimState, _currentAnimArrIndex

    tAC.pilot = {
        hp = _pilotHP, maxHP = _pilotMaxHP, stamina = _pilotStamina, maxStam =  _pilotMaxStam
        , speed = _pilotSpeed, startTurnCharge = _pilotStartTurnChg, currentTurnCharge = _pilotCurrTurnChg, maxTurnCharge = _pilotMaxTurnChg
        , abilities = {
              ability_01 = _pilotAbility_01, ability_02 = _pilotAbility_02, ability_03 = _pilotAbility_03, ability_04 = _pilotAbility_04
            , ability_05 = _pilotAbility_05, ability_06 = _pilotAbility_06, ability_07 = _pilotAbility_07, ability_08 = _pilotAbility_08
        }
        , equipment = {
              head = _pilotEquipmentHead, back = _pilotEquipmentBack
            , shoulders = _pilotEquipmentShoulders, chest = _pilotEquipmentChest
            , rightArm = _pilotEquipmentRArm, leftArm = _pilotEquipmentLArm
            , rightWeapon = _pilotEquipmentRWeapon, leftWeapon = _pilotEquipmentLWeapon
            , gloves = _pilotEquipmentGloves, pants = _pilotEquipmentPants
            , rightLeg = _pilotEquipmentRLeg, leftLeg = _pilotEquipmentLLeg
            , boots = _pilotEquipmentBoots
        }
    }
    tAC.mech = {
        hp = _mechHP, maxHP = _mechMaxHP, heat = _mechHeat, maxHeat = _mechMaxHeat
        , speed = _mechSpeed, startTurnCharge = _mechStartTurnChg, currentTurnCharge = _mechCurrTurnChg, maxTurnCharge = _mechMaxTurnChg
        , abilities = {
              ability_01 = _mechAbility_01, ability_02 = _mechAbility_02, ability_03 = _mechAbility_03, ability_04 = _mechAbility_04
            , ability_05 = _mechAbility_05, ability_06 = _mechAbility_06, ability_07 = _mechAbility_07, ability_08 = _mechAbility_08
        }
        , equipment = {
              head = _mechEquipmentHead, back = _mechEquipmentBack
            , rightShoulder = _mechEquipmentRShoulder, leftShoulder = _mechEquipmentLShoulder
            , chassis = _mechEquipmentChassis
            , rightarm = _mechEquipmentRArm, leftarm = _mechEquipmentLArm
            , rightWeapon = _mechEquipmentRWeapon, leftWeapon = _mechEquipmentLWeapon
            , rightLeg = _mechEquipmentRLeg, leftLeg = _mechEquipmentLLeg
            , auxillary = _mechEquipmentAuxillary, thrusters = _mechEquipmentThrusters
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
        .."\nHP: "..self.pilot.hp.."\nmaxHP: "..self.pilot.maxHP.."\nstamina: "..self.pilot.stamina.."\nmaxStam: "..self.pilot.maxStam
        .."\nspeed: "..self.pilot.speed.."\nstartTurnCharge: "..self.pilot.startTurnCharge
        .."\ncurrentTurnChg: "..self.pilot.currentTurnCharge.."\nmaxTurnCharge: "..self.pilot.maxTurnCharge
        .."\n\n-- Pilot Abilities --"
        .."\nability_01: "..self.pilot.abilities.ability_01.."\nability_02: "..self.pilot.abilities.ability_02
        .."\nability_03: "..self.pilot.abilities.ability_03.."\nability_04: "..self.pilot.abilities.ability_04
        .."\nability_05: "..self.pilot.abilities.ability_05.."\nability_06: "..self.pilot.abilities.ability_06
        .."\nability_07: "..self.pilot.abilities.ability_07.."\nability_08: "..self.pilot.abilities.ability_08
        .."\n\n-- Pilot Equipment --"
        .."\nhead: "..self.pilot.equipment.head.."\nback: "..self.pilot.equipment.back
        .."\nshoulders: "..self.pilot.equipment.shoulders.."\nchest: "..self.pilot.equipment.chest
        .."\nrightarm: "..self.pilot.equipment.rightArm.."\nleftarm: "..self.pilot.equipment.leftArm
        .."\nrightWeapon: "..self.pilot.equipment.rightWeapon.."\nleftWeapon: "..self.pilot.equipment.leftWeapon
        .."\ngloves: "..self.pilot.equipment.gloves.."\npants: "..self.pilot.equipment.pants
        .."\nrightLeg: "..self.pilot.equipment.rightLeg.."\nleftLeg: "..self.pilot.equipment.leftLeg
        .."\nboots: "..self.pilot.equipment.boots
        .."\n\n--== Mech ==--"
        .."\nHP: "..self.mech.hp.."\nmaxHP: "..self.mech.maxHP.."\nheat: "..self.mech.heat.."\nmaxHeat: "..self.mech.maxHeat
        .."\nspeed: "..self.mech.speed.."\nstartTurnCharge: "..self.mech.startTurnCharge
        .."\ncurrentTurnChg: "..self.mech.currentTurnCharge.."\nmaxTurnCharge: "..self.mech.maxTurnCharge
        .."\n\n-- Mech Abilities --"
        .."\nability_01: "..self.mech.abilities.ability_01.."\nability_02: "..self.mech.abilities.ability_02
        .."\nability_03: "..self.mech.abilities.ability_03.."\nability_04: "..self.mech.abilities.ability_04
        .."\nability_05: "..self.mech.abilities.ability_05.."\nability_06: "..self.mech.abilities.ability_06
        .."\nability_07: "..self.mech.abilities.ability_07.."\nability_08: "..self.mech.abilities.ability_08
        .."\n\n-- Mech Equipment --"
        .."\nhead: "..self.mech.equipment.head.."\nback: "..self.mech.equipment.back
        .."\nrightShoulder: "..self.mech.equipment.rightShoulder.."\nleftShoulder: "..self.mech.equipment.leftShoulder
        .."\nchassis: "..self.mech.equipment.chassis
        .."\nrightarm: "..self.mech.equipment.rightarm.."\nleftarm: "..self.mech.equipment.leftarm
        .."\nrightWeapon: "..self.mech.equipment.rightWeapon.."\nleftWeapon: "..self.mech.equipment.leftWeapon
        .."\nrightLeg: "..self.mech.equipment.rightLeg.."\nleftLeg: "..self.mech.equipment.leftLeg
        .."\nauxillary: "..self.mech.equipment.auxillary.."\nthrusters: "..self.mech.equipment.thrusters
        .."\n"
    )
end

local testAllyClass = AllyClass:new(
    --   _name, _x, _y
    "Test", 128, 128
    -- , _inParty, _inBattle, _isMechedUp
    , true, false, false
    -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
    , "Down", "Idle", 3 -- 3 is IdleDown

    --== Pilot Stats ==--
    -- , _pilotHP, _pilotMaxHP, _pilotStamina, _pilotMaxStam
    , 10, 10, 25, 25
    -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
    , 10, 10, 0, 150
    -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
    -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
    , 1, 2, 0, 0
    , 0, 0, 0, 0

    --== Pilot Equipment ==--
    -- , _pilotEquipmentHead, _pilotEquipmentBack, _pilotEquipmentShoulders, _pilotEquipmentChest
    , 0, 0, 0, 0 -- Magic numbers?  could be "Nothing"
    -- , _pilotEquipmentRArm, _pilotEquipmentLArm, _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
    , 0, 0, 0, 0
    -- , _pilotEquipmentGloves_pilotEquipmentPants, _pilotEquipmentRLeg, _pilotEquipmentLLeg, _pilotEquipmentBoots
    , 0, 0, 0, 0, 0

    --== Mech Stats ==--
    -- , _mechHP, _mechMaxHP, _mechHeat, _mechMaxHeat
    , 15, 15, 25, 25
    -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
    , 10, 30, 0, 100
    -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
    -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
    , 1, 2, 0, 0
    , 0, 0, 0, 0

    --== Mech Equipment ==--
    -- , _mechEquipmentHead, _mechEquipmentBack, _mechEquipmentRShoulder, _mechEquipmentLShoulder
    , 0, 0, 0, 0 -- Magic numbers?  could be "Nothing"
    -- , _mechEquipmentChassis, _mechEquipmentRArm, _mechEquipmentLArm, _mechEquipmentRWeapon, _mechEquipmentLWeapon
    , 0, 0, 0, 0, 0
    -- , _mechEquipmentRLeg, _mechEquipmentLLeg, _mechEquipmentAuxillary, _mechEquipmentThrusters
    , 0, 0, 0, 0
)
testAllyClass:PrintData()

function initParty()
    --==+==--
    Marc = AllyClass:new(
        --   _name, _x, _y
        "Marc", (WindWidth / 2 + ssWidth), (WindHeight / 2 + ssHeight)
        -- , _inParty, _inBattle, _isMechedUp
        , true, false, false
        -- , _facingDirection, _currentAnimState, _currentAnimArrIndex
        , "Down", "Idle", 3 -- 3 is IdleDown

        --== Pilot Stats ==--
        -- , _pilotHP, _pilotMaxHP, _pilotStamina, _pilotMaxStam
        , 10, 10, 25, 25
        -- , _pilotSpeed, _pilotStartTurnChg, _pilotCurrTurnChg, _pilotMaxTurnChg
        , 10, 10, 0, 150
        -- , _pilotAbility_01, _pilotAbility_02, _pilotAbility_03, _pilotAbility_04
        -- , _pilotAbility_05, _pilotAbility_06, _pilotAbility_07, _pilotAbility_08
        , 1, 2, 0, 0
        , 0, 0, 0, 0

        --== Pilot Equipment ==--
        -- , _pilotEquipmentHead, _pilotEquipmentBack, _pilotEquipmentShoulders, _pilotEquipmentChest
        , 0, 0, 0, 0 -- Magic numbers?  could be "Nothing"
        -- , _pilotEquipmentRArm, _pilotEquipmentLArm, _pilotEquipmentRWeapon, _pilotEquipmentLWeapon
        , 0, 0, 0, 0
        -- , _pilotEquipmentGloves_pilotEquipmentPants, _pilotEquipmentRLeg, _pilotEquipmentLLeg, _pilotEquipmentBoots
        , 0, 0, 0, 0, 0

        --== Mech Stats ==--
        -- , _mechHP, _mechMaxHP, _mechHeat, _mechMaxHeat
        , 15, 15, 25, 25
        -- , _mechSpeed, _mechStartTurnChg, _mechCurrTurnChg, _mechMaxTurnChg  
        , 10, 30, 0, 100
        -- , _mechAbility_01, _mechAbility_02, _mechAbility_03, _mechAbility_04
        -- , _mechAbility_05, _mechAbility_06, _mechAbility_07, _mechAbility_08
        , 1, 2, 0, 0
        , 0, 0, 0, 0

        --== Mech Equipment ==--
        -- , _mechEquipmentHead, _mechEquipmentBack, _mechEquipmentRShoulder, _mechEquipmentLShoulder
        , 0, 0, 0, 0 -- Magic numbers?  could be "Nothing"
        -- , _mechEquipmentChassis, _mechEquipmentRArm, _mechEquipmentLArm, _mechEquipmentRWeapon, _mechEquipmentLWeapon
        , 0, 0, 0, 0, 0
        -- , _mechEquipmentRLeg, _mechEquipmentLLeg, _mechEquipmentAuxillary, _mechEquipmentThrusters
        , 0, 0, 0, 0
    )
    
    -- Marc = {
    --       x = WindWidth / 2 + ssWidth
    --     , y = WindHeight / 2 + ssHeight
    --     , mapTileX = 1
    --     , mapTileY = 1
    --     , inParty = true
    --     , name = "Marc"
    --     , pilot = {
    --           hp = 10
    --         , maxHP = 10
    --         , stamina = 25
    --         , maxStam = 25
    --         , speed = 10
    --         , startTurnCharge = 10
    --         , currentTurnCharge = 0
    --         , maxTurnCharge = 150
    --         , abilities = {}
    --     }
    --     , isMechedUp = false
    --     , mech = {
    --           hp = 10
    --         , maxHP = 10
    --         , heat = 25
    --         , maxHeat = 25
    --         , speed = 10
    --         , startTurnCharge = 30
    --         , currentTurnCharge = 0
    --         , maxTurnCharge = 100
    --         , abilities = {}
    --     }
    --     , facingDirection = "Down"
    --     , currentAnimState = "Idle"
    --     , currentAnimArrIndex = 3 -- Facing Down
    --     , inBattle = false
    --     , animationArray = {
    --           VanityNames = {
    --             "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
    --             , "WalkUp", "WalkLeft", "WalkDown", "WalkRight"
    --         }
    --         , Frames = {
    --             4,4,4,4
    --             ,4,4,4,4
    --         }
    --         , Direction = {
    --             "Up", "Left", "Down", "Right"
    --             , "Up", "Left", "Down", "Right"
    --         }
    --         , State = {
    --             "Idle", "Idle", "Idle", "Idle"
    --             , "Walk", "Walk", "Walk", "Walk"
    --         }
    --         , SpriteSheetRow = {
    --             0, 1, 2, 3
    --             ,4,5,6,7
    --         }
    --         , Animations = { -- loop this later
    --             {}, {}, {}, {}
    --             ,{}, {}, {}, {}
    --         }
    --     }
    -- }
    

    Anthony = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
        , mapTileX = 8
        , mapTileY = 8
        , inParty = true
        , name = "Anthony"
        , pilot = {
              hp = 15
            , maxHP = 15
            , stamina = 25
            , maxStam = 25
            , speed = 10
            , startTurnCharge = 0
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {}
        }
        , isMechedUp = true
        , mech = {
              hp = 35
            , maxHP = 35
            , heat = 15
            , maxHeat = 15
            , speed = 15
            , startTurnCharge = 50
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {}
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

    Alfred = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
        , mapTileX = 8
        , mapTileY = 8
        , inParty = true
        , name = "Alfred"
        , pilot = {
              hp = 10
            , maxHP = 10
            , stamina = 35
            , maxStam = 35
            , speed = 11
            , startTurnCharge = 0
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {}
        }
        , isMechedUp = false
        , mech = {
              hp = 17
            , maxHP = 17
            , heat = 30
            , maxHeat = 30
            , speed = 9
            , startTurnCharge = 0
            , currentTurnCharge = 0
            , maxTurnCharge = 100
            , abilities = {}
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

    -- this isnt a clone, just a reference...
    -- Anthony = player
    -- Anthony.name = "Anthony"
    -- Alfred = player
    -- Alfred.name = "Alfred"

    player = Marc
    player.mapTileX, player.mapTileY = 1, 1
    -- player.Animations = {{},{},{},{},{},{},{},{}}

    alphaDecay = 1
    -- for i = 1, #player.animationArray.VanityNames, 1 do
    --     for j = 1, player.animationArray.Frames[i], 1 do
    --         player.animationArray.Animations[i][j] = love.graphics.newQuad(
    --             ssWidth*(j-1), player.animationArray.SpriteSheetRow[i] * ssHeight, ssWidth, ssHeight, spritesheetPlayer:getDimensions()
    --         )
    --     end
    -- end
    player.Animations = mainAnimationArray:BuildAnimations(spritesheetPlayer)
    for i = 1, #Anthony.animationArray.VanityNames, 1 do
        for j = 1, Anthony.animationArray.Frames[i], 1 do
            Anthony.animationArray.Animations[i][j] = love.graphics.newQuad(
                ssWidth*(j-1), Anthony.animationArray.SpriteSheetRow[i] * ssHeight, ssWidth, ssHeight, spritesheetPlayer:getDimensions()
            )
        end
    end
    for i = 1, #Alfred.animationArray.VanityNames, 1 do
        for j = 1, Alfred.animationArray.Frames[i], 1 do
            Alfred.animationArray.Animations[i][j] = love.graphics.newQuad(
                ssWidth*(j-1), Alfred.animationArray.SpriteSheetRow[i] * ssHeight, ssWidth, ssHeight, spritesheetPlayer:getDimensions()
            )
        end
    end

    player.playerInitX, player.playerInitY = player.x, player.y
    player.mapTrueX, player.mapTrueY = (player.mapTileX * ssWidth) , (player.mapTileY * ssHeight)

    ally1 = Anthony
    ally2 = Alfred
end

function initEnemies()
    currentBattleEnemies = {
        "Rat"
    }

    Rat = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
        , name = "Rattimus"
        , unitID = 01
        , pilot = {
              hp = 5
            , maxHP = 5
            , stamina = 15
            , maxStam = 15
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
            , heat = 20
            , maxHeat = 20
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