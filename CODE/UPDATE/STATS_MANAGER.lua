function speedManager()
    if player_ARR.isMechedUp then
        moveSpeed = player_ARR.mech.moveSpeed * dt
    else
        moveSpeed = player_ARR.pilot.moveSpeed * dt
    end
end