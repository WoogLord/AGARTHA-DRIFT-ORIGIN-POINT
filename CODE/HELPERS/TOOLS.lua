
-- lmao i can just use _bool = not _bool hahaha
function boolFlipFlop(_bool)
    if _bool == true 
        then return false
    elseif _bool == false 
        then return true
    end
end

-- used in enemy spawning code
-- for checking tiles to see if they match eachother
function tileChecker(_tileX, _tileY, _checkedImageData, _tileTargetImageData)
    for y = 0, ssHeight - 1 do
        for x = 0, ssWidth - 1 do
            local r1, g1, b1, a1 = _checkedImageData:getPixel(_tileX + x, _tileY + y)
            local r2, g2, b2, a2 = _tileTargetImageData:getPixel(x, y)

            if r1 ~= r2 or g1 ~= g2 or b1 ~= b2 or a1 ~= a2 then
                return false
            end
        end
    end
    return true
end

function returnIndexGivenArrayValue(_array, _searchValue)
    local indexArrToReturn={}
    for valuesFound, currentIndex in pairs(_array) do
        indexArrToReturn[currentIndex] = valuesFound
        
    end
    print(indexArrToReturn[_searchValue])
    -- print("SearchValue: "..{_searchValue})
    return indexArrToReturn[_searchValue]
end