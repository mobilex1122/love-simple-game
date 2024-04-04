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

function player.update(dt)
    if controls.left() then
        player.vx = -100
    elseif controls.right() then 
        player.vx = 100
    end
    if controls.up() then
        player.vy = -100
    elseif controls.down() then 
        player.vy = 100
    end
end

return player