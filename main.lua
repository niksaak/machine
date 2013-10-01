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
require('lua.lib.class')
HC = require('lua.hadroncollider')
Timer = require('lua.lib.timer')

----------------------
-- Initialise game
----------------------
function love.load()
  love.graphics.setMode(800, 600)
  Collider = HC(100, on_collide)
  state = StateTitle
  state:enter()
  Timer.new()
end

function on_collide(dt, shp_a, shp_b, dx, dy)
  state:on_collide(dt, shp_a, shp_b, dx, dy)
  -- COLLIDE! COLLIDE MOTTERFREAKER!
end
----------------------
-- Update game
----------------------
function love.update(dt)
  Timer.update(dt)
  if not state.was_eneterd then
    state:enter()
  end
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

----------------------
-- On key released
----------------------
function love.keyreleased(key, isrepeat)
  state:keyreleased(key, isrepeat)
end

----------------------
-- EOF
----------------------
