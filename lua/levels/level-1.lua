require 'lua.event'

local events = {
  function() -- First event
    local enemy1 = Capacitor(255, 100, 15)
    local enemy2 = Capacitor(330, 100, 15)
    print("starting event", 1)
    return function()
      if (enemy1:deadp() and enemy2:deadp()) then
        return true
      end
      return false
    end
  end,
  function() -- Second event
    local enemy = Capacitor(400, 100, 20)
    print("starting event", 2)
    return function()
      if enemy:deadp() then
        return true
      end
      return false
    end
  end
}

Level1 = class(EventRunner,
function(self)
  print("init level", 1)
  EventRunner.init(self, events)
end)

