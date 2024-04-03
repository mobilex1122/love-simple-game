local world = require('world')
local controls = require('controls')
local object = require('classes/object')
local player = {}

setmetatable(player, {__index = object})

player.coll = world.engine:rectangle(10,10,20,20)
function player.draw()
    local x,y = player.coll:center()
    love.graphics.rectangle("fill",x - 10, y - 10, 20,20)
end

function player.update()
    if controls.left() then
        player.vx = -1
    elseif controls.right() then 
        player.vx = 1
    end
end

return player