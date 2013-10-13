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

--[[ addEvent() puts func into runners' event array.

'func' must be a function of no arguments which is supposed to initialize
events' actors and return function of no arguments which will be called
each game iteration and return true when event is done and next event is
to be called.

For most cases you would rather want to use addArray() below to feed the whole
table of event funcs to the runner.

Example usage:

  foo = EventRunner()
  foo:addEvent(function()
    -- initialization here
    enemy = SomeEnemy()
    return function()
      -- check if player have enemy defeated
      if enemy:deadp() then
        return true -- enemy is dead, run next event
      end
      return false -- enemy is still going, continue
    end
  end

]]--
function EventRunner:addEvent(func)
  print("add event", self.len)
  self.len = self.len + 1
  self.events[self.len] = func
end

--[[ addArray() puts all integer-indexed members of a table to the entities
     list.
]]--
function EventRunner:addArray(array)
  -- link the events in array and append them to the end of list
  for _, v in ipairs(array) do
    self:addEvent(v)
  end
end

--[[ update() runs the current event and switches to next when it reports that
it is done.
]]--
function EventRunner:update()
  if self.current() then
    print("event #", self.num, "done")
    self.num = self.num + 1
      if self.num > self.len then
        return true
      end
    local init = self.events[self.num]
    self.current = init()
  end
  return false
end

