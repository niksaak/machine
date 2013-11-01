require('lua.enemy')
require('lua.timer')

Capacitor = class(Enemy,
function(self, x, y, speed)
  Enemy.init(self,x, y, 0, 1, speed, 'capacitor')
  self.tmr = Timer(1.2)
  self.lives = 10
end)

function Capacitor:update(dt)
  Enemy.update(self, dt)
  if self.tmr:tick(dt) then
    self:shoot()
  end
end

function Capacitor:shoot()
  local px, py = Vec.normalize(
      Vec.sub(Player:getx(), Player:gety(), self:getx(), self:gety()))

  for i=0,4 do
    local dx, dy = Vec.add(px, py, Vec.mul(i/10, px, py))
    Bullet(self:getx(), self:gety(), dx, dy, 80, false, 'yellow')
  end
end

