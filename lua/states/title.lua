----------------------
-- Title state definiton
-- version: 0.1
-- date: 2013/09/28
-- authors: roxy, niksaak
----------------------
require('lua.button')
require('lua.assets')
require('lua.states.game')
Timer = require('lua.lib.timer')
----------------------
-- Title table
----------------------
Title = {}
Title.__index = Title

----------------------
-- Construct
----------------------
function Title.create()
    local data = {}
    setmetatable(data, Title)
    data.button =
    {
        start   = Button.create("Начать", 150, 500),
        config  = Button.create("Настроить", 400, 500),
        help    = Button.create("Помощь", 250, 550),
        quit    = Button.create("Выйти", 650, 500)
    }
    Timer.new()
  return data
end

----------------------
-- Update state
----------------------
function Title:update(dt)
  Timer.update(dt)
  for n,btn in pairs(self.button) do
		btn:update(dt)
	end

end

----------------------
-- Draw state
----------------------
function Title:draw()

  for n,btn in pairs(self.button) do
		btn:draw()
	end

end

----------------------
-- On mouse press
----------------------
function Title:mousepressed(x,y,button)

  for n,b in pairs(self.button) do
    if b:mousepressed(x,y,button) then
      if n == "start" then
        state = Game.create()
      elseif n == "config" then
        -- state = Instructions.create()
      elseif n == "quit" then
        quit()
      end
    end
  end

end

----------------------
-- Keypress
----------------------

function Title:keypressed(key, isrepeat)

  if (key == 'escape') then
    quit()
  end

end
----------------------
-- Keyreleased
----------------------
function Title:keyreleased(key, isrepeat)
end

----------------------
-- Solve collisions
----------------------
function Title:on_collide(dt, shp_a, shp_b, dx, dy)
  -- print('collide!')
end
----------------------
-- EOF
----------------------
