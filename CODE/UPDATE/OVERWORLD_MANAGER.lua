-- Have this handle collision, and entering battles
function overworldManager()
    -- 1. enemies
        -- made from sprite spawners in the TILEMAP_MASTER-ENEMY_SPAWNS file
    if player_ARR.x > overworldEnemies[2].x and player_ARR.x < overworldEnemies[2].x + ssWidth then
        print("Collided with enemy 2 at x = ".. overworldEnemies[2].x .. ", y = ".. overworldEnemies[2].y)        
    end
    -- 2. check if player contacts a wall collider

    -- 3. check if player contacts an enemy

end