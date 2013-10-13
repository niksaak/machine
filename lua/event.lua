require 'lua.enemies.trans'

EventRunner = class(
function(self, array)
  self.current = function() return true end -- starter, tee-hee
  self.len = 0
  self.num = 0
  self.events = {}
  if array ~= nil then
    self:addArray(array)
  end
end)

function EventRunner:addEvent(func)
  print("add event", self.len)
  self.len = self.len + 1
  self.events[self.len] = func
end

function EventRunner:addArray(array)
  -- link the events in array and append them to the end of list
  for _, v in ipairs(array) do
    self:addEvent(v)
  end
end

function EventRunner:update()
  if self.num > self.len then
    return true
  end
  if self.current() then
    print("event #", self.num, "done")
    self.num = self.num + 1
    local init = self.events[self.num]
    self.current = init()
  end
  return false
end

