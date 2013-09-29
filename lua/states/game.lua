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
require('lua.enemies.cond')
HC = require('lua.hadroncollider')
Timer = require('lua.lib.timer')
----------------------
-- Game table
----------------------
Game = {}
Game.__index = Game

----------------------
-- Construct
----------------------
function Game.create()

  local game = {}
  setmetatable(game, Game)
  game.enemy = Cond(100,20,20)
  Danmaku:reset()
  Player:reset()
  Timer.new()
  return game
    
end

----------------------
-- Update state
----------------------

function Game:update(dt)

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
  for shape in Collider:activeShapes() do
    -- FIXME: looks dirty
    if (shape.body.update ~= nil) then
      shape.body:update(dt)
    end
  end
  Collider:update(dt)
  Timer.update(dt)
end

----------------------
-- Draw state
----------------------
function Game:draw()

  Danmaku:draw()
  for shape in Collider:activeShapes() do
    shape.body:draw()
  end
  self.enemy:draw()
end

----------------------
-- On mouse press
----------------------
function Game:mousepressed(x,y,button)

  --

end

----------------------
-- On keypress
----------------------
function Game:keypressed(key, isrepeat)

  if (key == 'escape') then
    love.event.push('quit')
  end
end

function Game:keyreleased(key, isrepeat)
end

----------------------
-- Collision
----------------------

function Game:on_collide(dt, shp_a, shp_b, dx, dy)
  shp_a.body:collide(dt, shp_b.body)
  shp_b.body:collide(dy, shp_a.body)
end

----------------------
-- EOF
----------------------
