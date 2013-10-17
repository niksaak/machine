----------------------
-- StateTitle state definiton
-- version: 0.5
-- date: 2013/10/15
-- authors: roxy
----------------------

require('lua.define')
require('lua.lib.class')
require('lua.gui.button')
ButtonList = class(
  function(self)
    self.buttons = {}
    self.hover_id = 1
  end
)

----------------------
-- Append button to list by id
----------------------
function ButtonList:push( button )
  table.insert( self.buttons, button ) --! Добавляем кнопку по ключу.
  table.sort( self.buttons, function(a,b) return a.id > b.id; end ) --! сортируем индексы
end

----------------------
-- Get current selected button
----------------------
function ButtonList:check(direction)
  --! Unhover ceurrent
  if  self.buttons[ self.hover_id ]~= nil then
    self.buttons[ self.hover_id ]:set_hover(false)
  end
  local idx = -1
  if (direction == 1) then idx = 1 end
  self.hover_id = self.hover_id + idx

  --! n = > 1
  if self.hover_id > table.getn(self.buttons)  then
    self.hover_id = 1
  --! 0 => n
  elseif self.hover_id < 1  then
    self.hover_id = table.getn(self.buttons)
  end

  --! hover current
  self.buttons[ self.hover_id ]:set_hover(true)
  play_se("btn_hover") --! awesome sound
end

----------------------
-- Keyreleased
----------------------
function ButtonList:keyreleased( key, isrepeat )
  --! do some stuff with buttons or what it is.
  for id,btn in pairs(self.buttons) do
    btn:keyreleased(key, isrepeat)
  end
  --! переставляем клавиши.
  for i,ckey in pairs(control_key.up) do
    if key == ckey then
      self:check(1)
    end
  end
  for i,ckey in pairs(control_key.down) do
    if key == ckey then
      self:check(0)
    end
  end
  --! process button !
  for i,ckey in pairs(control_key.action) do
    if key == ckey then
      self.buttons[self.hover_id]:onClick()
      play_se("btn_click")
    end
  end
end

function ButtonList:draw()
  for n,btn in pairs (self.buttons) do
    btn:draw()
  end
end