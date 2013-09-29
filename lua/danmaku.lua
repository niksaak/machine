----------------------
-- Playfield with dammaku in it
-- version: 0.1
-- date: 2013/09/28
-- author: niksaak
----------------------

Danmaku = {}

function Danmaku:reset()
  -- Danmaku field position
  Danmaku.x = 50
  Danmaku.y = 44

  -- Danmaku field params
  Danmaku.width = 400
  Danmaku.height = 512

  -- Move slowly and show hitbox
  Danmaku.focus_mode = false
end
-- initial setting
Danmaku:reset()

local boundaries = {
  Danmaku.x, Danmaku.y,
  Danmaku.x + Danmaku.width, Danmaku.y,
  Danmaku.x + Danmaku.width, Danmaku.y + Danmaku.height,
  Danmaku.x, Danmaku.y + Danmaku.height,
  Danmaku.x, Danmaku.y
}

function Danmaku:draw()
  -- for now just draw field boundaries
  love.graphics.line(boundaries)
end

