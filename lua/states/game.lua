----------------------
-- Game state definiton
-- version: 0.1
-- date: 2013/10/01
-- authors: roxy, niksaak
----------------------
require('lua.assets')
require('lua.danmaku')
require('lua.player')
require('lua.bullet')
require('lua.enemy')
require('lua.enemies.capacitor')
require('lua.entity')
require('lua.emitter')
require('lua.levels.level-1')
HC = require('lua.hadroncollider')

----------------------
-- Construct
----------------------
StateGame = State()

----------------------
-- Begin state
----------------------
function StateGame:initialize()
  EntList:clear()
  Danmaku:reset()
  Player:reset()
  self.level = Level1()
end

----------------------
-- Update state
----------------------
function StateGame:update(dt)
  -- Process keyboard input.
  -- Warnings:
  -- + Do not move it to key(press|release) callbacks - default keyrepeat is
  --   too slow.
  -- + Do not implement it with elseifs - player need to be able to move in
  --   more than one directions at onse.
  local kbd = love.keyboard
  local vec = {}
  vec[0] = 0; vec[1] = 0
  -- Moving
  if (kbd.isDown('up')) then
    vec[1] = -1
  end
  if (kbd.isDown('down')) then
    vec [1] = 1
  end
  if (kbd.isDown('left')) then
    vec [0] = -1
  end
  if (kbd.isDown('right')) then
    vec [0] = 1
  end
  
  Player:move(vec[0], vec[1], dt)

  -- Shooting LIKE A ROSE
  if (kbd.isDown('z')) then
    Player:shoot(dt)
  end

  -- Focus mode
  Danmaku.focus_mode = false
  if(kbd.isDown('lshift')) then
    Danmaku.focus_mode = true
  end

  -- Update entities
  for ent in pairs(EntList.list) do
    ent:update(dt)
  end

  -- Update collisions and timers
  Collider:update(dt)

  -- Update current level events
  if self.level:update() then
    print("YOU WON THE GAME") -- TODO: EndGame state here
  end

  -- GAMEOVER
  if Player.lives <= 0 then
    StateList:switch(StateGameover)
    return
  end
end

----------------------
-- Draw state
----------------------
function StateGame:draw()

  Danmaku:draw()
  --Player:draw()
  for ent in pairs(EntList.list) do
    ent:draw()
  end
end

----------------------
-- On mouse press
----------------------
function StateGame:mousepressed(x,y,button)
end

----------------------
-- On keypress
----------------------
function StateGame:keypressed(key, isrepeat)

  if (key == 'escape') then
    love.event.push('quit')
  end
end

----------------------
-- On keyrelased
----------------------
function StateGame:keyreleased(key, isrepeat)
end


----------------------
-- COLLISION
----------------------
function StateGame:on_collide(dt, shp_a, shp_b, dx, dy)
  shp_a.body:collide(dt, shp_b.body)
  shp_b.body:collide(dt, shp_a.body)
end

----------------------
-- EOF
----------------------
