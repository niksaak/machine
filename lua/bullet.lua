----------------------
-- Bullet class
-- version: 0.1
-- date: 2013/09/29
-- authors: roxy, niksaak
----------------------

require('lua.entity')
require('lua.lib.class')

----------------------
-- Define bullet class
----------------------
Bullet = class(Entity,
function(self, x, y, xforce, yforce, speed, playerp, image)
  -- Init
  Entity.init(self, x, y)
  self.xforce = xforce
  self.yforce = yforce
  self.speed = speed
  self.hb_r = 3
  -- Collide
  self.shape = Collider:addCircle(self.x, self.y, self.hb_r)
  self.shape.body = self
  if (playerp) then
    Collider:addToGroup('player', self.shape)
  else
    Collider:addToGroup('enemy', self.shape)
  end
  Collider:setPassive(self.shape)
  -- Image
  self.image = gfx.game.bullets[image]
  self.image_offx = self.image:getWidth()/2
  self.image_offy = self.image:getHeight()/2
end
)

----------------------
-- Draw bullet
----------------------
function Bullet:draw()
  love.graphics.draw(self.image,
                     self.x, self.y, -- pos
                     0, 1, 1, -- rotozoom
                     self.image_offx, self.image_offy) -- center
end

----------------------
-- Update bullet
----------------------
function Bullet:update(dt)
  -- Compute coords
  local newx = self.x + (self.xforce * self.speed * dt)
  local newy = self.y + (self.yforce * self.speed * dt)
  -- Set coords for bullet
  self.x = newx
  self.y = newy
  -- Set coords for its' shape
  self.shape:moveTo(newx, newy)

  -- Kill bullet if it is out of boundaries
  if (self.getx() < 0 or self.getx() > Danmaku.width or
      self.gety() < 0 or self.gety() > Danmaku.height) then
     self:die(true)
   end
end

----------------------
-- COLLIDE. THE. BULLET.
----------------------
function Bullet:collide(dt, body)
  self:die()
end

----------------------
-- Kill bullet
----------------------
function Bullet:die(instantp)
  Collider:remove(self.shape)
  EntList:remove(self)
  if (not instantp) then
    -- TODO: cute bullet explosion here
  end
  self.x = -1
  self.y = -1
end

