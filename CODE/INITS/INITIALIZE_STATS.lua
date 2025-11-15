-- Stat initialization

function initParty()
    currentPartyMembers = {
        "Marc"
    }
    
    --==+==--
    player_ARR = {
          x = WindWidth / 2 + ssWidth
        , y = WindHeight / 2 + ssHeight
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
    }

    playerInitX, playerInitY = player_ARR.x, player_ARR.y
end

function initEnemies()
    currentPartyMembers = {
        "Rat"
    }
    
end