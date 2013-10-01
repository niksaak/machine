----------------------
-- StateTitle state definiton
-- version: 0.1
-- date: 2013/09/28
-- authors: roxy, niksaak
----------------------
require('lua.button')
require('lua.assets')
require('lua.state')
require('lua.states.game')
----------------------
-- StateTitle table
----------------------

----------------------
-- Construct
----------------------
StateTitle = class(State,
function(self)
  State.init(self)
  self.buttons = {}
  self.hover_num = 1 -- Start game value
end)

----------------------
-- Initialize state
----------------------
function StateTitle:initialize()
  self.buttons = { -- Buttons array
  --[[1]]  Button.create("Начать", 600, 400, 'matricha'),
  --[[2]]  Button.create("Настроить", 600, 450, 'matricha'),
  --[[3]]  Button.create("Помощь", 600, 500, 'matricha'),
  --[[4]]  Button.create("Выйти", 600, 550, 'matricha')
  }
end
----------------------
-- Update state
----------------------
function StateTitle:update(dt)
  Timer.update(dt)
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
function StateTitle:draw()

  for n,btn in pairs(self.buttons) do
		btn:draw()
	end

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
        state = GameInstance
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
function StateTitle:on_collide(dt, shp_a, shp_b, dx, dy)
  -- print('collide!')
end

----------------------
-- Initialize StateTitle state
----------------------
TitleInstance = StateTitle()

----------------------
-- EOF
----------------------
