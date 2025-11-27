local AnimClass = {}
AnimClass.__index = AnimClass

function AnimClass:new(
          _vanityNames, _frames, _direction, _state, _spriteSheetRow, _animations
    )
    local tAC = {} -- tAC = tempAnimClass
    setmetatable(tAC, AnimClass)

    tAC.vanityNames, tAC.frames, tAC.direction = _vanityNames, _frames, _direction
    tAC.state, tAC.spriteSheetRow, tAC.animations = _state, _spriteSheetRow, _animations

    return tAC
end

function AnimClass:PrintData()
    print("\n--==+==-- AnimClass --==+==--"
        .."\nvanityNames: "..self.vanityNames.."\nframes: "..self.frames.."\ndirection: "..self.direction
        .."\nstate: "..self.state.."\nspriteSheetRow: "..self.spriteSheetRow.."\nanimations: "..self.animations
        .."\n"
    )
end

mainAnimationArray = AnimClass:new(
    { -- _vanityNames
        "IdleUp", "IdleLeft", "IdleDown", "IdleRight"
    }
    , { -- _frames
        4,4,4,4
    }
    , { -- _direction
        "Up", "Left", "Down", "Right"
    }
    , { -- _state
        "Idle", "Idle", "Idle", "Idle"
    }
    , { -- _spriteSheetRow
        0, 1, 2, 3
    }
    , { -- _animations
        -- loop this later
        {}, {}, {}, {}
    }
)
-- mainAnimationArray:PrintData()

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