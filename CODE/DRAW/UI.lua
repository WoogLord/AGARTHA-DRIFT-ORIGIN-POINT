-- UI

-- BUTTON DECS
buttonsMainMenu = {
    play = {x = 100, y = 150, w = 200, h = 50, label = "PLAY"}
    , settings = {x = 100, y = 250, w = 200, h = 50, label = "SETTINGS"}
    , quit = {x = 100, y = 350, w = 200, h = 50, label = "QUIT"}
    , collection = {x = 100, y = 450, w = 200, h = 50, label = "COLLECTION"}
    , languages = {x = 100, y = 550, w = 200, h = 50, label = "ENGLISH"}
    , profile = {x = 100, y = 650, w = 200, h = 50, label = "P1"}
    , discord = {x = 100, y = 750, w = 200, h = 50, label = "DISCORD"}
}
buttonsSettings = {
    back = {x = 100, y = 150, w = 200, h = 50, label = "BACK", r=200, g=0, b=0}
}

function drawButton(button)
    if button.r then 
        love.graphics.setColor(button.r,button.b,button.g)
    else 
        love.graphics.setColor(0.5,0.5,0.5)
    end
    love.graphics.rectangle("fill",button.x, button.y, button.w, button.h)
    love.graphics.setColor(1,1,1)
    love.graphics.printf(button.label,button.x, button.y + button.h /3, button.w, "center")
end

