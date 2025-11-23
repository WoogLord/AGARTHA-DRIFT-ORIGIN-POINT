-- TODO: marc, make this do the turn based logic and load everything
function battleManager()
    -- 1. spawn players and enemies, make turn timer
    
    combatants = {player, ally1, ally2, enemy_01}
    -- 2. initial attacks
    if turnCounter == 0 then
        initiativeAndStats()
        initialAttacks()
    else
        for i=1, #combatants, 1 do
            if combatants[i].mech.currentTurnCharge == combatants[i].mech.maxTurnCharge then
                takeTurn(combatants[i])
            elseif combatants[i].pilot.currentTurnCharge == combatants[i].pilot.maxTurnCharge then
                takeTurn(combatants[i])
            else
                turnCharger()
            end
        end
    end
    -- 3. assign turn order values

    -- WHAT WE NEED:
    -- DONE: In combat, all players need a max charge value
    -- TODO: And their speed stat charges up to said max value
end

function initiativeAndStats()
    for i=1, #combatants, 1 do
        if combatants[i].isMechedUp then
            combatants[i].mech.currentTurnCharge = combatants[i].mech.startTurnCharge
            print(combatants[i].name.." is in Mech, speed: "..combatants[i].mech.speed..", currentTurnCharge: "..combatants[i].mech.currentTurnCharge)
        else
            combatants[i].pilot.currentTurnCharge = combatants[i].pilot.startTurnCharge
            print(combatants[i].name.." not in Mech, speed: "..combatants[i].pilot.speed..", currentTurnCharge: "..combatants[i].pilot.currentTurnCharge)
        end
    end 
    return
end

function initialAttacks()
    -- put initial attacks here, based off highest speed stat
    turnCounter = 1
end

function turnCharger()
    for i=1, #combatants, 1 do
        if combatants[i].isMechedUp then
            if combatants[i].mech.currentTurnCharge == combatants[i].mech.maxTurnCharge then
                takeTurn(combatants[i])
            else
                combatants[i].mech.currentTurnCharge = 
                    math.min(combatants[i].mech.currentTurnCharge + (combatants[i].mech.speed * turnChargeReduction)
                        , combatants[i].mech.maxTurnCharge)
            end
        else
            if combatants[i].pilot.currentTurnCharge == combatants[i].pilot.maxTurnCharge then
                takeTurn(combatants[i])
            else
                combatants[i].pilot.currentTurnCharge = 
                    math.min(combatants[i].pilot.currentTurnCharge + (combatants[i].pilot.speed * turnChargeReduction)
                        , combatants[i].pilot.maxTurnCharge)
            end
        end
    end
end

function takeTurn(_turnTaker)
    if _turnTaker == player then
        print("Player's turn")
        if _turnTaker.isMechedUp then
            -- some ability here
            _turnTaker.mech.currentTurnCharge = 0
        else
            _turnTaker.pilot.currentTurnCharge = 0
        end
    else
        print(_turnTaker.name.."'s turn")
        if _turnTaker.isMechedUp then
            _turnTaker.mech.currentTurnCharge = 0
        else
            _turnTaker.pilot.currentTurnCharge = 0
        end
    end
end
