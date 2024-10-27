local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Функция для создания ESP
function createESP(player)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.FillColor = Color3.new(1, 0, 0) -- Красный цвет
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character
end

-- Создание ESP для всех игроков в игре
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createESP(player)
    end
end

-- Создание ESP для новых игроков
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Wait()
    createESP(player)
end)

-- Обновление ESP при смене персонажа
LocalPlayer.CharacterAdded:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end
end)
