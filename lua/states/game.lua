----------------------
-- Game state definiton
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------
require('lua.assets')

----------------------
-- Game table
----------------------
Game = {}
Game.__index = Game

----------------------
-- Construct
----------------------
function Game.create()

    local data = {}
    setmetatable(data, Game)
    return data
    
end

----------------------
-- Update state
----------------------
function Game:update(dt)

    --

end

----------------------
-- Draw state
----------------------
function Game:draw()

    --

end

----------------------
-- On mouse press
----------------------
function Game:mousepressed(x,y,button)

    --

end

----------------------
-- EOF
----------------------
