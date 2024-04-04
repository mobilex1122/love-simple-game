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

function world.draw()
    local w, h = love.graphics.getDimensions()
    for _, obj in pairs(world.objects) do
        local x1,y1, x2,y2 = obj.coll:bbox()

        if 0 < x2 and 0 < y2 and x1 < w and y1 < h then
            obj.draw()
        end
    end
end
return world