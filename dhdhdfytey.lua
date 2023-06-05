local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local args = {
    [1] = "Thx4300MNOuwohanaIsBack"
}

local win = lib:Window("UnknownHub | Project Slayers", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local DungeonFarm = win:Tab("Main")

DungeonFarm:Button("Dungeon", function()
    lib:Notification("Dungeon | Versaware", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware/main/VersawareFree.lua", true))()
end)

DungeonFarm:Button("Dungeon 2", function()
    lib:Notification("Dungeon | Hubris", "Executed", "OK")
    loadstring(game:HttpGet("https://gist.github.com/NotHubris/16fbe2bf8d9563e09858c5cd2c6fafce/raw", true))()
end)

DungeonFarm:Button("Dungeon | Anti-Afk", function()
    lib:Notification("Dungeon | Anti-Afk", "Executed", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/batusz/main/roblox/__Anti__Afk__Script__", true))()
end)

DungeonFarm:Button("Dungeon | FPS-BOOST", function()
    lib:Notification("Dungeon | FPS-BOOST", "Executed", "OK")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/FPS%20Boost', true))()
end)

DungeonFarm:Button("Zyrc Hub | Hack", function()
    lib:Notification("Zyrc Hub | Hack", "You looser!", "yes!")
    _G.key = "LkbS3vAWFx3i49Ph" 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/z4kshub/Scripts/main/Protected%20(3).lua"))()
end)

local spins = win:Tab("Spins")

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Clans | Auto-Spin", function()
    while true do
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end 
end)

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Daily | Auto-Spin", function()
    while true do
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end 
end)

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Spins Codes | Fast 75 spins", function()
        wait(10)
        game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(unpack(args))
end)

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(140, 44, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)


changeclr:Colorpicker("Colorpicker", Color3.fromRGB(255, 0, 0), function(t)
    print(t)
end)