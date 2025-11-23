function speedManager(_dt)
    if player.isMechedUp then
        moveSpeed = (100 + player.mech.speed) * _dt * moveSpeedDampener
    else
        moveSpeed = (100 + player.pilot.speed) * _dt * moveSpeedDampener
    end
end