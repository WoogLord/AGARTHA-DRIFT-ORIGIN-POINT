-- Have this handle collision, and entering battles
function overworldManager()
    -- 0. render map?  Track player around map
    

    -- 1. enemies
        -- made from sprite spawners in the TILEMAP_MASTER-ENEMY_SPAWNS file
    enemyTestIndex = 4
    -- OKAY this doesnt work because it checks players position ON THE SCREEN
    -- against the enemies MAP positioning
    -- 2. check if player contacts a wall collider

    -- 3. check if player contacts an enemy
    newEncounter(Rat, tilemapGround_01)
end

function newEncounter(_enemies, _background)
    -- include background variable so scenes/environments are dynamic
    if          player.mapTrueX > overworldEnemies[enemyTestIndex].x 
            and player.mapTrueX < overworldEnemies[enemyTestIndex].x + tileWH
            -- and player.y < overworldEnemies[2].y 
            -- and player.y > overworldEnemies[2].y + tileWH 
            then
        -- play cutscene
        -- Have an anim where player current world position slides to fighting one
        -- For now, we hardset player values
        player.x, player.y = currWindWidth / 4, currWindHeight / 2
        ally1.x, ally1.y = currWindWidth / 5, currWindHeight / 3
        ally2.x, ally2.y = currWindWidth / 5, currWindHeight / 1.5
        turnCounter = 0
        enemy_01 = enemyIDArr.Arr[overworldEnemies[enemyTestIndex].unitID]
        player.inBattle = true
        player.facingDirection = "Right"
        player.currentAnimState = "Idle"
        print("Collided with enemy of ID: "..overworldEnemies[enemyTestIndex].unitID.." "..enemyTestIndex.." at x = ".. overworldEnemies[enemyTestIndex].x .. ", y = ".. overworldEnemies[enemyTestIndex].y)        
    end
end