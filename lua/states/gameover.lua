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
  self.buttons = ButtonList(
    Button(50, 300, "Заново[x]", 'matricha', nil),
    Button(50, 350, "Настроить[x]", 'matricha', nil),
    Button(50, 400, "Помощь[x]", 'matricha', nil),
    Button(50, 450, "Выйти", 'matricha', function() StateList:switch(StateTitle) end)
  )
  self.buttons:select(4)
end

----------------------
-- Update state
----------------------
function StateGameover:update(dt)
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
  if isControlKey(key, 'up') then
    self.buttons:selectPrev()
  end
  if isControlKey(key, 'down') then
    self.buttons:selectNext()
  end
  if isrepeat then
    if isControlKey(key, 'action') then
      self.buttons:activateCurrent()
    end
  end
end

----------------------
-- Solve collisions
----------------------
function StateGameover:on_collide(dt, shp_a, shp_b, dx, dy)
end

----------------------
-- EOF
----------------------
