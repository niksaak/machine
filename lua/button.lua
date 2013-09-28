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
function Button.create(text, x, y)
	
	local data = {}
	setmetatable(data, Button)
	data.hover = false
	data.click = false
	data.text = text
	data.width = gfx.font["matricha"]:getWidth(text)
	data.height = gfx.font["matricha"]:getHeight()
	data.x = x - (data.width / 2)
	data.y = y
    data.se_played = false
	return data
	
end

----------------------
-- Draw a button
----------------------
function Button:draw()
	
	lg.setFont(gfx.font["matricha"])
	
    if self.hover then
        lg.setColor(unpack(btn_hover_color))
	else
        lg.setColor(unpack(btn_idle_color))
    end
	
    lg.print(self.text, self.x, self.y-self.height)
	
end

----------------------
-- Update a button
----------------------
function Button:update(dt)
	
	self.hover = false
	
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	if x > self.x
		and x < self.x + self.width
		and y > self.y - self.height
		and y < self.y then
		self.hover = true
    else
        self.se_played = false
	end
    
    if not self.se_played and self.hover then
        play_se("btn_hover")
        self.se_played = true
    end
	
end

----------------------
-- On press mouse button
----------------------
function Button:mousepressed(x, y, button)
	
	if self.hover then
		if is_sound then
			play_se("btn_click")
		end
		return true
	end
	return false

end

----------------------
-- EOF
----------------------
