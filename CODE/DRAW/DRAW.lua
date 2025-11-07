-- Draw States
function drawMainMenu()
    love.graphics.draw(bgTitle,0,0,0,6,6)
    -- have the scale factor be establi shed globally to handle resizing

    -- loop this
    for i, button in pairs(buttonsMainMenu) do
        drawButton(button)
    end
    
    love.graphics.draw(logoTitle
        , currWindWidth / 2 - (3 * logoTitle:getWidth()) / 2
        , currWindHeight/2 - (3 *logoTitle:getHeight())-50 + updownFloating
        , 0
        , 3, 3)
end