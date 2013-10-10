----------------------
-- Buttons and button lists
-- author: roxy
----------------------

Button = class(
function(self, x, y, text, font)
  -- create new button at (x;y), with text displayed with font.
end)

function Button:update(dt)
  -- update the button
end

function Button:draw()
  -- draw the button.
end

function Button:hover(b)
  -- called when button becomes hovered (with b == true)
  -- or unhovered (with b == false).
  -- Put your sound effects and funny particle explosions here.
end

function Button:activate(releasedp)
  -- called when button becomes pressed (releasedp == false)
  -- or released (== true).
  -- Funny particles here also.
end


ButtonList = class(
function(self, ...)
  -- with vararglist containing the buttons which will be added to list
end)

function ButtonList:appendButton(button)
  -- add new button to ButtonList
end

function ButtonList:hover(n)
  -- hover the button indexed by n in list
end

function ButtonList:hoverNext()
  -- hover the button following currently hovered in list
end

function ButtonList:hoverPrevious()
  -- hover previous button
end

function ButtonList:pressCurrent(releasedp)
  -- press currently hovered button
end

