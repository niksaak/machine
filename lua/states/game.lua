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

HC = require('lua.hadroncollider')

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

  Danmaku:reset()
  Player:reset()

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

end

----------------------
-- Draw state
----------------------
function Game:draw()

  Danmaku:draw()
  for shape in Collider:activeShapes() do
    shape.body:draw()
  end

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
  -- if either shape is the player and other is a bullet, PICHUN~
  if ((shp_a.body == Player or shp_b.body == Player) and
      (shp_a.body == Bullet or shp_b.body == Bullet)) then
    Player:pichun(false)
  end
end

----------------------
-- EOF
----------------------
