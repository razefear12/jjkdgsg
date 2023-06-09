local placeId = game.PlaceId

print("Script loaded...")

if placeId == 5956785391 then
    print("You are in a different Place ID")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/razefear12/jjkdgsg/main/unknownMainmenu.lua", true))()
elseif placeId == 11468075017 then
    print("You are in a different Place ID")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/razefear12/jjkdgsg/main/unknownDungeon.lua", true))()
elseif placeId == 6152116144 then
    print("You are in a different Place ID")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/razefear12/jjkdgsg/main/unknownMap1.lua", true))()
elseif placeId == 11468159863 then
    print("You are in a different Place ID")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/razefear12/jjkdgsg/main/unknownMap2.lua", true))()
else
   print("Nice! <3")
end