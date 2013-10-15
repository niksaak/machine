----------------------
-- Bullet emitters
-- author: niksaak
----------------------

require('lua.entity')

Emitter = class(Entity,
function(self, x, y, xforce, yforce, speed, playerp)
  Entity.init(self, x, y)
  self.xforce = xforce
  self.yforce = yforce
  self.speed = speed

  if (playerp) then
    self.group = 'player'
  else
    self.group = 'enemy'
  end
end)

function Emitter:update(dt)
  -- Compute coords
  local newx = self.x + (self.xforce * self.speed * dt)
  local newy = self.y + (self.yforce * self.speed * dt)
  -- Set coords for bullet
  self.x = newx
  self.y = newy
  -- Set coords for its' shape
  self.shape:moveTo(newx, newy)

  -- Kill bullet if it is out of boundaries
  if (self:getx() < 0 or self:getx() > Danmaku.width or
      self:gety() < 0 or self:gety() > Danmaku.height) then
     self:die()
  end
end

function Emitter:die()
  EntList.remove(self)
end

function Entity:draw()
end

