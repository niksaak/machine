----------------------
-- Entities
----------------------

EntList = {}

function EntList:put(entity)
  Entity.list[entity] = entity
end

function EntList:remove(entity)
  Entity.list[entity] = nil
end

function EntList:clear()
  Entity.list = {}
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

