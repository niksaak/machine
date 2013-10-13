Event = class(
function(self, prev, next)
  self.prev = prev
  self.next = next
end)

function Event:start()
  -- called upon switching to this event
end

function Event:update()
  -- called each game iteration when event is current
end

function Event:finish()
  -- switch to next event or return
  if self.next == nil then
    return
  end
  self.next:start()
end

function eventlist(event)
  -- returns iterator for eventlist
  loval e = event
  return function()
    local re = e
    e = e.next
    return re
  end
end

EventRunner = class(
function(self, first)
  self.list = first -- event list
end)

function link_event_array(array)
  -- link table members with each other ordered by position in array
  local lst = nil
  for e in ipairs(array) do
    e.prev = lst
    if e.prev then
      e.prev.next = e
    end
  end
  return lst
end

function EventRunner:addArray(array)
  -- link the events in array and append them to the end of list
  local lst = link_event_array(array)
  if self.list then
    for e in eventlist(self.list) do
      if e.next == nil then
        e.next = lst
      end
    end
  else
    self.list = lst
  end
end

function EventRunner:run()
  -- run eventlist
  assert(self.list)
  self.list:start()
end

