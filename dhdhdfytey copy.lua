local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyama"}

local args = {
    [1] = "Thx4300MNOuwohanaIsBack"
}

local win = lib:Window("UnknownHub | Project Slayers", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local maintab = win:Tab("Main")

maintab:Button("Farm (Map 2)", function()
    lib:Notification("Farm | Sylveon", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ogamertv12/SylveonHub/main/NewLoader.lua", true))()
end)

maintab:Button("Farm (Map 2) | Only chest", function()
    lib:Notification("Farm | Sylveon", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ogamertv12/SylveonHub/main/NewLoader.lua", true))()
end)

maintab:Button("Farm | Anti-Afk", function()
    lib:Notification("Farm | Anti-Afk", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/batusz/main/roblox/__Anti__Afk__Script__", true))()
end)

maintab:Button("Farm | FPS-BOOST", function()
    lib:Notification("Farm | FPS-BOOST", "Executed", "OK")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/FPS%20Boost', true))()
end)




local farm = win:Tab("Farm")

local currentTweenSpeed = 250 -- Переменная для хранения текущей скорости Tween

farm:Toggle("Auto Tween NPC", false, function(t)
    isToggleMobsTweenEnabled = t -- Обновляем состояние переключателя
    if t then
        local currentMobFolder = nil -- Переменная для хранения текущей папки моба
        local currentMobName = "" -- Переменная для хранения текущего названия моба
        local attackingMob = nil -- Переменная для хранения ссылки на текущего атакуемого моба

        function TweenToTarget(CFgo)
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / currentTweenSpeed, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})
            tween:Play()
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

-- Добавляем слайдер под скриптом
farm:Slider("Tween Speed:", 0, 300, currentTweenSpeed, function(t)
    currentTweenSpeed = t -- Обновляем значение скорости Tween
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
            weapon = "sword_combat_Slash"
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
   
            wait(1.5) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
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
        weapon = "sword_combat_Slash"
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

        wait(1.5) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
    end
end
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








local DungeonFarm = win:Tab("Dungeon")

DungeonFarm:Button("Dungeon 1", function()
    lib:Notification("Dungeon | Versa", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware/main/VersawareFree.lua", true))()
end)

DungeonFarm:Button("Dungeon 2", function()
    lib:Notification("Dungeon | Hubris", "Executed", "OK")
    loadstring(game:HttpGet("https://gist.github.com/NotHubris/16fbe2bf8d9563e09858c5cd2c6fafce/raw", true))()
end)

DungeonFarm:Button("Dungeon 3", function()
    lib:Notification("Dungeon | 3", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Skeereddo/name/main/krnl", true))()
end)

DungeonFarm:Button("Dungeon | Anti-Afk", function()
    lib:Notification("Dungeon | Anti-Afk", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/batusz/main/roblox/__Anti__Afk__Script__", true))()
end)

DungeonFarm:Button("Dungeon | FPS-BOOST", function()
    lib:Notification("Dungeon | FPS-BOOST", "Executed", "OK")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/FPS%20Boost', true))()
end)

local spins = win:Tab("Auto-Spins")

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Clans | Auto-Spins", function()
    lib:Notification("Clans | Auto-Spin", "Executed", "OK")
    for i = 1,game.ReplicatedStorage.Player_Data[game.Players.LocalPlayer.Name].Spins.Value do
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin")
    task.wait(.13)
    if table.find(wanted,game.ReplicatedStorage.Player_Data[game.Players.LocalPlayer.Name].Clan.Value) then
        return end
    end
end)

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Daily | Auto-Spins", function()
    lib:Notification("Daily | Auto-Spins", "Executed", "OK")
    while true do
        task.wait(.13)
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end 
end)


local code1 = "Thx4300MNOuwohanaIsBack"
local code2 = "Thx4300MNOuwohanaIsBack"
local code3 = "Thx4300MNOuwohanaIsBack"
local code4 = "Thx4300MNOuwohanaIsBack"
local code5 = "Thx4300MNOuwohanaIsBack"

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Auto use Codes", function()
    lib:Notification("Auto use Codes", "Executed", "OK")
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code1)
    task.wait(11)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code2)
    task.wait(11)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code3)
    task.wait(11)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code4)
    task.wait(11)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code5)
end)



local Teleports = win:Tab("Teleports")

local teleportOptions = {"Nomay Village", "Village 2", "Mugen Train Station", "Devourers Jaw"} -- Обновленный список локаций
local selectedOption = teleportOptions[1] -- Значение по умолчанию

Teleports:Dropdown("Teleport Location", teleportOptions, function(option)
    selectedOption = option
end)

Teleports:Button("Teleport", function()
    local plr = game:GetService('Players').LocalPlayer.Name

    if selectedOption == "Nomay Village" then
        oh1 = plr .. ".PlayerGui.Npc_Dialogue.Guis.ScreenGui.LocalScript"
        oh2 = 436704.21677269996
    elseif selectedOption == "Village 2" then
        oh1 = plr .. ".PlayerGui.Npc_Dialogue.Guis.ScreenGui.LocalScript"
        oh2 = 438042.4649977
    elseif selectedOption == "Mugen Train Station" then
        oh1 = plr .. ".PlayerGui.Npc_Dialogue.Guis.ScreenGui.LocalScript"
        oh2 = 438393.42154929996
    elseif selectedOption == "Devourers Jaw" then
        oh1 = plr .. ".PlayerGui.Npc_Dialogue.Guis.ScreenGui.LocalScript"
        oh2 = 438450.62906049995
    end

    local oh3 = selectedOption -- Используем выбранную опцию из выпадающего списка

    game:GetService("ReplicatedStorage").teleport_player_to_location_for_map_tang:InvokeServer(oh1, oh2, oh3)
end)