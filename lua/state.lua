----------------------
-- State base class
-- version: 0.1
-- date: 2013/09/30
-- authors: roxy
----------------------

require('lua.lib.class')

State = class(
function(self)
  self.was_entered = false
end
)

----------------------
-- Begin state
----------------------
function State:enter()
  if not self.was_entered then
    self:initialize()
    self.was_entered = true
  end
end
----------------------
-- Initialize state
----------------------
function State:initialize() -- init was denien in constructor
  self.was_entered = true
end

----------------------
-- Update state
----------------------
function State:update(dt)
end

----------------------
-- Draw state
----------------------
function State:draw()
end

----------------------
-- On mouse press
----------------------
function State:mousepressed(x,y,button)
end

----------------------
-- Keypress
----------------------
function State:keypressed(key, isrepeat)
end

----------------------
-- Keyreleased
----------------------
function State:keyreleased(key, isrepeat)
end

----------------------
-- Solve collisions
----------------------
function State:on_collide(dt, shp_a, shp_b, dx, dy)
  -- print('collide!')
end

----------------------
-- EOF
----------------------
