local Object = require("classes/object")
local world = require("world")
local block = {}

setmetatable(block, {__index= Object})
block.coll = world.engine:rectangle(0,0,10,10)

function block.draw()
    local x,y = block.coll:center()
    love.graphics.rectangle("fill",x - 10, y - 10, 20,20)
end

function block:new ()
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, {__index= self})
    o.coll = setmetatable({}, {_index=self.coll})
    return o
end
return block