function love.load()
  
    love.window.setTitle("game")
    
    math.randomseed( os.time() )

    love.graphics.setBackgroundColor(1, 1, 1)
    spaceshipImage = love.graphics.newImage("huTao.png")
    
    posX = 0
    posY = 0
    angle =  5
  
    speed = 100.0
  
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
    
  end
  
  
  function love.draw()
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(spaceshipImage, posX, posY, angle)
  
  end