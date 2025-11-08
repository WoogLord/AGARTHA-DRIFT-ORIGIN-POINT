-- INPUTS

INPUTS_ARR = {
    fullscreen = "f"
    , debug = "F1"
    , pause = "escape"
    , up = "w"
    , down = "s"
    , left = "a"
    , right = "d"
}

-- handle inputs - mouse
function isMouseOverButton(button)
    local mx, my = love.mouse.getPosition()
    return mx > button.x and mx < button.x + button.w and my > button.y and my < button.y + button.h
end

-- handle inputs - keyboard
function love.keypressed(key)
    if key == INPUTS_ARR.fullscreen then isFullScreen = not isFullScreen
        love.window.setFullscreen(isFullScreen)
    end

    if key == INPUTS_ARR.debug then -- DEBUGGING
        if CurrentState == "Play" then isDebug = not isDebug end
    end

    if isPaused == false then
        if key == INPUTS_ARR.pause then
            PriorStatePaused = CurrentState
            isPaused = true
        end
    else -- if isPaused = true
        if key == INPUTS_ARR.pause then
            isPaused = false
            CurrentState = PriorStatePaused
        elseif key == 'down' then
            selOptionPause = math.min(selOptionPause + 1 , #menuOptionsPaused)
        elseif key == "up" then 
            selOptionPause = math.max(selOptionPause - 1 , 1)
        elseif key == "return" then
            if menuOptionsPaused[selOptionPause] == "RESUME" then
                isPaused = false
            elseif menuOptionsPaused[selOptionPause] == "MAIN MENU" then
                CurrentState = "MainMenu"
                isPaused = false
            elseif menuOptionsPaused[selOptionPause] == "QUIT" then
                love.event.quit()
            end
        end
    end
end