require('lua.define')
require('lua.lib.class')
require('lua.gui.button')
ButtonList = class(
  function(self)
    --[[Примечание:
      Если ты, дорогой читатель, не сможешь реализовать этот функционал
      в виде ассоциативного массива на основе двунаправленного связного
      списка, не смей называть этот милый код - быдлокодом. Сам такой]]
    self.buttons = {} --! список кнопок, пары id,buttons
    self.hover_id = 1
  end
)

----------------------
-- Append button to list by id
----------------------
--[[Примечание:
  Кнопки проходят в порядке живой очереди. По индексам.
  Если вы, дорогой читатель, добавите кнопку в существу
  ющий индекс. Старая исчезнет и её заменит новая.~.~]]
function ButtonList:push( button )
  table.insert( self.buttons, button ) --! Добавляем кнопку по ключу.
  table.sort( self.buttons, function(a,b) return a.id > b.id; end ) --! сортируем индексы
  --[[Пример:
      {1=btn1,3=btn2,5=btn3}btns
      ]]
end

----------------------
-- Get current selected button
----------------------
--! ...

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
--[[Примечание:
   Чихать я хотел на язык,
   который никто не знает, пишу на русском.
   Выделть еще тонну кода на обработку объекта, 
   повторяющегося кода(!) на каждый гуёвый стейт -
   ужасно. Посему оно обрабатывает внутре. С неонкой.
   Так же сами кнопки принимают отклики клавиш, т.к. у
   нас могут быть и такие приекрасные родственники кнопок,
   как переключатели и слайдеры. Которые тоже требуют обработки
   воздействия. Я выговорился, поэтому просто добью строку до лесенки.]]
----------------------
function ButtonList:keyreleased( key, isrepeat )
  --! do some stuff with buttons or what it is.
  for id,btn in pairs(self.buttons) do
    btn:keyreleased(key, isrepeat)
  end
  --! переставляем клавиши.
  if key == 'up' then
    self:check(1)
  elseif key == 'down' then
    self:check(0)
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