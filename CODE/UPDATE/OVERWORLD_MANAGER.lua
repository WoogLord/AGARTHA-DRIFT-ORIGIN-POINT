-- Have this handle collision, and entering battles
function overworldManager()
    -- 0. render map?  Track player around map
    

    -- 1. enemies
        -- made from sprite spawners in the TILEMAP_MASTER-ENEMY_SPAWNS file
    enemyTestIndex = 4
    -- OKAY this doesnt work because it checks players position ON THE SCREEN
    -- against the enemies MAP positioning
    if          player.x > overworldEnemies[enemyTestIndex].x 
            and player.x < overworldEnemies[enemyTestIndex].x + ssWidth
            -- and player.y < overworldEnemies[2].y 
            -- and player.y > overworldEnemies[2].y + ssHeight 
            then
        -- play cutscene
        -- Have an anim where player current world position slides to fighting one
        -- For now, we hardset player values
        player.x, player.y = currWindWidth / 4, currWindHeight / 2
        player.inBattle = true
        player.facingDirection = "Right"
        print("Collided with enemy "..enemyTestIndex.." at x = ".. overworldEnemies[enemyTestIndex].x .. ", y = ".. overworldEnemies[enemyTestIndex].y)        
    end
    -- 2. check if player contacts a wall collider

    -- 3. check if player contacts an enemy

end