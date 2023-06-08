function TweenToTarget(CFgo)
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 250, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})
    tween:Play()
end

local mobsFolder = workspace.Mobs

function FarmMobs()
    local mobFolders = mobsFolder:GetChildren()
    for i, mobFolder in pairs(mobFolders) do
        if mobFolder:IsA("Folder") then
            for _, mob in pairs(mobFolder:GetChildren()) do
                if mob:IsA("Model") then
                    if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        TweenToTarget(mob.HumanoidRootPart.CFrame) -- Начать перемещение к мобу
                        -- Добавьте код атаки, используя VirtualUser или FireServer() для атаки
                    end
                end
            end
        end
    end
end

Mobs = "" -- Переменная для хранения текущего названия моба
getfenv().plr = game.Players.LocalPlayer
local rs = game:GetService("RunService").RenderStepped
local Start = true

spawn(function()
    while rs:wait() do
        if Start then
            local newMobFolder = mobsFolder:FindFirstChild(Mobs)
            if newMobFolder then
                FarmMobs()
            else
                -- Папка моба исчезла, нужно определить новую папку и имя моба
                local newMobFolder = mobsFolder:GetChildren()[1]
                if newMobFolder then
                    Mobs = newMobFolder.Name
                    FarmMobs()
                end
            end
        end
    end
end)
