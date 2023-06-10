local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/razefear12/jjkdgsg/main/ui.lua")()

local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyama"}

local win = lib:Window("UnknownHub | Project Slayers (Main Menu)", Color3.fromRGB(140, 44, 224), Enum.KeyCode.RightControl)

local maintab = win:Tab("Main")

maintab:Button("Join to Dungeon", function()
    game:GetService("TeleportService"):Teleport(11468075017)
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



local Credits = win:Tab("Credits")

Credits:Button("Join/Copy Discord",function()
    setclipboard("discord.gg/h6TSHMErNP")
    lib:Notification("Discord Invite", "Link Copied", "OK")
    syn.request(
        {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com",
            },
            Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = "h6TSHMErNP",
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
        })
    end)