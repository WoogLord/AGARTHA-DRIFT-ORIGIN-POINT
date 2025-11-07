local dir = love.filesystem.getSourceBaseDirectory()
package.path = dir .. "/?.lua;" .. dir .. "/?/init.lua;" .. package.path

-- local initStats require "CODE.INITS.INITIALIZE_STATS"
local initGame require "CODE.INITS.INIT_GAME"
local uiFunctions require "CODE.DRAW.UI"
local drawFunctions require "CODE.DRAW.DRAW"

function love.load()
    love.window.setMode(WindWidth, WindHeight)
    love.window.setFullscreen(isFullScreen)
    love.graphics.setFont(Font)
end

function love.update(dt)
    love.timer.sleep(1/60)
    spriteTimer=spriteTimer + dt
    updownFloating = math.sin(love.timer.getTime()) * 10
end

function love.draw()
    currWindWidth, currWindHeight = love.graphics.getDimensions()
    love.graphics.setColor(1,1,1)
    drawMainMenu()
    love.graphics.print(TestString, 5, currWindHeight-25-Font:getHeight(VersionInfoString))
    love.graphics.print(VersionInfoString, 5, currWindHeight-5-Font:getHeight(VersionInfoString))
end