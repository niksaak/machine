----------------------
-- Entities
----------------------

EntList = {}
EntList.list = {}

-- Put entity into the entlist.
function EntList:put(entity)
  EntList.list[entity] = entity
end

-- Get entity from the entlist.
-- FIXME: is there really a reason to have this considering that we use
-- entity itself as a key?
function EntList:get(entity)
  return EntList.list[entity]
end

-- Remove entity from the entlist.
function EntList:remove(entity)
  EntList.list[entity] = nil
end

-- Clear the entlist.
function EntList:clear()
  EntList.list = {}
end


-- Entity primitive carries its' global position and has an entry in EntList.
Entity = class(
function(self, x, y)
  self.x = x + Danmaku.x
  self.y = y + Danmaku.y
  EntList:put(self)
end)

-- The four methods following return and set position relative to Danmaku
-- topleft corner. To work with global position use the x and y fields.

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

-- Each entity shall be able to update and draw itself.

function Entity:update(dt)
end

function Entity:draw()
end

