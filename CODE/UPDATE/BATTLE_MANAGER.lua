-- TODO: marc, make this do the turn based logic and load everything
function battleManager()
    -- 1. spawn players and enemies, make turn timer
    turnCounter = 0
    combatants = {player, ally1, ally2}
    -- 2. initial attacks
    if turnCounter == 0 then
        initiativeAndStats()
        initialAttacks()
    else
        turnCharger()
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
end

function initialAttacks()
    -- put initial attacks here, based off highest speed stat
    turnCounter = 1
end

function turnCharger()
    for i=1, #combatants, 1 do
        if combatants[i].isMechedUp then
            combatants[i].mech.currentTurnCharge = combatants[i].mech.currentTurnCharge + combatants[i].mech.speed
        else
            combatants[i].pilot.currentTurnCharge = combatants[i].pilot.currentTurnCharge + combatants[i].pilot.speed
        end
    end
end