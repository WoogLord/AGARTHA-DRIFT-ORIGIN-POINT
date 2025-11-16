-- Have this handle collision, and entering battles
function overworldManager()
    -- 1. enemies
        -- made from sprite spawners in the TILEMAP_MASTER-ENEMY_SPAWNS file
    enemyTestIndex = 4
    -- OKAY this doesnt work because it checks players position ON THE SCREEN
    -- against the enemies MAP positioning
    if          player_ARR.x > overworldEnemies[enemyTestIndex].x 
            and player_ARR.x < overworldEnemies[enemyTestIndex].x + ssWidth
            -- and player_ARR.y < overworldEnemies[2].y 
            -- and player_ARR.y > overworldEnemies[2].y + ssHeight 
            then
        print("Collided with enemy 2 at x = ".. overworldEnemies[enemyTestIndex].x .. ", y = ".. overworldEnemies[enemyTestIndex].y)        
    end
    -- 2. check if player contacts a wall collider

    -- 3. check if player contacts an enemy

end