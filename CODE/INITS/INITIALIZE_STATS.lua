-- Stat initialization

function initParty()
    currentPartyMembers = {
        "Marc"
    }
    
    --==+==--
    player_ARR = {
          x = 256
        , y = 256
        , pilot = {
              hp = 10
            , maxHP = 10
            , stamina = 25
            , maxStam = 25
        }
        , isMechedUp = false
        , mech = {
              hp = 10
            , maxHP = 10
            , heat = 25
            , maxHeat = 25
        }
    }
end

function initEnemies()
    currentPartyMembers = {
        "Rat"
    }
end