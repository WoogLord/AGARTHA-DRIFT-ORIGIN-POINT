-- TODO: marc, make this do the turn based logic and load everything

battleState_ARR = {
    init = "init"
    , innates = "innates"
    , charging = "charging"
    , playerTurnMenu = "playerTurnMenu"
    , nonPlayerAbility = "nonPlayerAbility"
    , animating = "animating"
    , resolve = "resolve"
}
battleState = battleState_ARR.init
activeUnit = nil

function battleManager(dt)  
    if battleState == battleState_ARR.init then
        combatants = {player, ally1, ally2, enemy_01}        
        turnCounter = 0
        initiativeAndStats()
    elseif battleState == battleState_ARR.innates then
        initialAttacks()
    elseif battleState == battleState_ARR.charging then
        turnCharger()
    elseif battleState == battleState_ARR.playerTurnMenu then
        -- Handled in UI and INPUT
    elseif battleState == battleState_ARR.nonPlayerAbility then
        startNonPlayerTurn(activeUnit)
    elseif battleState == battleState_ARR.animating then
        updateBattleAnims(dt)
    elseif battleState == battleState_ARR.resolve then
        resolveTurn(activeUnit)
    end
end

function initiativeAndStats()
    for i=1, #combatants, 1 do
        local unit = combatants[i]
        local stats = unit.isMechedUp and unit.mech or unit.pilot 
        stats.currentTurnCharge = stats.startTurnCharge
        if unit.isMechedUp then
            print(unit.name.." is in Mech, speed: "..stats.speed..", currentTurnCharge: "..stats.currentTurnCharge)
        else
            print(unit.name.." is a Pilot, speed: "..stats.speed..", currentTurnCharge: "..stats.currentTurnCharge)
        end
    end 
    battleState = battleState_ARR.innates
end

function initialAttacks()
    -- put initial attacks here, based off highest speed stat
    turnCounter = 1
    battleState = battleState_ARR.charging
end

function turnCharger()
    for i=1, #combatants do
        local unit = combatants[i]
        local stats = unit.isMechedUp and unit.mech or unit.pilot

        if stats.currentTurnCharge >= stats.maxTurnCharge then
            beginTurn(unit)
            return -- stops charging during turn
        end

        stats.currentTurnCharge = math.min(stats.currentTurnCharge + (stats.speed * turnChargeReduction), stats.maxTurnCharge)
    end
end

function beginTurn(_turnTaker)
    activeUnit = _turnTaker

    if _turnTaker == player then
        print("Player's turn")
        battleState = battleState_ARR.playerTurnMenu
    else
        print(_turnTaker.name.."'s turn")
        battleState = battleState_ARR.nonPlayerAbility
    end
end

function startNonPlayerTurn(_turnTaker)
    _turnTaker.selectedAbility = chooseNonPlayerAbility(_turnTaker)
    startBattleAnim(_turnTaker, _turnTaker.selectedAbility)
    battleState = battleState_ARR.animating
end

function chooseNonPlayerAbility(_unit)
    return "quickStrike"
end

function playerConfirmAbility(_ability)
    activeUnit.selectedAbility = _ability
    startBattleAnim(activeUnit, _ability)
    battleState = battleState_ARR.animating
end

function startBattleAnim(_unit, _ability)
    battleAnim = {
        unit = _unit
        , ability = _ability
        , timer = 0
        , duration = 0.75 -- arbitrary, pull from unit array or something
    }
end

function updateBattleAnims(_dt)
    battleAnim.timer = battleAnim.timer + _dt
    if battleAnim.timer >= battleAnim.duration then
        battleAnim = nil
        battleState = battleState_ARR.resolve
    end
end

function resolveTurn(_turnTaker)
    local stats = _turnTaker.isMechedUp and _turnTaker.mech or _turnTaker.pilot
    print(_turnTaker.name.." resolves ability: ".._turnTaker.selectedAbility)
    stats.currentTurnCharge = 0
    _turnTaker.selectedAbility = nil
    activeUnit = nil

    battleState = battleState_ARR.charging
end