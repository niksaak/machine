----------------------
-- Game state definiton
-- version: 0.1
-- date: 2013/09/28
-- authors: roxy, niksaak
----------------------
require('lua.assets')
require('lua.danmaku')
require('lua.player')
require('lua.bullet')
require('lua.enemy')
require('lua.enemies.capacitor')
require('lua.entity')
HC = require('lua.hadroncollider')
Timer = require('lua.lib.timer')

----------------------
-- Construct
----------------------
StateGame = class(State,
function (self)
  State.init(self)
  self.enemy = nil
end)

----------------------
-- Begin state
----------------------
function StateGame:initialize()
  Danmaku:reset()
  Player:reset()
  self.enemy = Capacitor(100,100,20)
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

  -- Moving
  if (kbd.isDown('up')) then
    Player:move(0, -1, dt)
  end
  if (kbd.isDown('down')) then
    Player:move(0, 1, dt)
  end
  if (kbd.isDown('left')) then
    Player:move(-1, 0, dt)
  end
  if (kbd.isDown('right')) then
    Player:move(1, 0, dt)
  end

  -- Shooting LIKE A ROSE
  if (kbd.isDown('z')) then
    Player:shoot(dt)
  end

  -- Focus mode
  Danmaku.focus_mode = false
  if(kbd.isDown('lshift')) then
    Danmaku.focus_mode = true
  end

  -- Process collisions
  for ent in pairs(Entity.list) do
    ent:update(dt)
  end
  Collider:update(dt)
  Timer.update(dt)
end

----------------------
-- Draw state
----------------------
function StateGame:draw()

  Danmaku:draw()
  --Player:draw()
  for ent in pairs(Entity.list) do
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

function StateGame:keyreleased(key, isrepeat)
end

GameInstance = StateGame()

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
