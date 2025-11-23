-- Stat initialization
local AllyClass = {}
AllyClass.__index = AllyClass

function AllyClass:new(
        _x, _y, _name, _inParty

        , _pilotHP, _pilotMaxHP, _pilotStamina, _pilotMaxStam
        , _pilotSpeed     
        , _mechHP,  _mechMaxHP, _mechHeat, _mechMaxHeat
        , _mechSpeed
    )
    local tAC = {} -- tAC = tempAllyClass
    setmetatable(tAC, AllyClass)
    tAC.x,tAC.y,tAC.name, tAC.inParty = _x, _y, _name, _inParty

    tAC.pilot = {
        HP = _pilotHP
        , maxHP = _pilotMaxHP
        , stamina = _pilotStamina
        , maxStam =  _pilotMaxStam
        , speed = _pilotSpeed
    }
    tAC.mech = {
        HP = _mechHP
        , maxHP = _mechMaxHP
        , heat = _mechHeat
        , maxHeat = _mechMaxHeat
        , speed = _mechSpeed
    }
    return tAC
end

function AllyClass:PrintData()
    print("\n--==+==-- AllyClass --==+==--")
    print("x: "..self.x.."\ny: "..self.y.."\nname: "..self.name.."\ninParty: "..tostring(self.inParty))
    print("\n--== Pilot ==--")
    print("HP: "..self.pilot.HP.."\nmaxHP: "..self.pilot.maxHP.."\nstamina: "..self.pilot.stamina.."\nmaxStam: "..self.pilot.maxStam)
    print("speed: "..self.pilot.speed)
    print("\n--== Mech ==--")
    print("HP: "..self.mech.HP.."\nmaxHP: "..self.mech.maxHP.."\nheat: "..self.mech.heat.."\nmaxHeat: "..self.mech.maxHeat)
    print("speed: "..self.mech.speed)
end

local testAllyClass = AllyClass:new(
    128, 128, "Test", true

    , 10, 10, 25, 25
    , 10   
    , 15,  15, 25, 25
    , 10
)
testAllyClass:PrintData()

function initParty()
    --==+==--
    Marc = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
        , mapTileX = 1
        , mapTileY = 1
        , inParty = true
        , name = "Marc"
        , pilot = {
              hp = 10
            , maxHP = 10
            , stamina = 25
            , maxStam = 25
            , speed = 10
            , startTurnCharge = 10
            , currentTurnCharge = 0
            , maxTurnCharge = 150
            , abilities = {}
        }
        , isMechedUp = false
        , mech = {
              hp = 10
            , maxHP = 10
            , heat = 25
            , maxHeat = 25
            , speed = 10
            , startTurnCharge = 30
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
    alphaDecay = 1
    for i = 1, #player.animationArray.VanityNames, 1 do
        for j = 1, player.animationArray.Frames[i], 1 do
            player.animationArray.Animations[i][j] = love.graphics.newQuad(
                ssWidth*(j-1), player.animationArray.SpriteSheetRow[i] * ssHeight, ssWidth, ssHeight, spritesheetPlayer:getDimensions()
            )
        end
    end
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