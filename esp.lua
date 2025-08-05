while wait(0.5) do
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "EspBox" or obj.Name == "EspHeadBox" then
            obj:Destroy()
        end
    end

    local localPlayer = game.Players.LocalPlayer
    local localTeam = localPlayer.Team

    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local character = player.Character
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local head = character:FindFirstChild("Head")

            if humanoidRootPart and head and character:FindFirstChild("Humanoid") then
                if player.Team ~= localTeam then
                    local esp = Instance.new("BoxHandleAdornment")
                    esp.Adornee = humanoidRootPart
                    esp.Size = Vector3.new(3, 3, 1)
                    esp.Transparency = 0.35
                    esp.Color3 = Color3.new(1, 0, 0)
                    esp.AlwaysOnTop = true
                    esp.ZIndex = 1
                    esp.Name = "EspBox"
                    esp.Parent = humanoidRootPart

                    local esph = Instance.new("BoxHandleAdornment")
                    esph.Adornee = head
                    esph.Size = Vector3.new(1.5, 1.5, 1.5)
                    esph.Transparency = 0.35
                    esph.Color3 = Color3.new(1, 0.5, 0)
                    esph.AlwaysOnTop = true
                    esph.ZIndex = 1
                    esph.Name = "EspHeadBox"
                    esph.Parent = head
                end
            end
        end
    end
end
