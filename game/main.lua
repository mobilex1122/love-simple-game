local player = require('player')
local world = require('world')

world.add(player)

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.update()
    local px, py = 0,0

    player.update()


    if love.keyboard.isDown("escape") then
        love.event.quit( 0 )
    end

    world.update()
end

function love.draw()
    love.graphics.print("Hello world", 400, 300)
    player.draw()
end