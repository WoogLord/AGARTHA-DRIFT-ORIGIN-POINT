
function spawnEnemies()
    local tilesX, tilesY = tilemapEnemies_01_ImageData:getDimensions()
    tilesX, tilesY = tilesX / ssWidth, tilesY / ssHeight
    for tX = 0, tilesX - 1 do
        for tY = 0, tilesY - 1 do
            local eX, eY = tX * ssWidth, tY * ssHeight
            if tileChecker(eX, eY, tilemapEnemies_01_ImageData, tilemapEnemies_01_ImageData) then
                table.insert(overworldEnemies, {x = eX, y = eY})
                print("Overworld enemy spawned at: "..eX..", "..eY)
            end
        end
    end
end