----------------------
-- Definitions of global variables
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------

----------------------
-- System Name Definitions
----------------------
la = love.audio
le = love.event
lfs= love.filesystem
lf = love.font
lg = love.graphics
li = love.image
lj = love.joystick
lk = love.keyboard
lm = love.mouse
lp = love.physics
ls = love.sound
ltr= love.thread
lt = love.timer

----------------------
-- State Machine
----------------------
state = nil
----------------------
-- Colors
----------------------
clear_color = { 0, 0, 0, 255 }
btn_idle_color = {255,255,255,255}
btn_hover_color = {255, 100, 100, 255}
----------------------
-- Setting
----------------------
is_sound = true
is_bgm = true

is_easy = false
is_normal = false
is_hard = false
----------------------
-- Key shortcuts
----------------------
--[[key = {
  action      = {'z', 'enter', 'space'}
  bomb        = {'x'}
  focus       = {'shift'}
  escape      = {'esc'}
}]]

----------------------
-- EOF
----------------------
