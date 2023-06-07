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

farm:Toggle("Killaura V1 (fans)", false, function(t)
    if t then
        local args1 = {
            [1] = "fans_combat_slash",
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 919,
            [9] = 99999
        }
    
        local args2 = {
            [1] = "fans_combat_slash",
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 4,
            [9] = 99999
        }

        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args2))
        
        task.wait(1.5)

        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args1))
        -- Циклическое повторение первого и второго скрипта
        while true do
            -- Выполнение второго скрипта четыре раза
            for i = 1, 4 do
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args2))
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args2))
            end
    
            -- Задержка в 1.5 секунды
            task.wait(1.5)
    
            -- Выполнение первого скрипта один раз
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args1))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args1))
        end
    end
end)

farm:Toggle("Killaura (only for players)", false, function(t)
    
    while true do
        local plr = game:GetService('Players').LocalPlayer.Name
    
        for i,v in pairs(game:GetService('Players'):GetPlayers()) do
            local oh1 = "fans_combat_slash"
            local oh2 = game:GetService("Players").LocalPlayer
            local oh3 = game:GetService("Players").LocalPlayer.Character
            local oh4 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            local oh5 = game:GetService("Players").LocalPlayer.Character.Humanoid
            local oh6 = 4
            local oh7 = false
            local oh8 = false
            local oh9 = 0
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9)
            wait(1.3) -- Добавляем задержку в 1.3 секунды между итерациями
        end
    
        wait(1.0) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
    end
end)

-- Получаем ссылки на игрока и NPC
local player = game.Players.LocalPlayer
local npcFolder = game.Workspace.Mobs.Bosses

-- Определяем расстояние между NPC и игроком
local distance = 10

-- Создаем список доступных NPC
local npcOptions = {}

-- Заполняем список npcOptions из папки npcFolder
for _, npcObj in ipairs(npcFolder:GetChildren()) do
        table.insert(npcOptions, npcObj.Name)
end

-- Функция для обработки выбранного NPC
local function selectNPC(npcName)
    -- Найдите соответствующий объект NPC на основе его имени
    local selectedNPC = npcFolder:FindFirstChild(npcName)

    if selectedNPC then
        while true do
            -- Определяем позицию и ориентацию выбранного NPC
            local npcPosition = selectedNPC.PrimaryPart.Position
            local npcOrientation = selectedNPC.PrimaryPart.CFrame.LookVector

            -- Рассчитываем позицию игрока с учетом смещения
            local playerPosition = npcPosition - npcOrientation * distance

            -- Устанавливаем позицию игрока
            player.Character.HumanoidRootPart.CFrame = CFrame.new(playerPosition)

            -- Ждем перед обновлением позиции игрока
            wait()
        end
    else
        print("NPC not found:", npcName)
    end
end

-- Создаем выпадающий список
local dropdown = farm:Dropdown("Select boss", npcOptions, function(selectedOption)
    -- Вызываем функцию selectNPC, передавая выбранный NPC из выпадающего списка
    selectNPC(selectedOption)
end)

farm:Toggle("Toggle 2", false, function(toggleState)
    if toggleState then
        local selectedOption = dropdown:GetSelected()

        -- Вызываем функцию selectNPC, передавая выбранный NPC из выпадающего списка
        selectNPC(selectedOption)
    else
        -- Дополнительные действия, если toggle выключен
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
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end 
end)

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Spins Codes | Fast 75 spins", function()
    task.wait(.13)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(unpack(args))
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