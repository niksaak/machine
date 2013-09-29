require('lua.enemy')
Timer = require('lua.lib.timer')

Cond = class(Enemy,
function(self, x, y, speed)
  Enemy.init(self, x, y, 0, 1, speed, 10, gfx.game.cond)
  self.bullet_time = Timer.add(1.2, function() self:shoot() end)
      -- init shooting
end)

function Cond:shoot()
  for i = 0,4 do
    Bullet(self.x, self.y, 0, 1 + i/10, 80, false, 'yellow_bullet')
  end
  self.bullet_time = Timer.add(1.2, function() self:shoot() end)
end

function Cond:afterdeath()
  Timer.cancel(self.bullet_time)
end

