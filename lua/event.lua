Event = class(
function(self, next)
  self.next = next
end)

function Event:start()
end

function Event:update()
end

function Event:finish()
  if self.next == nil then
    return
  end
  self.next:start()
end

EventList = class(
function(self, first)
  self.list = first -- first event
end)

function EventList:run()
  assert(self.list)
  self.list:start()
end

