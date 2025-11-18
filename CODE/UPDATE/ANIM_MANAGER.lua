function animStateMachine()
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