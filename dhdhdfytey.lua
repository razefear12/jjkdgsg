local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyama"}

local args = {
    [1] = "Thx4300MNOuwohanaIsBack"
}

local win = lib:Window("UnknownHub | Project Slayers", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local DungeonFarm = win:Tab("Main")

DungeonFarm:Button("Dungeon 1", function()
    lib:Notification("Dungeon | Versa", "Executed", "OK")
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

local spins = win:Tab("Spins")

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
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(unpack(args))
end)

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(140, 44, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)


changeclr:Colorpicker("Colorpicker", Color3.fromRGB(255, 0, 0), function(t)
    print(t)
end)



-- Library functions
-- Sets the watermark visibility
lib:SetWatermarkVisibility(true)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    lib:SetWatermark(('UnknownHub | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);