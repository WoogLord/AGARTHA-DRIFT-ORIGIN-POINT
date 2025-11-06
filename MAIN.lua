local dir = love.filesystem.getSourceBaseDirectory()
package.path = dir .. "/?.lua;" .. dir .. "/?/init.lua;" .. package.path

-- local INITS_STATS require "CODE.INITS.INITIALIZE_STATS"

print("main")