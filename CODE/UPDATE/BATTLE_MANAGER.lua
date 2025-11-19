-- TODO: marc, make this do the turn based logic and load everything
function battleManager()
    -- 1. spawn players and enemies, make turn timer
    turnCounter = 0
    combatants = {player, ally1, ally2}
    -- 2. initial attacks
    initialAttacks()
    -- 3. assign turn order values
    for i=1, #combatants, 1 do
        if combatants[i].isMechedUp then
            print(combatants[i].name.." is in Mech, moveSpeed: "..combatants[i].mech.moveSpeed)
        else
            print(combatants[i].name.." not in Mech, moveSpeed: "..combatants[i].pilot.moveSpeed)
        end
    end 
end

function initialAttacks()

end