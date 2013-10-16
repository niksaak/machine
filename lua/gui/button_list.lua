require('lua.lib.class')
require('lua.gui.button')
ButtonList = class(
  function(self)
    --[[Примечание:
      Если ты, дорогой читатель, не сможешь реализовать этот функционал
      в виде ассоциативного массива на основе двунаправленного связного
      списка, не смей называть этот милый код - быдлокодом. Сам такой]]
    self.buttons = {} --! список кнопок, пары id,buttons
    self.indexes = {} --! упорядоченный массив индексов.
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
function ButtonList:add( num, button )
  table.insert( self.buttons, num, button ) --! Добавляем кнопку по ключу.
  table.insert( self.indexes, num ) --! Добавляем индекс в массив.
  table.sort( self.indexes ) --! сортируем индексы
  --[[Пример:
      {1=btn1,3=btn2,5=btn3}btns
      {1=1,   2=3,   3=5}idxs
      add btn4 in 4:
      {1=btn1,3=btn2,4=btn4,5=btn3}btns
      push 4 back
      {1=1,   2=3,   3=5,   4=4}idxs
      sort idxs =>
      {1=1,   2=3,   3=4,   4=5}idxs]]
end

----------------------
-- Get current selected button
----------------------
--! ...

function ButtonList:check()
  --! n = > 1
  if self.hover_id > table.getn(self.buttons)  then
    self.hover_id = 1
  --! 0 => n
  elseif self.hover_id < 1  then
    self.hover_id = table.getn(self.buttons)
  end
  --! switch off all
  for i,btn in pairs(self.buttons) do
    btn:set_hover(false)
  end
  --! setup current hovered button
  self.buttons[ self.indexes[ self.hover_id ] ]:set_hover(true)
  play_se("btn_hover") --! awesome sound
end

----------------------
-- Select next button
----------------------
-- NOTE: private
----------------------
function ButtonList:next()
  self.hover_id = self.hover_id + 1
end

----------------------
-- Select previous button
----------------------
-- NOTE: private
----------------------
function ButtonList:prev()
  -- maybe some bonus code
  self.hover_id = self.hover_id - 1
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
    self:prev()
    self:check() --<---------------!
  elseif key == 'down' then      --! don't like it.
    self:next()                  --! what should i do, AI?
    self:check() --<---------------! 
  end
    --! process button !
  if key == "return" or key == 'z' then
    self.buttons[self.indexes[self.hover_id]]:onClick()
    play_se("btn_click")
  end
end
  

function ButtonList:draw()
  for n,btn in pairs (self.buttons) do
    btn:draw()
  end
end