-- Simple ticking timer

Timer = class(
function(self, interval)
  self.interval = interval
  self.count = interval
end)

function Timer:tick(dt)
  self.count = self.count - dt -- decrement count
  -- when interval is passed
  if self.count <= 0 then
    self.count = self.interval -- unwind counter
    return true -- tick
  end
  return false -- tock
end

function Timer:setInterval(interval)
  self.interval = interval
end

