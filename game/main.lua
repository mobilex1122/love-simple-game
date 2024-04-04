local player = require('player')
local block = require('block')
local world = require('world')

world.add(player)
world.add(block)

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.update(dt)
    local px, py = 0,0

    player.update()


    if love.keyboard.isDown("escape") then
        love.event.quit( 0 )
    end

    world.update(dt)
end

function love.draw()
    love.graphics.print("Hello world", 400, 300)
    player.draw()
end