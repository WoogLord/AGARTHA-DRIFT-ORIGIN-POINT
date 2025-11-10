-- Draw States
function drawMainMenu()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(bgTitle,0,0,0,6,6)
    -- have the scale factor be establi shed globally to handle resizing

    -- loop this
    -- for i, button in pairs(buttonsMainMenu) do
    --     drawButton(button)
    -- end

    love.graphics.setFont(bigFont)
    for i, option in ipairs(menuOptionsMain) do
        if i == selOptionMain then
            love.graphics.setColor(1, 0, 0)  -- Highlight selected option in red
        else
            love.graphics.setColor(1, 1, 1)  -- Normal color
        end
        -- are things not centered?  check here lol, fix #option
        love.graphics.print(option, currWindWidth / 2 - (#option * 10), currWindHeight / 2 + (i - 1) * 40)
    end     
    love.graphics.setColor(1, 1, 1)
    
    love.graphics.draw(logoTitle
        , currWindWidth / 2 - (3 * logoTitle:getWidth()) / 2
        , currWindHeight/2 - (3 *logoTitle:getHeight())-50 + updownFloating
        , 0
        , 3, 3)

end

function drawPaused()
    if isPaused == true then
        love.graphics.setColor(0, 0, 0, 0.65)
        love.graphics.rectangle("fill", 0, 0, currWindWidth, currWindHeight)

        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(Font)
        for i, option in ipairs(menuOptionsPaused) do
            if i == selOptionPause then
                love.graphics.setColor(1, 0, 0)  -- Highlight selected option in red
            else
                love.graphics.setColor(1, 1, 1)  -- Normal color
            end
            -- are things not centered?  check here lol, fix #option
            love.graphics.print(option, currWindWidth / 2 - (#option * 8), currWindHeight / 2 + (i - 1) * 40)
        end        
    end
end

function drawPlayer()
    love.graphics.draw(spritesheetPlayer
        , playerIdle_ARR[animTiming]
        , player_ARR.x, player_ARR.y
        , 0
        , 3, 3
    )
end