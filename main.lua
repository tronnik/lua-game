function love.load()
  
    love.window.setTitle("game")
    
    math.randomseed( os.time() )

    love.graphics.setBackgroundColor(0, 0, 0)
    spaceshipImage = love.graphics.newImage("player1.png")
    


    posX = 0
    posY = 0
    angle = 0

    speed = 300.0

    ballX = 300
    ballY = 300
    radius = 50
    segment = 100
  end
  
  
  function love.update(dt)
    
    if love.keyboard.isDown("d") then
      posX = posX + speed * dt
    end
    
    if love.keyboard.isDown("a") then
      posX = posX - speed * dt
    end
    
    if love.keyboard.isDown("w") then
      posY = posY - speed * dt
    end
    
    if love.keyboard.isDown("s") then
      posY = posY + speed * dt
    end
    

    if love.keyboard.isDown("right") then
      ballX = ballX + speed * dt
    end
    
    if love.keyboard.isDown("left") then
      ballX = ballX - speed * dt
    end
    
    if love.keyboard.isDown("up") then
      ballY = ballY - speed * dt
    end
    
    if love.keyboard.isDown("down") then
      ballY = ballY + speed * dt
    end

  end
  
  
  function love.draw()
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(spaceshipImage, posX, posY, angle)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", ballX, ballY, radius, segment)
  
  end