--Made by : https://v3rmillion.net/member.php?action=profile&uid=1265584

_G.Settings = {
    ['Name'] = 'Some random template',
    ['Intro'] = true,
    ['Keybind'] = 'G'
    }
    
    local Library = loadstring(game:HttpGet("https://pastebin.com/raw/QPehPJ6m", true))()
    
    
    local Tab1 = Library:CreateTab('Tab1')
    
    Tab1:Label('Epik Label')
    Tab1:Button('Epik Button', function()
    print("OMG, YOU PRESSED THE BUTTON! YOU'RE SO SMART!")
    end)
    Tab1:Toggle('Epik Toggle', false, function(bool)
    print(bool)
    end)
    Tab1:TextBox('Epik Textbox', 'Placeholder idk', function(output)
    print(output)
    end)
    Tab1:Dropdown('Epik Dropdown', {'Epic', 'Right?', 'Skillz'}, function(output)
    print(output)
    end)
    Tab1:Label('Everything is epik, totes.')
    
    local Tab2 = Library:CreateTab('Tab2')
    Tab2:Label('OMG ANOTHER TAB!')
    
    
    --[[
    Refresh example:
    ]]
    local TabwithRefresh = Library:CreateTab('TabwithRefresh')
    
    local Dropdown = TabwithRefresh:Dropdown('Epik Dropdown', {'Epic', 'Right?', 'Skillz'}, function(output)
    print(output)
    end)
    
    wait(10)
    
    Dropdown:Refresh('OMG REFRESH', {'NANI', 'WHAT IS', 'THIS MAGIC?'}, function(output)
    print(output)
    print('lol')
    end)