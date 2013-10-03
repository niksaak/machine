----------------------
-- Enemy class
-- version: 0.1
-- date: 2013/09/29
-- author: roxy
----------------------
require('lua.assets')
require('lua.entity')
require('lua.lib.class')
Timer = require('lua.lib.timer')
----------------------
-- Define enemy states
----------------------
local state = {ALIVE = 1, DEAD = 2} 
----------------------
-- Define enemy class
----------------------
Enemy = class(Entity,
function(self, x, y, xforce, yforce, speed, image)
  -- Init
  Entity.init(self, x, y)
  self.xforce = xforce
  self.yforce = yforce
  self.speed = speed
  self.lives = 0
  self.hb_r = 3
  -- State
  self.state = state.ALIVE
  -- Collide
  self.shape = Collider:addCircle(self.x, self.y, self.hb_r)
  self.shape.body = self
  Collider:addToGroup('enemy', self.shape)
  -- Image
  self.image = gfx.game.enemies[image]
  self.image_offx = self.image:getWidth()/2
  self.image_offy = self.image:getHeight()/2  
end
)
----------------------
-- Draw enemy
----------------------
function Enemy:draw()

  love.graphics.draw(self.image,
                     self.x, self.y,
                     0, 1, 1,
                     self.image_offx, self.image_offy)
  
end

----------------------
-- Update enemy
----------------------
function Enemy:update(dt)

  -- Compute coords
  local newx = self.x + (self.xforce * self.speed * dt)
  local newy = self.y + (self.yforce * self.speed * dt)
  -- Set coords for enemy
  self.x = newx
  self.y = newy
  -- Set coords for its' shape
  self.shape:moveTo(newx, newy)
  
end

----------------------
-- Enemy shoot
----------------------
function Enemy:shoot()
end

----------------------
-- Enemy dead
----------------------
function Enemy:die(instantp)
  Collider:remove(self.shape)
  Entity:remove(self)
  if (not instantp) then
    -- TODO: enemy explosion here
  end
  self:afterdeath()
  self = nil
end

function Enemy:afterdeath()
end

----------------------
-- Enemy collisions
----------------------
function Enemy:collide(dt, body)
  self.lives = self.lives - 1
  if(self.lives < 0) then
    self:die()
  end
end

