----------------------
-- Bullet class
-- version: 0.1
-- date: 2013/09/29
-- author: roxy
----------------------

require('lua.lib.class')

----------------------
-- Define bullet class
----------------------
Bullet = class(
function(self, x, y, xforce, yforce, speed, image)
  -- Init
  self.x = x
  self.y = y
  self.xforce = xforce
  self.yforce = yforce
  self.speed =speed
  self.hb_r = 3
  -- Collide
  self.shape = Collider:addCircle(self.x, self.y, self.hb_r)
  self.shape.body = self
  -- Image
  self.image = image
  self.image_offx = image:getWidth()/2
  self.image_offy = image:getHeight()/2
end
)

----------------------
-- Draw bullet
----------------------
function Bullet:draw()
  love.graphics.draw(self.image,
                     self.x + Danmaku.x, self.y + Danmaku.y, -- pos
                     0, 1, 1, -- rotozoom
                     self.image_offx, self.image_offy) -- center
end

----------------------
-- Update bullet
----------------------
function Bullet:update(dt)
  self.x = self.x + (self.xforce * self.speed * dt)
  self.y = self.y + (self.yforce * self.speed * dt)
end
