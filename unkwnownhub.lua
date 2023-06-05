local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local clans = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyam"}

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyam"}


local win = lib:Window("UnknownHub | Project Slayers", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local DungeonFarm = win:Tab("Main")

DungeonFarm:Button("Dungeon", function()
    lib:Notification("Dungeon | Versaware", "Hello!", "OK")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/asterionnn/versaware/main/VersawareFree.lua", true))()
end)

DungeonFarm:Button("Dungeon 2", function()
    lib:Notification("Dungeon | Hubris", "Hello!", "OK")
    local function runScript()
        local script = game:HttpGetAsync("https://gist.github.com/NotHubris/16fbe2bf8d9563e09858c5cd2c6fafce/raw")
        loadstring(script)()
    end
    
    coroutine.wrap(runScript)()
end)

tab:Toggle("Toggle", false, function(t)
    print(t)
end)

tab:Slider("Slider", 0, 100, 30, function(t)
    print(t)
end)

tab:Textbox("Textbox", true, function(t)
    print(t)
end)

local spins = win:Tab("Spins")


spins:Button("Button", function(t)
    while true do
        wait()
        if game.PlaceId ~= 5956785391 then
            lib:Notification("Clans | Auto-Spins", "Activated", "OK")
            for i = 1, game.ReplicatedStorage.Player_Data[game.Players.LocalPlayer.Name].Spins.Value do
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_InitiateS:InvokeServer("check_can_spin")
                task.wait(.13)
                if table.find(wanted, game.ReplicatedStorage.Player_Data[game.Players.LocalPlayer.Name].Clan.Value) then
                    return
                end
            end
        end
    end    
end)


-- Обработчик события для выполнения Lua-скрипта
spins:Button("Daily | Auto-Spin", function(t)
    while true do
        wait()
        if game.PlaceId ~= 5956785391 then
            lib:Notification("Daily | Auto-Spin", "Activeted", "OK")
            game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
        end
    end    
end)

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(140, 44, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)


tab:Colorpicker("Colorpicker", Color3.fromRGB(255, 0, 0), function(t)
    print(t)
end)