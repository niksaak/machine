----------------------
-- Game state list
-- version: 0.1
-- date: 2013/10/10
-- author: roxy
----------------------
-- NOTE: I'm really don't know why I do this.
-- Maybe I've got some crazy shit code in my head?
-- Yep, my english so ugly. <3~
-- And yis, really hath this state machine!
----------------------
StateList = {} 
function StateList:initialize()
  StateList.list = {}
end

function StateList:push(state)
  StateList.list[state] = state --! HASH AS HELL
end

function StateList:switch(to)
  if to ~= nil then
    StateList.current = StateList.list[to]
    StateList.current:enter()
  else
    print('State '..to..' do not exist!')
  end  
end

function StateList:get()
  return StateList.current
end
