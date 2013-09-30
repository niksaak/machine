require('lua.enemy')

Capacitor = class(Enemy,
function(self, x, y, speed)
  Enemy.init(self,x, y, 0, 1, speed,'capacitor')
  Timer.add(1.2, function() self:shoot() end)
end)

function Capacitor:shoot()
  for i=0,4 do
    Bullet(self.x, self.y, 0, 1 + i/10, 80, false, 'yellow')
  end
  Timer.add(1.2, function() self:shoot() end)
end
