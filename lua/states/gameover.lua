----------------------
-- StateGameover state definiton
-- version: 0.1
-- date: 2013/10/05
-- authors: roxy
----------------------
require('lua.gui.button')
require('lua.gui.button_list')
require('lua.assets')
require('lua.state')

----------------------
-- Construct
----------------------
StateGameover = State()

----------------------
-- Initialize state
----------------------
function StateGameover:initialize()
  print('initgameover')
  self.buttons = ButtonList()
  self.buttons:push(Button(1,"Заново", 50, 300, 'matricha'))
  self.buttons:push(Button(2,"Настроить[x]", 50, 350, 'matricha'))
  self.buttons:push(Button(3,"Помощь[x]", 50, 400, 'matricha'))
  self.buttons:push(Button(4,"Выйти", 50, 450, 'matricha', 
    function() StateList:switch(StateTitle) end))
  self.buttons:check()
end
----------------------
-- Update state
----------------------
function StateGameover:update(dt)
  Timer.update(dt)
end

----------------------
-- Draw state
----------------------
function StateGameover:draw()
  love.graphics.setColor(255,255,0)
  love.graphics.print("ВЫ, ЭТО, УМЕРЛИ. ПОЗДРАВЛЯЕМ.", 100, 50)
  self.buttons:draw()

end

----------------------
-- On mouse press
----------------------
function StateGameover:mousepressed(x,y,button)

end

----------------------
-- Keypress
----------------------
function StateGameover:keypressed(key, isrepeat)
  if (key == 'escape') then
    quit()
  end
end

----------------------
-- Keyreleased
----------------------
function StateGameover:keyreleased(key, isrepeat)
  -- Change button
  --print(key,isrepeat)
  self.buttons:keyreleased(key, isrepeat)
end

----------------------
-- Solve collisions
----------------------
function StateGameover:on_collide(dt, shp_a, shp_b, dx, dy)
  -- print('collide!')
end

----------------------
-- EOF
----------------------
