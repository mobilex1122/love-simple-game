local player = require('player')
local block = require('block')
local world = require('world')
local helpers = require('helpers')

world.add(player)
world.add(block)

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.update(dt)
    local px, py = 0,0

    player.update()

    if love.mouse.isDown(1) then
        local cblk = block:new()
        local x, y = love.mouse.getPosition()
        cblk.coll:moveTo(x,y)
        world.add(cblk)
    end
    if love.keyboard.isDown("escape") then
        love.event.quit( 0 )
    end

    world.update(dt)
end

function love.draw()
    love.graphics.print("Hello world", 400, 300)
    --player.draw()

    world.draw()
end