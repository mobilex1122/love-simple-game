local controls = {}

-- Controls

controls.left = function() return love.keyboard.isDown("left") end
controls.right = function() return love.keyboard.isDown("right") end
controls.up = function() return love.keyboard.isDown("up") end
controls.down = function() return love.keyboard.isDown("down") end
return controls