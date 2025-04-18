--ocultar la barra de estado
display.setStatusBar( display.HiddenStatusBar)

--Declaro variables
  local puntuacion=0
  local velocidad=2--Velocidad inicial
  local direccionX=1
  local direccionY=1

  --Se agreaga el fondo
  local fondo=display.newImage("Fondo.png",display.contentWidth,display.contentHeight)
  fondo.x=display.contentCenterX
  fondo.y=display.contentCenterY
  local marcador =display.newText("Puntos: 0 ",display.contentCenterX,40, native.systemFont, 30)
  marcador:setFillColor(1,1,1)-- Color blanco
  local circulo = display.newImageRect("circulo.png",80,80)
  circulo.x = math.random (80,display.contentWidth - 80)
  circulo.y = math.random (80,display.contentHeight - 80)
local function moverCirculo( event )  
  circulo.x = circulo.x + ( velocidad * direccionX)
  circulo.y = circulo.y + ( velocidad * direccionY)

-- Rebotar en los bordes de la pantalla
 if circulo.x >= display.contentWidth - 40 or circulo.x <= 40 then direccionX = -direccionX
 end
 if circulo.y >= display.contentHeight - 40 or circulo.y <= 40 then direccionY = -direccionY
  end
end 
local function tocarCirculo(event)
  if event.phase == "began" then
    puntuacion = puntuacion + 1
    marcador.text = "Puntos: " .. puntuacion
    circulo.x = math.random(80, display.contentWidth - 80)
    circulo.y = math.random(80, display.contentHeight - 80)

    -- Aumentar velocidad cada 10 puntos
    if puntuacion % 10 == 0 then
      velocidad = velocidad + 1
      end
     end
    end
    Runtime:addEventListener("enterFrame " , moverCirculo) -- Movimiento continuo  
circulo:addEventListener("touch", tocarCirculo) -- Eveneto de toque
