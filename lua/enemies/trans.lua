require('lua.enemy')
Trans = class(Enemy,
function(self, x, y, speed)
  Enemy.init(self, x, y, 0, 1, speed, gfx.game.cond)
  Timer.add(0.2, function() self:shoot() end) -- Init shooting
end)

function Trans:shoot()
  for i = 0,6 do
    if i%2 == 0 then
      Bullet(self.x+i*2, self.y, 0, 1 + i/10, 80-1, false, 'yellow')
    end
  end
  Timer.add(1.2, function() self:shoot() end)
end

