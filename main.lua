----------------------
-- Main Game Script
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------

require('lua.define')
require('lua.function_lib')
require('lua.states.title')
require('lua.player')

----------------------
-- Initialise game
----------------------
function love.load()

    state = Title.create()
    
end

----------------------
-- Update game
----------------------
function love.update(dt)

    if state ~= nil then
        state:update(dt)
    end

end

----------------------
-- Draw game
----------------------
function love.draw()

    if state ~= nil then
        state:draw()
    end

end

----------------------
-- On mouse button pressed
----------------------
function love.mousepressed(x, y, button)

    if state ~= nil then
        state:mousepressed(x, y, button)
    end
    
end

----------------------
-- On key pressed
----------------------
function love.keypressed(key, isrepeat)
  state:keypressed(key, isrepeat)
end

function love.keyreleased(key, isrepeat)
  state:keypressed(key, isrepeat)
end

----------------------
-- EOF
----------------------
