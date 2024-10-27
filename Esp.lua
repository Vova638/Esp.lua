local players = game:GetService("Players")

function onRender()
    for _, player in pairs(players:GetPlayers()) do
        if player ~= players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local head = player.Character.HumanoidRootPart.Position
            local screenPosition, onScreen = workspace.CurrentCamera:WorldToScreenPoint(head)

            if onScreen then
                -- Рисуем ESP
                local espBox = Instance.new("Frame")
                espBox.Size = UDim2.new(0, 100, 0, 100)
                espBox.Position = UDim2.new(0, screenPosition.X - 50, 0, screenPosition.Y - 50)
                espBox.BackgroundColor3 = Color3.new(1, 0, 0)
                espBox.BackgroundTransparency = 0.5
                espBox.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

                
                wait(1)
                espBox:Destroy()
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(onRender)
