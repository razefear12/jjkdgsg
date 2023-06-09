local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyama"}

local win = lib:Window("UnknownHub | Project Slayers (Map 2)", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local maintab = win:Tab("Main")

maintab:Button("Farm | FPS-BOOST", function()
    lib:Notification("Farm | FPS-BOOST", "Executed", "OK")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/FPS%20Boost', true))()
end)


local function GetHuman()
    local h = LP.Character
    h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
    return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
       Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end


function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().tweenspeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
       TweenInfo:Cancel()
       return false
    end
    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
       TweenInfo:Cancel()
       return false
    end
    return TweenFunc
end


local farm = win:Tab("Farm")


farm:Dropdown("Dropdown", BossessTable, '', false, function(value)
    getgenv().SelectedBoss = value
end)

farm:Toggle("Farm Selected Boss", false, function(value)
    getgenv().FarmBoss = value 
end)

--Farm Selected Boss

spawn(function()
    while task.wait() do
        pcall(function()
            if FarmBoss then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall.Velocity = Vector3.new(0, 0, 0)
                    antifall.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if string.match(v.Name, SelectedBoss) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                                PosMon = v.HumanoidRootPart.Position
                                repeat task.wait()
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 50 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            else
                                repeat task.wait()
                                    TweenFa = Tween(v:GetModelCFrame())
                                until v:FindFirstChild("HumanoidRootPart") or not FarmBoss
                            end
                        end
                    end
                end
            else
                antifall:Destroy()
            end
            if getgenv().FarmBoss == false then
                TweenFa:Cancel()
            end
        end)
    end
end) 


local WeaponSelector = {"Combat", "Sword", "Claw", "Scythe", "Fans"} -- Обновленный список оружия
local selectedOption = WeaponSelector[1] -- Значение по умолчанию
local isToggleEnabled = false -- Переменная для отслеживания состояния переключателя

farm:Dropdown("Select Weapon:", WeaponSelector, function(option)
    selectedOption = option
end)

farm:Toggle("Killaura V1", false, function(t)
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

farm:Toggle("Killaura V2", false, function(t)
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


farm:Toggle("Killaura (JUMP)", false, function(t)
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

farm:Toggle("Auto Loot Chest", false, function(value)
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


farm:Toggle("Auto Eat Souls (Demons)", false, function(value)
    getgenv().CollectSOuls = value
    end)
    
local misc = win:Tab("Misc")

local kamadonhealon = true
local kamadonhealoff = false

misc:Toggle("Kamado Heal (Only Demon)", false, function(t)
    kamadonhealon = t
    if not t then
        kamadonhealon = false
        kamadonhealoff = true
    end
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(kamadonhealon)
end)


local wardrumsbuffon = true
local wardrumsbuffoff = false

misc:Toggle("Dmg Buff (All Race)", false, function(t)

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

misc:Toggle("Akaza BDA (God Mode)", false, function(t)
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

misc:Dropdown("Select Buffs:", BuffsSelector, function(option)
    selectedOption = option
end)

misc:Toggle("Farm Buffs", false, function(t)
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




--Bosses
local BossessTable = {"Slasher", "Nomay Bandit Boss", "Rengoku", "Inosuke","Renpeke","Muichiro Tokito","Enme","Swampy","Akeza"}
local bosCFTable = {
    ["Nomay Bandit Boss"] = CFrame.new(3519, 673, -1898),
    Slasher = CFrame.new(950, 487, -1353),
    Rengoku = CFrame.new(3651, 673, -345),
    Inosuke = CFrame.new(1618, 300, -417),
    Akaza = CFrame.new(1970, 556, -142),
    Renpeke = CFrame.new(-1193, 601, -558),
    ["Muchiro Tokito"] = CFrame.new(4431, 673, -440),
    ["Enme"] = CFrame.new(1577, 483, -681),
    Swampy = CFrame.new(-1301, 601, -283),
}








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




    --AutoFarm All Bosses
    spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().AllBosses then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall3.Velocity = Vector3.new(0, 0, 0)
                    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()                                      
                                    if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                        if TweenFa then
                                        TweenFa:Cancel()
                                        wait(.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                    else
                                        TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                        NearestMobs = false
                                    end
                                until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            end
                        end
                    end
                end
            else
                antifall3:Destroy()
            end
            if getgenv().AllBosses == false then
                TweenFa:Cancel()
            end
        end)
    end
end)


--Farm Method
--Farm Method
spawn(function()
    while wait() do
        pcall(function()
            SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
            if FarmMethod == "Above" then
                FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
            elseif FarmMethod == "Below" then
                FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
            elseif FarmMethod == "Behind" then
                FarmModes = CFrame.new(0,0,getgenv().Distance)
            end
            for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
                Insert = true
                if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                    for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                    if Insert == true then table.insert(invTable, v.Name) end
                end
            end
        end)
    end
end)
--No Clip
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().AllBosses or TPtoVillage or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end
    end)
end)