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
  self.buttons = ButtonList()
  self.buttons:push(Button(1,"Начать", 500, 300, 'matricha',
    function () StateList:switch(StateGame) end))
  self.buttons:push(Button(2,"Настроить", 500, 350, 'matricha'))
  self.buttons:push(Button(3,"Помощь", 500, 400, 'matricha'))
  self.buttons:push(Button(4,"Выйти", 500, 450, 'matricha',
    function() quit() end))
end
-- appendix to initialize:
----------------------
-- Update state
----------------------
function StateTitle:update(dt)
  Timer.update(dt)
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
  self.buttons:keyreleased(key, isrepeat)
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
