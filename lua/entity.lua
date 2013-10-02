----------------------
-- Entities
----------------------

Entity = {}
Entity.list = {}

function Entity:put(entity)
  Entity.list[entity] = entity
end

function Entity:remove(entity)
  Entity.list[entity] = nil
end

function Entity:clear()
  Entity.list = {}
end

