----------------------
-- Assets Library
-- version: 0.1
-- date: 2013/09/28
-- author: roxy
----------------------

require('lua.define')

----------------------
-- Sound files
----------------------
sfx = {}
----------------------
-- Sound effects
----------------------
sfx.se = {
  btn_hover   =   love.sound.newSoundData("sfx/se/btn_hover.ogg"),
  btn_click   =   love.sound.newSoundData("sfx/se/btn_click.ogg")
}

----------------------
-- Background music
----------------------
sfx.bgm = {
}
----------------------
-- Graphics
----------------------
gfx = {}
----------------------
-- System graphics
----------------------
gfx.system = {
  btn_hover = love.graphics.newImage("gfx/system/btn_hover.png")
}
----------------------
-- Game graphics
----------------------
gfx.game = {}

----------------------
-- Bullets
----------------------
gfx.game.bullets = {
  yellow = love.graphics.newImage("gfx/bullets/yellow.png")
}
----------------------
-- Enemies
----------------------
gfx.game.enemies = {
  capacitor = love.graphics.newImage("gfx/enemies/capacitor.png")
}
----------------------
-- Fonts
----------------------
gfx.font = {
  matricha = lg.newFont("gfx/font/matricha.ttf", 40)
}

----------------------
-- EOF
----------------------
