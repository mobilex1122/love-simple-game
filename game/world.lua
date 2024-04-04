local HC = require('lib/HC')
local world = {} 
world.engine = HC.new(150)
world.objects = {}
function world.add(obj)
    table.insert(world.objects, obj)
end
function world.update(dt)
    for _, obj in pairs(world.objects) do
        obj.coll:move(obj.vx * dt,obj.vy * dt)
        obj.vx = 0
        obj.vy = 0
    end
end
return world