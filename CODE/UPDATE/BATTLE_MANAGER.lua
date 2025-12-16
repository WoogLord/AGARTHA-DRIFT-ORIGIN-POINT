-- TODO: marc, make this do the turn based logic and load everything

battleState_ARR = {
    init = "init"
    , innates = "innates"
    , charging = "charging"
    , allyTurnMenu = "allyTurnMenu"
    , enemyAbility = "enemyAbility"
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
    elseif battleState == battleState_ARR.allyTurnMenu then
        -- Handled in UI and INPUT
    elseif battleState == battleState_ARR.enemyAbility then
        startEnemyTurn(activeUnit)
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

    if _turnTaker == player or _turnTaker == ally1 or _turnTaker == ally2 then
        print("Ally's turn")
        battleState = battleState_ARR.allyTurnMenu
    else
        print(_turnTaker.name.."'s turn")
        battleState = battleState_ARR.enemyAbility
    end
end

function startEnemyTurn(_turnTaker)
    _turnTaker.selectedAbility = chooseEnemyAbility(_turnTaker)
    startBattleAnim(_turnTaker, _turnTaker.selectedAbility)
    battleState = battleState_ARR.animating
end

function chooseEnemyAbility(_unit)
    return bigAbilityArray.abilityID[2] -- "quickStrike"
end

function getBattleTarget(_x, _y, _buttonPressed) 
    currentTarget = 
end

function allyConfirmAbility(_ability)
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