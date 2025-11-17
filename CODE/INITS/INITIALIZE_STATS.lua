-- Stat initialization

function initParty()
    currentPartyMembers = {
        "Marc"
    }
    
    --==+==--
    player = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
        , mapTileX = 8
        , mapTileY = 8
        , pilot = {
              hp = 10
            , maxHP = 10
            , stamina = 25
            , maxStam = 25
            , moveSpeed = 100
        }
        , isMechedUp = false
        , mech = {
              hp = 10
            , maxHP = 10
            , heat = 25
            , maxHeat = 25
            , moveSpeed = 100
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

    for i = 1, #player.animationArray.VanityNames, 1 do
        for j = 1, player.animationArray.Frames[i], 1 do
            player.animationArray.Animations[i][j] = love.graphics.newQuad(
                ssWidth*(j-1), player.animationArray.SpriteSheetRow[i] * ssHeight, ssWidth, ssHeight, spritesheetPlayer:getDimensions()
            )
        end
    end
    player.playerInitX, player.playerInitY = player.x, player.y
    player.mapTrueX, player.mapTrueY = (player.mapTileX * ssWidth) , (player.mapTileY * ssHeight)
end

function initEnemies()
    currentPartyMembers = {
        "Rat"
    }
end