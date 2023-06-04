local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local clans = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyam"}

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyam"}


local win = lib:Window("UnknownHub | Project Slayers", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Main")

tab:Button("Button", function()
    lib:Notification("Notification", "Hello!", "Hi!")
end)

tab:Toggle("Toggle", false, function(t)
    print(t)
end)

tab:Slider("Slider", 0, 100, 30, function(t)
    print(t)
end)

tab:Colorpicker("Colorpicker", Color3.fromRGB(255, 0, 0), function(t)
    print(t)
end)

tab:Textbox("Textbox", true, function(t)
    print(t)
end)

local spins = win:Tab("Spins")

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Daily | Auto-Spin", function()
    while true do
        wait()
        if game.PlaceId ~= 5956785391 then
            lib:Notification("Daily | Auto-Spin", "Activeted", "OK")
            game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
        end
    end    
end)


spins:Dropdown("Select Clans", clans, function(selectedClan)
    print("Selected Clan:", selectedClan)
    lib:Notification("Clan Selected", "You selected the clan: "..selectedClan, "OK")
end)


spins:Button("Clans | Auto-Spins"):Bind(function()
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

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(140, 44, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)