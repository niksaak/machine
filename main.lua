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

  love.graphics.setMode(800, 600)
  -- love.keyboard.setKeyRepeat(true)
  Collider = HC(100, on_collide)
  state = Title.create()
    
end

----------------------
-- Solve collisions
----------------------
function on_collide(dt, shp_a, shp_b, dx, dy)
  state:collide(dt, shp_a, shp_b, dx, dy)
end

----------------------
-- Update game
----------------------
function love.update(dt)
  state:update(dt)
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
