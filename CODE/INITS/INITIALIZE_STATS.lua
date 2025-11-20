-- Stat initialization

function initParty()
    --==+==--
    player = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
        , mapTileX = 8
        , mapTileY = 8
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
        }
        , isMechedUp = false
        , mech = {
              hp = 35
            , maxHP = 35
            , heat = 15
            , maxHeat = 15
            , speed = 15
            , startTurnCharge = 50
            , currentTurnCharge = 0
            , maxTurnCharge = 100
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
end