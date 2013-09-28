----------------------
-- Game state definiton
-- version: 0.1
-- date: 2013/09/28
-- authors: roxy, niksaak
----------------------
require('lua.assets')
require('lua.player')
require('lua.danmaku')

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

end

----------------------
-- Draw state
----------------------
function Game:draw()

  Danmaku:draw()
  Player:draw()

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
-- EOF
----------------------
