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
    -- shockwave anim
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
    startAbilityPreCritAnim(_turnTaker, _turnTaker.selectedAbility)
    battleState = battleState_ARR.animating
end

function chooseEnemyAbility(_unit)
    currentTarget = partyBattleArr[math.random(1, #partyBattleArr)]
    return bigAbilityArray.abilityID[3] -- "quickStrike"
end

function getBattleTargetAndAbility(_x, _y, _buttonPressed) 
    local stats = activeUnit.isMechedUp and activeUnit.mech or activeUnit.pilot
    for i=1, #targetButtons do
        if _buttonPressed == 1 and isMouseOverButton(targetButtons[i]) then
            currentTarget = combatants[i]
            -- target lock anim on enemy
        end
    end
    for j=1, #abilityButtons do
        if _buttonPressed == 1 and isMouseOverButton(abilityButtons[j]) and abilityButtons[j].isAbilityActive 
        --     ((bigAbilityArray.stats.focusCostBase[stats.abilities[abilityButtons[j].label].abilityID] 
        --         + (bigAbilityArray.stats.focusCostPer[stats.abilities[abilityButtons[j].label].abilityID] 
        --         * stats.abilities[abilityButtons[j].label].abilityLevel)) <= stats.focus)
        then
            allyConfirmAbility(tonumber(abilityButtons[j].label))
        end
    end
end

function allyConfirmAbility(_ability)
    activeUnit.selectedAbility = _ability
    startAbilityPreCritAnim(activeUnit, _ability)
    battleState = battleState_ARR.animating
end

function startAbilityPreCritAnim(_unit, _ability)
    battleAnim = {
        unit = _unit
        , target = currentTarget
        , ability = _ability
        , timer = 0
        , windUpFrames = mainAnimationArray.windUpFrames[returnIndexGivenArrayValue(mainAnimationArray.state, bigAbilityArray.stats.animation[_ability])]
    }
end

function updateBattleAnims(_dt)
    battleAnim.timer = battleAnim.timer + _dt
    local duration = battleAnim.windUpFrames * animStall / 60
    if battleAnim.timer >= duration then
        battleAnim = nil
        battleState = battleState_ARR.resolve
    end
end

function resolveTurn(_turnTaker)
    local uStats = _turnTaker.isMechedUp and _turnTaker.mech or _turnTaker.pilot
    local tStats = currentTarget.isMechedUp and currentTarget.mech or currentTarget.pilot
    local abil = _turnTaker.selectedAbility
    print(_turnTaker.name.." resolves ability: "..abil)

    local isCrit = (math.random() <= (0.1 * bigAbilityArray.stats.critChanceMod[abil]))
    print("isCrit: "..tostring(isCrit))
    local critMod = isCrit and (2 * bigAbilityArray.stats.critDamageMod[abil]) or 1

    -- stuff
    local rawDamageDealt = bigAbilityArray.stats.additionalBase[abil]
        + (bigAbilityArray.stats.vitalityScale[abil] * uStats.vitality)
        + (bigAbilityArray.stats.strengthScale[abil] * uStats.strength)
        + (bigAbilityArray.stats.instinctScale[abil] * uStats.instinct)
        + (bigAbilityArray.stats.speedScale[abil] * uStats.speed)

    rawDamageDealt = rawDamageDealt * critMod

    local rawDamageReduction = 0
    local finalDamageCalc = math.floor(rawDamageDealt - rawDamageReduction)

    -- make this elemental, with healing always green, physical damage is red
    if isCrit then addFloater(finalDamageCalc, currentTarget, 0.75, 0.75, 0)
    else addFloater(finalDamageCalc, currentTarget, 1, 0, 0) end

    tStats.hp = tStats.hp - finalDamageCalc

    uStats.focus = uStats.focus - (bigAbilityArray.stats.focusCostBase[abil] 
                + (bigAbilityArray.stats.focusCostPer[abil] * uStats.abilities[abil].abilityLevel))

    -- if dead
    if tStats.hp < tStats.maxHP then
        tStats.currentAnimState = "Dead"
    end

    -- resets
    uStats.currentTurnCharge = 0
    _turnTaker.selectedAbility = nil
    activeUnit = nil
    currentTarget = nil

    battleState = battleState_ARR.charging
end