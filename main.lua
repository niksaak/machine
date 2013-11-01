----------------------
-- Main Game Script
-- version: 0.1
-- date: 2013/09/28
-- author: roxy, nicksaak
----------------------


require('lua.define')
require('lua.function_lib')
require('lua.states.title')
require('lua.states.game') -- YEP
require('lua.states.gameover') -- AND YEP
require('lua.player')
require('lua.lib.class')
require('lua.state_list')

HC = require('lua.hadroncollider')
Vec = require('lua.lib.vector-light')
----------------------
-- Initialise game
----------------------
function love.load()
  love.graphics.setMode(800, 600)
  Collider = HC(100, on_collide)
  StateList:initialize()
  StateList:push(StateTitle)
  StateList:push(StateGame)
  StateList:push(StateGameover)
  StateList:switch(StateTitle)
  
end

function on_collide(dt, shp_a, shp_b, dx, dy)
  StateList:get():on_collide(dt, shp_a, shp_b, dx, dy)
  -- COLLIDE! COLLIDE MOTTERFREAKER!
end
----------------------
-- Update game
----------------------
function love.update(dt)
  StateList:get():update(dt)
end

----------------------
-- Draw game
----------------------
function love.draw()

    if StateList:get() ~= nil then
        StateList:get():draw()
    end

end

----------------------
-- On mouse button pressed
----------------------
function love.mousepressed(x, y, button)

    if state ~= nil then
        StateList:get():mousepressed(x, y, button)
    end
    
end

----------------------
-- On key pressed
----------------------
function love.keypressed(key, isrepeat)
  StateList:get():keypressed(key, isrepeat)
end

----------------------
-- On key released
----------------------
function love.keyreleased(key, isrepeat)
  StateList:get():keyreleased(key, isrepeat)
end

----------------------
-- EOF
----------------------
