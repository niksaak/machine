require('lua.enemy')
require('lua.timer')

Capacitor = class(Enemy,
function(self, x, y, speed)
  Enemy.init(self,x, y, 0, 1, speed, 10, 'capacitor')
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
  for i=0,1 do
    Bullet(self:getx(), self:gety() + i*10, 0, 1, 80, false, 'yellow')
  end
end

