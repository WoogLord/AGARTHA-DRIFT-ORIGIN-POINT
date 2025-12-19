local AnimClass = {}
AnimClass.__index = AnimClass

function AnimClass:new(
          _vanityNames, _state, _direction, _spriteSheetRow, _frames
          , _windUpFrames, _preCritFrames, _postCritFrames, _resetFrames
          , _animations
    )
    local tAC = {} -- tAC = tempAnimClass
    setmetatable(tAC, AnimClass)

    tAC.vanityNames, tAC.state, tAC.direction = _vanityNames, _state, _direction
    tAC.spriteSheetRow, tAC.frames, tAC.animations = _spriteSheetRow, _frames, _animations
    tAC.windUpFrames, tAC.preCritFrames, tAC.postCritFrames, tAC.resetFrames = _windUpFrames, _preCritFrames, _postCritFrames, _resetFrames

    return tAC
end

function AnimClass:PrintData()
    print("\n--==+==-- AnimClass --==+==--")
    
    for i = 1, #self.vanityNames, 1 do 
        print("\n-- "..i.." --"
            .."\nvanityNames: "..self.vanityNames[i].."\nstate: "..self.state[i].."\ndirection: "..self.direction[i]
            .."\nspriteSheetRow: "..self.spriteSheetRow[i].."\nframes: "..self.frames[i]
            .."\nwindUpFrames: "..self.windUpFrames[i].."\npreCritFrames: "..self.preCritFrames[i]
            .."\npostCritFrames: "..self.postCritFrames[i].."\nresetFrames: "..self.resetFrames[i]
            .."\nanimations: "..tostring(self.animations[i])
            .."\n"
        )
    end
end

function AnimClass:BuildAnimations(_spriteSheet)
    local retArr = {}
    for i = 1, #self.vanityNames, 1 do
        retArr[i] = {}
        for j = 1, self.frames[i], 1  do
            self.animations[i][j] = love.graphics.newQuad(
                tileWH*(j-1), (i-1) * tileWH, tileWH, tileWH, _spriteSheet:getDimensions()
            )
            retArr[i][j] = love.graphics.newQuad(
                tileWH*(j-1), (i-1) * tileWH, tileWH, tileWH, _spriteSheet:getDimensions()
            )
        end
    end
    return retArr
end

mainAnimationArray = AnimClass:new(
    { -- _vanityNames
        "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
        , "WalkUp", "WalkLeft", "WalkDown", "WalkRight"
        , "Strike", "Cast", "Hit", "Dead"
    }
    , { -- _state -- not needed
        "Idle", "Idle", "Idle", "Idle"
        , "Walk", "Walk", "Walk", "Walk"
        , "Strike", "Cast", "Hit", "Dead"
    }
    , { -- _direction -- not needed
        "Up", "Left", "Down", "Right"
        , "Up", "Left", "Down", "Right"
        , "Right", "Right", "Right", "Right"
    }
    , { -- _spriteSheetRow -- needed?
        0, 1, 2, 3
        , 4, 5, 6, 7
        , 8, 9, 10, 11
    }
    , { -- _frames -- total, or rather, looping frames
        4, 4, 4, 4
        , 4, 4, 4, 4
        , 0, 0, 4, 1
    }
    , { -- _windUpFrames
        0, 0, 0, 0
        , 0, 0, 0, 0
        , 4, 4, 0, 0
    }
    , { -- _preCritFrames
        0, 0, 0, 0
        , 0, 0, 0, 0
        , 4, 4, 0, 0
    }
    , { -- _postCritFrames
        0, 0, 0, 0
        , 0, 0, 0, 0
        , 4, 4, 0, 0
    }
    , { -- _resetFrames
        0, 0, 0, 0
        , 0, 0, 0, 0
        , 4, 4, 0, 0
    }
    , { -- _animations
        -- loop this later
        {}, {}, {}, {}
        , {}, {}, {}, {}
        , {}, {}, {}, {}
    }
)
mainAnimationArray:PrintData()

function animStateMachine(_animTarget) -- PROBLEM, this is just for the player...
    if _animTarget.inBattle then
        if _animTarget.currentAnimState == "Idle" then
            if _animTarget.facingDirection == "Right" 
                then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "IdleRight")]
            end
        elseif _animTarget.currentAnimState == "Dead" then
            _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "Dead")]
        end
    else -- for overworld
        if _animTarget.currentAnimState == "Idle" then
                if _animTarget.facingDirection == "Up" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "IdleUp")]
            elseif _animTarget.facingDirection == "Left" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "IdleLeft")]
            elseif _animTarget.facingDirection == "Down" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "IdleDown")]
            elseif _animTarget.facingDirection == "Right" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "IdleRight")]
            end
        elseif _animTarget.currentAnimState == "Walk" then
                if _animTarget.facingDirection == "Up" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "WalkUp")]
            elseif _animTarget.facingDirection == "Left" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "WalkLeft")]
            elseif _animTarget.facingDirection == "Down" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "WalkDown")]
            elseif _animTarget.facingDirection == "Right" then _animTarget.CurrentAnimArray = _animTarget.Animations[returnIndexGivenArrayValue(mainAnimationArray.vanityNames, "WalkRight")]
            end
        end
    end
end

--==+==-- JUICE SECTION --==+==--
function playTargetLockAnim()

end

function playImpactoFrameu()

end