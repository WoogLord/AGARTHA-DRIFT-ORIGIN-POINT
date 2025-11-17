function speedManager(_dt)
    if player.isMechedUp then
        moveSpeed = player.mech.moveSpeed * _dt
    else
        moveSpeed = player.pilot.moveSpeed * _dt
    end
end