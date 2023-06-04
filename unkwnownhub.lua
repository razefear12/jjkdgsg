local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local clans = {"Uzui", "Kamado", "Rengoku", "Agatsuma"};

local players = game:GetService("Players");
local runService = game:GetService("RunService");
local replicatedStorage = game:GetService("ReplicatedStorage");

local localPlayer = players.LocalPlayer;
local playerData = replicatedStorage:WaitForChild("Player_Data");
local localData = playerData:WaitForChild(localPlayer.Name);
local clan = localData:WaitForChild("Clan");

local remotes = replicatedStorage:WaitForChild("Remotes");
local sendServer = remotes:WaitForChild("To_Server");
local handleSpin = sendServer:WaitForChild("Handle_Initiate_S_");

local win = lib:Window("PREVIEW", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Tab 1")

tab:Button("Button", function()
    lib:Notification("Notification", "Hello!", "Hi!")
end)

tab:Toggle("Toggle", false, function(t)
    print(t)
end)

tab:Slider("Slider", 0, 100, 30, function(t)
    print(t)
end)

tab:Dropdown("Dropdown", {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"}, function(t)
    print(t)
end)

tab:Colorpicker("Colorpicker", Color3.fromRGB(255, 0, 0), function(t)
    print(t)
end)

tab:Textbox("Textbox", true, function(t)
    print(t)
end)

tab:Bind("Bind", Enum.KeyCode.RightShift, function()
    print("Pressed!")
end)

tab:Label("Label")

-- Обработчик события для выполнения Lua-скрипта
tab:Button("Execute Script", function()
    while task.wait() do
    if (not table.find(clans, clan.Value)) then
       if (game.PlaceId ~= 5956785391) then
           localPlayer:Kick("use the script in the main menu");
       else
           handleSpin:InvokeServer("check_can_spin");
       end
   end
end
end)

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(44, 120, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)
