----------------------
-- Bullet emitters
-- author: niksaak
----------------------

Emitters = {}

function Emitters:update(dt)
  for e in pairs(Emitters) do
    e:update(dt)
  end
end

Emitter = class(
function(self, x, y, xforce, yforce, speed, playerp)
  emitter[self] = self
  self.x = x
  self.y = y
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
  if (self.x < Danmaku.x or self.x > Danmaku.x + Danmaku.width or
      self.y < Danmaku.y or self.y > Danmaku.y + Danmaku.height) then
     self:die()
  end
end

function Emitter:die()
  emitters[self] = nil
end

