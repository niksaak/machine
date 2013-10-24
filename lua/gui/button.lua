----------------------
-- Button definiton
-- version: 0.4
-- date: 2013/09/28
-- author: roxy
----------------------

require('lua.define')
require('lua.assets')
require('lua.function_lib')
require('lua.lib.class')

----------------------
-- Constructor
----------------------

Button = class(
  function(self, x, y, text, font, callback)
    self.hover = false
    self.text = text
    self.font = font
    self.x = x
    self.y = y
    self.callback = callback
  end
)

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
  local xshift = 10
  if not self.hover then
    xshift = 0
  end
    love.graphics.print(self.text, self.x - xshift, self.y )
    love.graphics.setColor(255,255,255)
end

----------------------
-- Update a button
----------------------
function Button:update(dt)
  -- for some special effect
end

----------------------
-- Set hover onn
----------------------
function Button:select()
  self.hover = true
end

----------------------
-- Set hover off
----------------------
function Button:unselect()
  self.hover = false
end

function Button:activate()
  print ('Button:activate')
  if type(self.callback) == 'function' then
    self.callback()
  end
end
----------------------
-- EOF
----------------------
