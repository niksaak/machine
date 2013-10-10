----------------------
-- Entities
----------------------

EntList = {}
EntList.list = {}

function EntList:put(entity)
  EntList.list[entity] = entity
end

function EntList:get(entity)
  return EntList.list[entity]
end

function EntList:remove(entity)
  EntList.list[entity] = nil
end

function EntList:clear()
  EntList.list = {}
end

Entity = class(
function(self, x, y)
  self.x = x
  self.y = y
  EntList:put(self)
end)

function Entity:update(dt)
end

function Entity:draw()
end
