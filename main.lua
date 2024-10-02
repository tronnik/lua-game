
local grid = {} 

function love.load()
    windowWidth = 600
    windowHeight = 600 
    love.window.setMode(windowWidth, windowHeight) 
    cellSize = windowWidth / 3 

 
    for i = 1, 3 
    do
        grid[i] = {"", "", ""} 
    end

end


function love.mousepressed(x, y, button)
    if button == 1 
    then 
        
        local row = math.ceil(y / cellSize)
        local col = math.ceil(x / cellSize)

        
        if grid[row][col] == "" 
        then
            grid[row][col] = "X"  
        end
    end
end


function love.draw()
    love.graphics.line(cellSize, 0, cellSize, windowHeight)  
    love.graphics.line(2 * cellSize, 0, 2 * cellSize, windowHeight)

    love.graphics.line(0, cellSize, windowWidth, cellSize)
    love.graphics.line(0, 2 * cellSize, windowWidth, 2 * cellSize)

    for row = 1, 3
     do
        for col = 1, 3
         do
            local mark = grid[row][col]
            if mark == "X" 
            then
                love.graphics.print("X", (col - 1) * cellSize + cellSize / 2 - 10, (row - 1) * cellSize + cellSize / 2 - 10)
            elseif mark == "O" 
            then
                love.graphics.print("O", (col - 1) * cellSize + cellSize / 2 - 10, (row - 1) * cellSize + cellSize / 2 - 10)
            end
        end
    end
end
