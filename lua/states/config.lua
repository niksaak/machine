----------------------
-- Config state definiton
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------
require('lua.button')
require('lua.assets')

----------------------
-- Config table
----------------------
Config = {}
Config.__index = Config

----------------------
-- Construct
----------------------
function Config.create()

    local data = {}
    setmetatable(data, Config)
    data.button =
    {
        start   = Button.create("Начать", 150, 500),
        config  = Button.create("Настроить", 400, 500),
        help    = Button.create("Помощь", 250, 550),
        quit    = Button.create("Выйти", 650, 500)
    }
    return data
    
end

----------------------
-- Update state
----------------------
function Config:update(dt)

    for n,btn in pairs(self.button) do
		btn:update(dt)
	end

end

----------------------
-- Draw state
----------------------
function Config:draw()

    for n,btn in pairs(self.button) do
		btn:draw()
	end

end

----------------------
-- On mouse press
----------------------
function Config:mousepressed(x,y,button)

    for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "start" then
				-- state = Game.create()
			elseif n == "config" then
				-- state = Instructions.create()
			elseif n == "quit" then
                quit()
			end
		end
	end

end

----------------------
-- EOF
----------------------
