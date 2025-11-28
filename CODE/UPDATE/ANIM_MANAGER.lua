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

mainAnimationArray = AnimClass:new(
    { -- _vanityNames
        "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
    }
    , { -- _state
        "Idle", "Idle", "Idle", "Idle"
    }
    , { -- _direction
        "Up", "Left", "Down", "Right"
    }
    , { -- _spriteSheetRow
        0, 1, 2, 3
    }
    , { -- _frames
        4,4,4,4
    }
    , { -- _animations
        -- loop this later
        {}, {}, {}, {}
    }
)
mainAnimationArray:PrintData()

function animStateMachine() -- PROBLEM, this is just for the player...
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
        end
    end
end