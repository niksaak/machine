----------------------
-- StateTitle state definiton
-- version: 0.3
-- date: 2013/10/01
-- authors: roxy, niksaak
----------------------
require('lua.gui.button')
require('lua.gui.button_list')
require('lua.assets')
require('lua.state')
require('lua.state_list')

----------------------
-- Construct
----------------------
StateTitle = State()

----------------------
-- Initialize state
----------------------
function StateTitle:initialize()
  self.buttons = ButtonList(
    Button(500, 300, "Начать", 'matricha', function () StateList:switch(StateGame) end),
    Button(500, 350, "Настроить", 'matricha', nil),
    Button(500, 400, "Помощь", 'matricha', nil),
    Button(500, 450, "Выйти", 'matricha', function() quit() end)
  )
  self.buttons:select(1)
end
----------------------
-- Update state
----------------------
function StateTitle:update(dt)
end

----------------------
-- Draw state
----------------------
function StateTitle:draw()
  self.buttons:draw()
end

----------------------
-- On mouse press
----------------------
function StateTitle:mousepressed(x,y,button)
end

----------------------
-- Keypress
----------------------

function StateTitle:keypressed(key, isrepeat)
  if (key == 'escape') then
    quit()
  end
end
----------------------
-- Keyreleased
----------------------
function StateTitle:keyreleased(key, isrepeat)
  for i,ckey in pairs(control_key.up) do
    if key == ckey then
      self.buttons:selectPrev()
    end
  end
  for i,ckey in pairs(control_key.down) do
    if key == ckey then
      self.buttons:selectNext()
    end
  end
  for i,ckey in pairs(control_key.action) do
    if key == ckey then
      self.buttons:activateCurrent()
    end
  end
end

----------------------
-- Solve collisions
----------------------
function StateTitle:on_collide(dt, shp_a, shp_b, dx, dy)
  -- print('collide!')
end

----------------------
-- EOF
----------------------

