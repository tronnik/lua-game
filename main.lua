local grid = {}
local currentPlayer = "X"
local winner = nil

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

        if grid[row][col] == "" and winner == nil 
        then
            grid[row][col] = currentPlayer
            currentPlayer = (currentPlayer == "X") and "O" or "X"
            checkWinner()
        end
    end
end

function checkWinner()
    for row = 1, 3 
    do
        if grid[row][1] ~= "" and grid[row][1] == grid[row][2] and grid[row][2] == grid[row][3] 
        then
            winner = grid[row][1]
            return
        end
    end

    for col = 1, 3 
    do
        if grid[1][col] ~= "" and grid[1][col] == grid[2][col] and grid[2][col] == grid[3][col] 
        then
            winner = grid[1][col]
            return
        end
    end

    if grid[1][1] ~= "" and grid[1][1] == grid[2][2] and grid[2][2] == grid[3][3] 
    then
        winner = grid[1][1]
        return
    end

    if grid[1][3] ~= "" and grid[1][3] == grid[2][2] and grid[2][2] == grid[3][1] 
    then
        winner = grid[1][3]
        return
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

    if winner 
    then
        love.graphics.print(winner .. " ha ganado!", windowWidth / 2 - 50, windowHeight - 50)
    end
end

