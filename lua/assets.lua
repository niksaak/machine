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
    btn_hover   =   ls.newSoundData("sfx/se/btn_hover.ogg"),
    btn_click   =   ls.newSoundData("sfx/se/btn_click.ogg")
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
    btn_hover = lg.newImage("gfx/system/btn_hover.png")
}
----------------------
-- Fonts
----------------------
gfx.font = {
    matricha = lg.newFont("gfx/font/matricha.ttf", 40)
}
gfx.game = {
    cond = lg.newImage("gfx/conden.png")
}
----------------------
-- EOF
----------------------
