local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyama"}

local win = lib:Window("UnknownHub | Project Slayers (Mugen)", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local maintab = win:Tab("Main")

local isNoclipEnabled = false -- Флаг, указывающий, включен ли режим noclip
local isAntiFallEnabled = false -- Флаг, указывающий, включен ли режим anti fall

maintab:Toggle("Auto Tween NPC", false, function(t)
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

maintab:Toggle("Auto Loot Chest", false, function(value)
    getgenv().AutoCollectChest = value 
end)


--Collect Chest

spawn(function()
    while task.wait() do
    if AutoCollectChest then
    for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
    if v.Name == "Loot_Chest" then
    for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do
    if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name) then
    local args = { [1] = c.Name }
    v["Add_To_Inventory"]:InvokeServer(unpack(args))
    delay(0.5, function() c:Destroy() end)
    else
    local args = { [1] = c.Name }
    v["Add_To_Inventory"]:InvokeServer(unpack(args))
    delay(0.5, function() c:Destroy() end)
    end
    end
    end
    end
    end
    end
    end)


-- Таблица Toggle создается с помощью maintab
-- Таблица maintab не показана в предоставленном коде, предположим, что она уже определена

maintab:Toggle("Auto Mugen Clash", false, function(value)
    getgenv().AutoMugenClash = value 
end)

spawn(function()
    while wait() do -- task.wait() заменено на просто wait()
        if getgenv().AutoMugenClash then -- Добавлена getgenv() перед AutoMugenClash

            local args = {
                [1] = "Change_Value",
                [2] = workspace.Debree.clash_folder[game.Players.LocalPlayer.Name..vsEnmu][game.Players.LocalPlayer.Name], -- Добавлен пропущенный оператор .. для объединения строк
                [3] = 10
            }
            
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
            
        end
    end
end)


maintab:Button("Farm | FPS-BOOST", function()
    lib:Notification("Farm | FPS-BOOST", "Executed", "OK")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/FPS%20Boost', true))()
end)

local misc = win:Tab("Misc")


misc:Button("Anti SunDamage (Only Demon)", function()
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Sun_Damage.Disabled = true
end)

misc:Button("Inf Stamina", function()
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Stamina.Disabled = true
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Stamina.Disabled = false
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Stamina.Disabled = true
end)

misc:Button("Inf Breathing", function()
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Breathing.Disabled = true
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Breathing.Disabled = false
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Breathing.Disabled = true
end)


local buffstab = win:Tab("Buffs")


local kamadonhealon = true
local kamadonhealoff = false

buffstab:Toggle("Kamado Heal (Only Demon)", false, function(t)
    kamadonhealon = t
    if not t then
        kamadonhealon = false
        kamadonhealoff = true
    end
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(kamadonhealon)
end)


local wardrumsbuffon = true
local wardrumsbuffoff = false

buffstab:Toggle("Dmg Buff (All Race)", false, function(t)

    wardrumsbuffon = t
    if not t then
        wardrumsbuffon = false
        wardrumsbuffoff = true
    end
    while wardrumsbuffon do
    game:GetService("ReplicatedStorage").Remotes.war_Drums_remote:FireServer(wardrumsbuffon)
    wait(2)
    end
end)


local godmodeakazabda1 = "skil_ting_asd"
local godmodeakazabda2 = game:GetService("Players").LocalPlayer
local godmodeakazabda3 = "akaza_bda_compass_needle"
local godmodeakazabda4 = 1
local isGodModeEnabled = false
local godModeLoop

local function startGodMode()
    if isGodModeEnabled then
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(godmodeakazabda1, godmodeakazabda2, godmodeakazabda3, godmodeakazabda4)
        wait(1.5)
        startGodMode()
    end
end

buffstab:Toggle("Akaza BDA (God Mode)", false, function(t)
    isGodModeEnabled = t
    if isGodModeEnabled then
        startGodMode()
    elseif godModeLoop then
        godModeLoop:Disconnect()
    end
end)

local BuffsSelector = {"Exp+Chance", "Polar", "Devourer", "Damage", "Champion"} -- Обновленный список баффов
local selectedOption = BuffsSelector[1] -- Значение по умолчанию
local expchancebuffon = false -- Переменная для отслеживания состояния переключателя
local buffs -- Переменная для хранения выбранного баффа

buffstab:Dropdown("Select Buffs:", BuffsSelector, function(option)
    selectedOption = option
end)

buffstab:Toggle("Farm Buffs", false, function(t)
    expchancebuffon = t -- Обновляем состояние переключателя
    if t then
        if selectedOption == "Exp+Chance" then
            buffs = "Yatagarasu Mask"
        elseif selectedOption == "Polar" then
            buffs = "Polar Top"
        elseif selectedOption == "Devourer" then
            buffs = "Devourer Top"
        elseif selectedOption == "Damage" then
            buffs = "Rengoku Haorie"
        elseif selectedOption == "Champion" then
            buffs = "Champion Haorie"
        end

        for i, v in pairs(game.ReplicatedStorage.Player_Data[game.Players.LocalPlayer.Name].EquippedItemStats:GetChildren()) do
            if v:IsA("StringValue") then
                v.Value = buffs
            end
        end
    else
        for i, v in pairs(game.ReplicatedStorage.Player_Data[game.Players.LocalPlayer.Name].EquippedItemStats:GetChildren()) do
            if v:IsA("StringValue") then
                v.Value = "" -- Отключаем баффы, устанавливая пустое значение
            end
        end
    end
end)


local killaura = win:Tab("Killaura")


local WeaponSelector = {"Combat", "Sword", "Claw", "Scythe", "Fans"} -- Обновленный список оружия
local selectedOption = WeaponSelector[1] -- Значение по умолчанию
local isToggleEnabled = false -- Переменная для отслеживания состояния переключателя

killaura:Dropdown("Select Weapon:", WeaponSelector, function(option)
    selectedOption = option
end)

killaura:Toggle("Killaura For Mobs", false, function(t)
    isToggleEnabled = t -- Обновляем состояние переключателя
    if t then
        local weapon

        if selectedOption == "Combat" then
            weapon = "fist_combat"
        elseif selectedOption == "Sword" then
            weapon = "Sword_Combat_Slash"
        elseif selectedOption == "Claw" then
            weapon = "claw_Combat_Slash"
        elseif selectedOption == "Scythe" then
            weapon = "Scythe_Combat_Slash"
        elseif selectedOption == "Fans" then
            weapon = "fans_combat_slash"
        end

        local args1 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 919,
            [9] = 99999
        }
        local args2 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 1,
            [9] = 99999
        }

        local args3 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 2,
            [9] = 99999
        }

        local args4 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 3,
            [9] = 99999
        }

        local args5 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 4,
            [9] = 99999
        }

        while isToggleEnabled do -- Добавляем проверку состояния переключателя в условие цикла
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args2, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args3, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args4, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args5, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args1, 1, 9))
   
            wait(1.3) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
        end
    end
end)

killaura:Toggle("Killaura For Bosses", false, function(t)
    isToggleEnabled = t -- Обновляем состояние переключателя
    if t then
     local weapon

     if selectedOption == "Combat" then
        weapon = "fist_combat"
    elseif selectedOption == "Sword" then
        weapon = "Sword_Combat_Slash"
    elseif selectedOption == "Claw" then
        weapon = "claw_Combat_Slash"
    elseif selectedOption == "Scythe" then
        weapon = "Scythe_Combat_Slash"
    elseif selectedOption == "Fans" then
        weapon = "fans_combat_slash"
    end
    
    local oh1 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh2 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh3 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh4 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh5 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh6 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh7 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh8 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh9 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh10 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh11 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh12 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh13 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh14 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh15 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh16 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    while isToggleEnabled do -- Добавляем проверку состояния переключателя в условие цикла
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh1, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh2, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh3, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh4, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh5, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh6, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh7, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh8, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh9, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh10, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh11, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh12, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh13, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh14, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh15, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh16, 1, 9))

        wait(2) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
    end
end
end)


killaura:Toggle("Killaura (JUMP)", false, function(t)
    isToggleEnabled = t -- Обновляем состояние переключателя
    if t then
     local weapon

     if selectedOption == "Combat" then
        weapon = "fist_combat"
    elseif selectedOption == "Sword" then
        weapon = "Sword_Combat_Slash"
    elseif selectedOption == "Claw" then
        weapon = "claw_Combat_Slash"
    elseif selectedOption == "Scythe" then
        weapon = "Scythe_Combat_Slash"
    elseif selectedOption == "Fans" then
        weapon = "fans_combat_slash"
    end
    
    local oh1 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = 0,
        [8] = 0,
        [9] = 99999
    }
    local oh2 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 1,
        [7] = 0,
        [8] = 0,
        [9] = 99999
    }

    local oh3 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 2,
        [7] = 0,
        [8] = 0,
        [9] = 99999
    }

    local oh4 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 3,
        [7] = 0,
        [8] = 0,
        [9] = 99999
    }

    local oh5 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 4,
        [7] = 0,
        [8] = 0,
        [9] = 99999
    }

    while isToggleEnabled do -- Добавляем проверку состояния переключателя в условие цикла
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh2, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh3, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh4, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh5, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(oh1, 1, 9))

        wait(1.3) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
    end
end
end)

local Credits = win:Tab("Credits")

Credits:Button("Join/Copy Discord",function()
    setclipboard("discord.gg/EwB9W5XJ")
    lib:Notification("Discord Invite", "Link Copied", "OK")
    syn.request(
        {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com",
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "EwB9W5XJ",
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
        })
    end)