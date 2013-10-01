----------------------
-- Function Library
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------
require('lua.define')
require('lua.TEsound')
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
-- EOF
----------------------
