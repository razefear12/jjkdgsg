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

maintab:Toggle("Toggle", false, function(t)
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
            end
    
            -- Задержка в 1.5 секунды
            task.wait(1.5)
    
            -- Выполнение второго скрипта четыре раза
            -- Выполнение первого скрипта один раз
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args1))
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
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end 
end)

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Spins Codes | Fast 75 spins", function()
    task.wait(.13)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(unpack(args))
end)



local Teleport = win:Tab("Teleport")


Teleport:Button("Teleport", function()

local args = {
    [1] = "Players.LocalPlayer.PlayerGui.Npc_Dialogue.Guis.ScreenGui.LocalScript",
    [2] = 436704.21677269996,
    [3] = "Nomay Village"
}

game:GetService("ReplicatedStorage").teleport_player_to_location_for_map_tang:InvokeServer(unpack(args))
end)
