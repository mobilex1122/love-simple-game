local world = require ("/world")
local obj = {}


obj.vx = 0
obj.vy = 0
obj.coll = world.engine:rectangle(0,0,10,10)

function obj.draw()
    local x,y = obj.coll:center()
    love.graphics.circle("fill",x,y,10 ) 
end
return obj