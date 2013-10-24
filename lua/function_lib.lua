----------------------
-- Function Library
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------
require('lua.define')
require('lua.lib.TEsound')
----------------------
-- Set clear color
----------------------
function setClearColor(r,g,b)
  lg.setBackgroundColor(r, g, b)  
end

----------------------
-- Play sound effect
----------------------
function play_se(_se)
  TEsound.play(sfx.se[_se], "se")
end

----------------------
-- Stop playing sound effect
----------------------
function stop_se()
  TEsound.stop("se", true)  
end

----------------------
-- Quit game
----------------------
function quit()
  love.event.push("quit")  
end

----------------------
-- Lispy corner
----------------------
function complement(predicate)
  -- take predicate and return function which mirrors it
  return function(j)
    if predicate(j) then
      return false
    else
      return true
    end
  end
end

function some(test, tab)
  -- return value of test as soon as test on any
  -- element of seq returns non-false
  for j in pairs(seq) do
    local ret = test(j)
    if ret then
      return ret
    end
  end
  return false
end

function notany(test, tab)
  -- return false as soon as test on any element of seq returns non-false,
  -- return true otherwise
  return not some(test, seq)
end

function remove_if(test, tab)
  -- make a copy of tab with pairs satisfying test removed
  local ret = {}
  for key, val in pairs(tab) do
    if complement(test)(val) then
      ret[key] = val
    end
  end
  return ret
end

function remove_if_not(test, tab)
  -- make a copy of tab with all pairs not satisfying test removed
  local ret = {}
  for key, val in pairs(tab) do
    if test(val) then
      ret[key] = val
    end
  end
  return ret
end

----------------------
-- table.pack for lua 5.1
----------------------
function table.pack(...)
  return { n = select("#", ...), ... }
end

----------------------
-- EOF
----------------------
