
function spawnEnemies()
    local tilesX, tilesY = tilemapEnemies_01_ImageData:getDimensions()
    tilesX, tilesY = tilesX / tileWH, tilesY / tileWH
    for tX = 0, tilesX - 1 do
        for tY = 0, tilesY - 1 do
            local eX, eY, uID = tX * tileWH, tY * tileWH, 01
            if tileChecker(eX, eY, tilemapEnemies_01_ImageData, tilemapEnemies_01_ImageData) then
                table.insert(overworldEnemies, {x = eX, y = eY, unitID = uID})
                print("Overworld enemy of ID "..uID.." spawned at: "..eX..", "..eY)
            end
        end
    end
end