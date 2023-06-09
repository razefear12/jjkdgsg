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






function TweenToTarget(CFgo)

    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/250, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
    tween:Play()
  
  end
  
  Mobs = "Tengen_Ouwigahara" -- change the name of the mobs you want to farm
  getfenv().plr = game.Players.LocalPlayer
  rs = game:service'RunService'.RenderStepped
  Start = true
  spawn(function()
     while rs:wait() do
        if Start then
           for i,v in pairs(workspace.Mobs.Tengen:GetChildren()) do -- u can Change (workspace.NPCS) to the NPC/Mobs Folder in the game you are playing
              if string.match(v.Name, Mobs) then
                 if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    TweenToTarget(v.HumanoidRootPart.CFrame) -- Start tweening to Mobs/NPC
                 end
              end
           end
        end
     end
  end)






  --------------------------OLD VERSION

farm:Toggle("Auto Tween NPC", false, function(t)
    isToggleMobsTweenEnabled = t -- Обновляем состояние переключателя
    if t then
        local currentMobFolder = nil -- Переменная для хранения текущей папки моба
        local currentMobName = "" -- Переменная для хранения текущего названия моба
        local attackingMob = nil -- Переменная для хранения ссылки на текущего атакуемого моба

        local noclipE       = false
        local antifall      = false
        
        local function noclip()
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end
            end
        end

        function TweenToTarget(CFgo)
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 250, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})


            if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                antifall.Velocity = Vector3.new(0,0,0)
                noclipE = game:GetService("RunService").Stepped:Connect(noclip)
                tween:Play()
            end

            tween.Completed:Connect(function()
                antifall:Destroy()
                noclipE:Disconnect()
            end)
        end

        local mobsFolder = workspace.Mobs

        function AttackMob(mob)
            -- Добавьте свой код атаки для моба
        end

        function FarmMobs()
            local mobFolder = mobsFolder:FindFirstChild(currentMobName)
            if mobFolder and mobFolder:IsA("Folder") then
                for _, mob in pairs(mobFolder:GetChildren()) do
                    if mob:IsA("Model") then
                        if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            if attackingMob and attackingMob.Parent and attackingMob.Parent.Name == currentMobName then
                                -- Продолжаем атаку текущего моба
                                TweenToTarget(attackingMob.HumanoidRootPart.CFrame)
                                AttackMob(attackingMob)
                            else
                                -- Убиваем текущего моба и переходим к следующему
                                attackingMob = mob
                                TweenToTarget(mob.HumanoidRootPart.CFrame)
                                AttackMob(mob)
                                break -- Прерываем цикл после убийства текущего моба
                            end
                        end
                    end
                end
            end
        end

        getfenv().plr = game.Players.LocalPlayer
        local rs = game:GetService("RunService").RenderStepped
        local Start = true

        spawn(function()
            while rs:wait() do
                if Start then
                    local newMobFolder = mobsFolder:FindFirstChild(currentMobName)
                    if newMobFolder then
                        FarmMobs()
                    else
                        -- Папка моба исчезла, нужно определить новую папку и имя моба
                        local newMobFolder = mobsFolder:GetChildren()[1]
                        if newMobFolder then
                            currentMobName = newMobFolder.Name
                            FarmMobs()
                        end
                    end
                end
            end
        end)
    end
end)
  --------------------------OLD VERSION




    --------------------------NEW VERSION


