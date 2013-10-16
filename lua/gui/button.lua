----------------------
-- Button definiton
-- version: 0.1
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
  function(self, text, x, y, font, callback)
    self.hover = false
    self.text = text
    self.font = font
    self.width = gfx.font[font]:getWidth(text)
    self.height = gfx.font[font]:getHeight()
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

end

----------------------
-- Update a button
----------------------
function Button:update(dt)
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
end
----------------------
-- Set hover state
----------------------
function Button:set_hover(val)
  self.hover = val
end

function Button:onClick()
  print ('click!')
  if self.callback ~= nil then
    self.callback()
  end
end
----------------------
-- EOF
----------------------
