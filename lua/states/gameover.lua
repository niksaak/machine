----------------------
-- StateGameover state definiton
-- version: 0.1
-- date: 2013/10/05
-- authors: roxy
----------------------
require('lua.button')
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
  self.buttons = { -- Buttons array
  --[[1]]  Button.create("Заново", 50, 300, 'matricha', false),
  --[[2]]  Button.create("Настроить[x]", 50, 350, 'matricha', false),
  --[[3]]  Button.create("Помощь[x]", 50, 400, 'matricha', false),
  --[[4]]  Button.create("Выйти", 50, 450, 'matricha', false)
  }
  self.hover_num = 1
end
----------------------
-- Update state
----------------------
function StateGameover:update(dt)
  for n,btn in pairs(self.buttons) do
		btn:update(dt)
    if n == self.hover_num then
      btn:set_hover(true)
    else
      btn:set_hover(false)
    end
	end
  if (self.hover_num > table.getn(self.buttons) ) then
    self.hover_num = 1
  elseif ( self.hover_num < 1 ) then
    self.hover_num = table.getn(self.buttons)
  end
end

----------------------
-- Draw state
----------------------
function StateGameover:draw()
  love.graphics.setColor(255,255,0)
  love.graphics.print("ВЫ, ЭТО, УМЕРЛИ. ПОЗДРАВЛЯЕМ.", 100, 50)
  for n,btn in pairs(self.buttons) do
		btn:draw()
	end

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
  if (key == 'left' or key == 'up') then
    self.hover_num = self.hover_num - 1
  end
  if (key == 'right' or key == 'down') then
    self.hover_num = self.hover_num + 1
  end

  for n,b in pairs(self.buttons) do
    if b:keyreleased(key, isrepeat) then
      print(n)
      if     n == 1 then
        -- Refresh game
      elseif n == 2 then
        -- state = ConfigInstance
      elseif n == 3 then
        -- state = HelpInstane
      elseif n == 4 then
        quit() -- Goodbye our little game
      end
    end
  end
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
