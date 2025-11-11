function speedManager(_dt)
    if player_ARR.isMechedUp then
        moveSpeed = player_ARR.mech.moveSpeed * _dt
    else
        moveSpeed = player_ARR.pilot.moveSpeed * _dt
    end
end