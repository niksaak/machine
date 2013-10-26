----------------------
-- StateTitle state definiton
-- version: 0.5
-- date: 2013/10/15
-- authors: roxy
----------------------

require('lua.define')
require('lua.function_lib')
require('lua.lib.class')
require('lua.gui.button')

ButtonList = class(
  function(self, ...)
    self.buttons = {}
    self:addButtons( ... )
    
    self.hover_id = 1
  end
)

----------------------
-- Append button to list end
----------------------
function ButtonList:addButton( button )
  table.insert( self.buttons, button ) --! Добавляем кнопку по ключу.
end

----------------------
-- Append buttons to list end one by one
----------------------
function ButtonList:addButtons( ... )
  local args = table.pack(...) --! get varargs
  for i = 1, args.n do

    if args[i] ~= nil then

      self:addButton(args[i]) --! push them 
    end
  end
end

----------------------
-- Set current selected button by id
----------------------
function ButtonList:select( num )
  self.buttons[ self.hover_id ]:unselect() --! Unselect current
  local size = table.getn(self.buttons) --! Get array size
  if num > size then  --! From last position to first
    self.hover_id = 1
  elseif num < 1  then
    self.hover_id = size --! From first to last
  else
    self.hover_id = num --! Simple change position
  end
  self.buttons[ self.hover_id ]:select() --! Select new Current Button
  play_se("btn_hover") --! Play se.
end

----------------------
-- Set next selected button
----------------------
function ButtonList:selectNext()
  self:select(self.hover_id+1)
end

----------------------
-- Set previous selected button
----------------------
function ButtonList:selectPrev()
  self:select(self.hover_id-1)
end

----------------------
-- Draw buttons
----------------------
function ButtonList:draw()
  for n,btn in pairs (self.buttons) do
    btn:draw()
  end
end

----------------------
-- Activate current
----------------------

function ButtonList:activateCurrent()
  self.buttons[self.hover_id]:activate()
end
