require('lua.enemy')
Timer = require('lua.lib.timer')
Cond = class(Enemy,
function(self, x, y, speed)
  Enemy.init(self, x, y, 0, 1, speed, gfx.game.cond)
  Timer.add(1.2, function() self:shoot() end) -- Init shooting
end)

function Cond:shoot()
  for i = 0,4 do
    Bullet(self.x, self.y, 0, 1 + i/10, 80, false, 'yellow_bullet')
  end
  Timer.add(1.2, function() self:shoot() end)
end
