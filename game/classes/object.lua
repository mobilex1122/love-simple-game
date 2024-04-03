local world = require ("/world")
local obj = {}


obj.vx = 0
obj.vy = 0
obj.coll = world.engine:rectangle(0,0,10,10)
return obj