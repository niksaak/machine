----------------------
-- Enemy class
-- version: 0.1
-- date: 2013/09/29
-- author: roxy
----------------------

require('lua.lib.class')
Timer = require('lua.lib.timer')
----------------------
-- Define enemy states
----------------------
local state = {ALIVE = 1, DEAD = 2} 
----------------------
-- Define enemy class
----------------------
Enemy = class(
function(self, x, y, xforce, yforce, speed, image)
  -- Init
  self.x = x + Danmaku.x
  self.y = y + Danmaku.y
  self.xforce = xforce
  self.yforce = yforce
  self.speed = speed
  self.hb_r = 3
  -- State
  self.state = state.ALIVE
  -- Collide
  self.shape = Collider:addCircle(self.x, self.y, self.hb_r)
  self.shape.body = self
  -- Image
  self.image = image
  self.image_offx = image:getWidth()/2
  self.image_offy = image:getHeight()/2
  -- Contain
  self.bullets = {}
  
end
)
----------------------
-- Draw enemy
----------------------
function Enemy:draw()

  love.graphics.draw(self.image,
                     self.x, self.y,
                     0, 1, 1,
                     self.image_offx, self.image_offy)
  
end

----------------------
-- Update enemy
----------------------
function Enemy:update(dt)

  -- Compute coords
  local newx = self.x + (self.xforce * self.speed * dt)
  local newy = self.y + (self.yforce * self.speed * dt)
  -- Set coords for enemy
  self.x = newx
  self.y = newy
  -- Set coords for its' shape
  self.shape:moveTo(newx, newy)
  
end

----------------------
-- Enemy shoot
----------------------
function Enemy:shoot()
end

function Enemy:die(instantp)
  Collider:remove(self.shape)
  if (not instantp) then
    -- TODO: enemy explosion here
  end
  self.x = -1
  self.y = -1
end
