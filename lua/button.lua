----------------------
-- Button definiton
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------

require('lua.define')
require('lua.assets')
require('lua.function_lib')

----------------------
-- Button table
----------------------
Button = {}
Button.__index = Button

----------------------
-- Constructor
----------------------
function Button.create(text, x, y, font)
	
	local data = {}
	setmetatable(data, Button)
	data.hover = false
	data.click = false
	data.text = text
  data.font = font
	data.width = gfx.font[font]:getWidth(text)
	data.height = gfx.font[font]:getHeight()
	data.x = x - (data.width / 2)
	data.y = y
  data.se_played = false
	return data
	
end

----------------------
-- Draw a button
----------------------
function Button:draw()
	
	love.graphics.setFont(gfx.font[self.font])
	
    if self.hover then
        love.graphics.setColor(unpack(btn_hover_color))
	else
        love.graphics.setColor(unpack(btn_idle_color))
    end
	
    love.graphics.print(self.text, self.x, self.y-self.height)
	
end

----------------------
-- Update a button
----------------------
function Button:update(dt)
   
    if (self.hover and not self.click and not self.se_played) then
        play_se("btn_hover")
        self.se_played = true
    elseif (not self.hover) then
      self.se_played = false
    end
	
end

----------------------
-- On key pressed
----------------------
function Button:keypressed(key, isrepeat)
end

----------------------
-- On key released
----------------------
function Button:keyreleased(key, isrepeat)
  if (key == 'return' and self.hover) then
    self.click = true
    play_se("btn_click")
    return true
  else
    return false
  end
end
function Button:set_hover(val)
  self.hover = val
end
----------------------
-- EOF
----------------------
