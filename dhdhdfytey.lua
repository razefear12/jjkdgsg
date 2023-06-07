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
    game:GetService("ReplicatedStorage").Remotes.war_Drums_remote:FireServer(wardrumsbuffon)
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


local code1 = Thx4300MNOuwohanaIsBack
local code2 = Thx4300MNOuwohanaIsBack
local code3 = Thx4300MNOuwohanaIsBack
local code4 = Thx4300MNOuwohanaIsBack

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Auto use Codes", function()
    lib:Notification("Auto use Codes", "Executed", "OK")
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code1)
    task.wait(10)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code2)
    task.wait(10)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code3)
    task.wait(10)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code4)
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