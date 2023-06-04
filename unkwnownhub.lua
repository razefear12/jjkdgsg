local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()


local win = lib:Window("UnknownHub | Project Slayers", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Main")

tab:Button("Button", function()
    lib:Notification("Notification", "Hello!", "Hi!")
end)


local spins = win:Tab("Spins")

-- Обработчик события для выполнения Lua-скрипта
spins:Button("Daily auto-spin", function(t)
    while true do
        wait()
        if game.PlaceId ~= 5956785391 then
            lib:Notification("Daily auto-spin", "", "OK")
            game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
        end
    end    
end)


local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(140, 44, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)