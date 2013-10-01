----------------------
-- Playable character
-- version: 0.1
-- date: 2013/09/28
-- author: niksaak
----------------------

require('lua.danmaku')
require('lua.entity')

Player = {}

function Player:reset()

  -- Player image
  Player.image = love.graphics.newImage("gfx/player.png")
  -- image offset
  Player.image_offx = Player.image:getWidth() / 2
  Player.image_offy = Player.image:getHeight() / 2

  -- Player position
  -- Assume playing field 400x512, indexed from topleft corner
  Player.x = 200 + Danmaku.x
  Player.y = 500 + Danmaku.y

  -- Hitbox
  Player.hb_r = 4 -- hitbox radius
  Player.shape = Collider:addCircle(Player.x, Player.y, Player.hb_r)
  Player.shape.body = Player
  Collider:addToGroup('player', Player.shape)

  -- Speed
  Player.speed = 256 -- movement speed
  Player.focus_speed = 128

  Player.shoot_speed = 1 / 9 -- fire 9 bullets per second
    -- interval between shoots in sec, the less the faster
  Player.shoot_timeout = 0 -- time until next shoot

  Player.bombs = 3 -- bombs left

  Player.lives = 2 -- lives left, game over if less than zero

  -- Add to entities table
  Entity:put(Player)
end

function Player:move(x, y, dt)
  -- Move player by x and y, multiplied by dt and player speed
  local speed = 0
  if (Danmaku.focus_mode) then
    speed = Player.focus_speed
  else
    speed = Player.speed
  end
  local newx = Player.x + (x * speed * dt)
  local newy = Player.y + (y * speed * dt)
  local max_x = Danmaku.x + Danmaku.width
  local min_x = Danmaku.x
  local max_y = Danmaku.y + Danmaku.height
  local min_y = Danmaku.y

  if (newx > max_x or newx < min_x) then
    newx = Player.x
  end
  if (newy > max_y or newy < min_y) then
    newy = Player.y
  end

  Player.x = newx
  Player.y = newy
  Player.shape:moveTo(newx, newy)
end

function Player:shoot(dt)
  if(Player.shoot_timeout <= 0) then
    Player.shoot_timeout = Player.shoot_speed
    Bullet(Player.x, Player.y, 0, -1, 512, true, 'yellow')
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
  if (instantp) then
    return
  else
    -- TODO: cute pichun~ explosion
  end
end

function Player:collide(dt, body)
  Player:pichun()
end

function Player:update(dt)
  -- Body intentionally left blank
end

function Player:draw()
  love.graphics.draw(Player.image,
                     Player.x, Player.y, -- pos
                     0, 1, 1, -- rotozoom
                     Player.image_offx, Player.image_offy) -- center
  if(Danmaku.focus_mode == true) then
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor({ 255, 64, 0, 192 })
    Player.shape:draw('fill', 16)
    love.graphics.setColor(r, g, b, a)
  end
end

