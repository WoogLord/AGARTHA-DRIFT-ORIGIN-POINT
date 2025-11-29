local AnimClass = {}
AnimClass.__index = AnimClass

function AnimClass:new(
          _vanityNames, _state, _direction, _spriteSheetRow, _frames, _animations
    )
    local tAC = {} -- tAC = tempAnimClass
    setmetatable(tAC, AnimClass)

    tAC.vanityNames, tAC.state, tAC.direction = _vanityNames, _state, _direction
    tAC.spriteSheetRow, tAC.frames, tAC.animations = _spriteSheetRow, _frames, _animations

    return tAC
end

function AnimClass:PrintData()
    print("\n--==+==-- AnimClass --==+==--")
    
    for i = 1, #self.vanityNames, 1 do 
        print("\n-- "..i.." --"
            .."\nvanityNames: "..self.vanityNames[i].."\nstate: "..self.state[i].."\ndirection: "..self.direction[i]
            .."\nspriteSheetRow: "..self.spriteSheetRow[i].."\nframes: "..self.frames[i].."\nanimations: "..tostring(self.animations[i])
            .."\n"
        )
    end
end

function AnimClass:BuildAnimations(_spriteSheet)
    local retArr = {{},{},{},{},{},{},{},{}}
    for i = 1, #self.vanityNames, 1 do
        for j = 1, self.frames[i], 1  do
            self.animations[i][j] = love.graphics.newQuad(
                ssWidth*(j-1), (i-1) * ssHeight, ssWidth, ssHeight, _spriteSheet:getDimensions()
            )
            retArr[i][j] = love.graphics.newQuad(
                ssWidth*(j-1), (i-1) * ssHeight, ssWidth, ssHeight, _spriteSheet:getDimensions()
            )
        end
    end
    return retArr
end

mainAnimationArray = AnimClass:new(
    { -- _vanityNames
        "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
        , "WalkUp", "WalkLeft", "WalkDown", "WalkRight"
    }
    , { -- _state
        "Idle", "Idle", "Idle", "Idle"
        , "Walk", "Walk", "Walk", "Walk"
    }
    , { -- _direction
        "Up", "Left", "Down", "Right"
        , "Up", "Left", "Down", "Right"
    }
    , { -- _spriteSheetRow -- needed?
        0, 1, 2, 3
        , 4, 5, 6, 7
    }
    , { -- _frames
        4, 4, 4, 4
        , 4, 4, 4, 4
    }
    , { -- _animations
        -- loop this later
        {}, {}, {}, {}
        , {}, {}, {}, {}
    }
)
mainAnimationArray:PrintData()
playerAnimArrTest = mainAnimationArray:BuildAnimations(spritesheetPlayer)
print(playerAnimArrTest[1][1])

function animStateMachine() -- PROBLEM, this is just for the player...
    print(player.animationArray.Animations[1][1])
    if player.inBattle then
        if player.currentAnimState == "Idle" then
            if player.facingDirection == "Right" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "IdleRight")
                    ]
            end
        end
    else
        if player.currentAnimState == "Idle" then
                if player.facingDirection == "Up" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "IdleUp")
                    ]
                    -- player.animationArray.Animations
            elseif player.facingDirection == "Left" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "IdleLeft")
                    ]
                    -- player.animationArray.Animations
            elseif player.facingDirection == "Down" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "IdleDown")
                    ]
                    -- player.animationArray.Animations
            elseif player.facingDirection == "Right" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "IdleRight")
                    ]
                    -- player.animationArray.Animations
            end
        elseif player.currentAnimState == "Walk" then
                if player.facingDirection == "Up" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "WalkUp")
                    ]
                    -- player.animationArray.Animations
            elseif player.facingDirection == "Left" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "WalkLeft")
                    ]
                    -- player.animationArray.Animations
            elseif player.facingDirection == "Down" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "WalkDown")
                    ]
                    -- player.animationArray.Animations
            elseif player.facingDirection == "Right" 
                then CurrentAnimArray = 
                    player.animationArray.Animations[
                        returnIndexGivenArrayValue(player.animationArray.VanityNames, "WalkRight")
                    ]
                    -- player.animationArray.Animations
            end
        end
    end
end