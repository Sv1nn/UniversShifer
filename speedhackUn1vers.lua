            -- Получаем игрока
local player = game.Players.LocalPlayer

-- Устанавливаем флаг, который будет указывать, что персонаж быстрый
local isFast = true

-- Устанавливаем направление движения персонажа
local moveDirection = Vector3.new(0, 0, 0)

-- Функция для обновления положения персонажа каждый кадр игры
local function updateCharacterPosition()
    -- Получаем персонажа игрока
    local character = player.Character
    if character then
        -- Получаем корневую часть персонажа (HumanoidRootPart)
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Получаем вектор движения, учитывая выбранную скорость
        local moveVector = moveDirection * (isFast and 10 or 5)
        
        -- Устанавливаем новое положение персонажа с учетом его скорости
        local newPosition = humanoidRootPart.Position + moveVector
        
        -- Пускаем луч вперед, чтобы обнаружить препятствия
        local ray = Ray.new(humanoidRootPart.Position, moveVector)
        local hitPart, hitPosition = workspace:FindPartOnRay(ray)
        if hitPart then
            newPosition = hitPosition - moveVector:Unit() * 2 -- Отступаем от препятствия
        end
        
        -- Устанавливаем новое положение
        humanoidRootPart.CFrame = CFrame.new(newPosition)
    end
end

-- Подписываемся на событие обновления кадра игры (Heartbeat), чтобы вызывать функцию обновления положения персонажа
game:GetService("RunService").Heartbeat:Connect(updateCharacterPosition)

-- Создаем GUI-кнопки для управления перемещением персонажа
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local buttonSize = UDim2.new(0.15, 0, 0.1, 0)

local upButton = Instance.new("TextButton")
upButton.Text = "Up"
upButton.Size = buttonSize
upButton.Position = UDim2.new(0.425, 0, 0.1, 0)
upButton.Parent = gui

local downButton = Instance.new("TextButton")
downButton.Text = "Down"
downButton.Size = buttonSize
downButton.Position = UDim2.new(0.425, 0, 0.6, 0)
downButton.Parent = gui

local leftButton = Instance.new("TextButton")
leftButton.Text = "Left"
leftButton.Size = buttonSize
leftButton.Position = UDim2.new(0.3, 0, 0.35, 0)
leftButton.Parent = gui

local rightButton = Instance.new("TextButton")
rightButton.Text = "Right"
rightButton.Size = buttonSize
rightButton.Position = UDim2.new(0.55, 0, 0.35, 0)
rightButton.Parent = gui

-- Обработка нажатий на кнопки
upButton.MouseButton1Down:Connect(function()
    moveDirection = Vector3.new(0, 0, -1)
end)

downButton.MouseButton1Down:Connect(function()
    moveDirection = Vector3.new(0, 0, 1)
end)

leftButton.MouseButton1Down:Connect(function()
    moveDirection = Vector3.new(-1, 0, 0)
end)

rightButton.MouseButton1Down:Connect(function()
    moveDirection = Vector3.new(1, 0, 0)
end)

-- При отпускании кнопки прекращаем движение
local function stopMovement()
    moveDirection = Vector3.new(0, 0, 0)
end

upButton.MouseButton1Up:Connect(stopMovement)
downButton.MouseButton1Up:Connect(stopMovement)
leftButton.MouseButton1Up:Connect(stopMovement)
rightButton.MouseButton1Up:Connect(stopMovement)

-- Добавляем кнопку для переключения скорости
local speedButton = Instance.new("TextButton")
speedButton.Text = "Toggle Speed"
speedButton.Size = UDim2.new(0.2, 0, 0.05, 0)
speedButton.Position = UDim2.new(0.4, 0, 0.8, 0)
speedButton.Parent = gui

-- Обработка нажатия на кнопку для переключения скорости
speedButton.MouseButton1Click:Connect(function()
    isFast = not isFast
end)
