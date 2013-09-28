----------------------
-- Playable character
-- version: 0.1
-- date: 2013/09/28
-- author: niksaak
----------------------

require('lua.danmaku')

Player = {}

function Player:reset()

  -- Player image
  Player.image = love.graphics.newImage("gfx/player.png")
  -- image offset
  Player.image_offx = Player.image:getWidth() / 2
  Player.image_offy = Player.image:getHeight() / 2

  -- Player position
  -- Assume playing field 400x512, indexed from topleft corner
  Player.x = 200
  Player.y = 500

  Player.hb_r = 4 -- hitbox radius
  Player.shape = Collider:addCircle(Player.x, Player.y, Player.hb_r)
  Player.shape.body = Player

  Player.speed = 100 -- movement speed

  Player.shoot_speed = 0.5 -- interval between shoots in sec, the less the faster
  Player.shoot_timeout = 0 -- time until next shoot

  Player.bombs = 3 -- bombs left

  Player.lives = 2 -- lives left, game over if less than zero
end

function Player:move(x, y, dt)
  -- Move player by x and y, multiplied by dt and player speed
  local newx = Player.x + (x * Player.speed * dt)
  local newy = Player.y + (y * Player.speed * dt)

  if (newx < Danmaku.width and newx > 0) then
    Player.x = newx
  end
  if (newy < Danmaku.height and newy > 0) then
    Player.y = newy
  end
end

function Player:shoot(dt)
  if(Player.shoot_timeout <= 0) then
    -- TODO: Shoot the Bullet (geee~)
    Player.shoot_timeout = Player.shoot_speed
  else
    Player.shoot_timeout = Player.shoot_timeout - dt;
  end
end

function Player:bomb(dt)
  if(Player.bombs > 0) then
    -- TODO: Throw da Bomb
    Player.bombs = Player.boms - 1
  end
end

function Player:pichun(instantp)
  Player.lives = Player.lives - 1
  if(instantp) then
    return
  else
    -- TODO: cute pichun~ explosion
  end
end

function Player:draw()
  love.graphics.draw(Player.image,
                     Player.x + Danmaku.x, Player.y + Danmaku.y, -- pos
                     0, 1, 1, -- rotozoom
                     Player.image_offx, Player.image_offy) -- center
end

