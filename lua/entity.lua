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
  self.x = x + Danmaku.x
  self.y = y + Danmaku.y
  EntList:put(self)
end)

function Entity:getx()
  return self.x - Danmaku.x
end

function Entity:gety()
  return self.y - Danmaku.y
end

function Entity:setx(n)
  self.x = n + Danmaku.x
end

function Entity:sety(n)
  self.y = n + Danmaku.y
end

function Entity:update(dt)
end

function Entity:draw()
end

