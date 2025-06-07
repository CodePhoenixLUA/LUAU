repeat task.wait() until game:IsLoaded()

local list = {
    "Can I please have some free, common, stuff? Anything would be really helpful! It's OK if you don't want to :) Thanks!",
    "Any free items you can spare would be a huge help. No pressure, thanks!",
    "I'm just starting out in MM2, does anyone have some free commons? It will mean the world to me, and prove that MM2 players are kind souls!",
    "Hey, I'm new to MM2 and really struggling to get started. If anyone has some spare commons they'd be willing to share, I'd be forever grateful!",
    "I'm in desperate need of some common items to help me progress. If you have any to spare, please consider sharing - it would make a huge difference to me!",
    "Just starting out in MM2 and feeling a bit overwhelmed. A few free commons would really help me get on my feet - thanks in advance if you can help!",
    "I know it's a big ask, but I'm really in need of some common items. If anyone has any they don't need, I'd be super appreciative if you could send them my way!",
    "I'm trying to build up my collection in MM2, but it's tough when you're starting from scratch. If you have any spare commons, I'd love it if you could share - thanks so much!",
    "I'm not looking for anything fancy, just some basic commons to help me get started. If you have any to spare, please let me know - I'd really appreciate it!",
    "I've just joined the MM2 community and I'm excited to start playing, but I'm a bit lacking in the items department. If anyone has some free commons they'd be willing to share, that would be amazing - thanks!",
    "I'm on a tight budget in MM2 and really need some common items to help me progress. If you have any to spare, please consider sharing - it would be a huge help to me!"
}

function serverhop()
    local servers = {}
    local PlaceId = game.PlaceId
    local req = game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
    local body = game:GetService("HttpService"):JSONDecode(req)
    
    if body and body.data then
        for i, v in next, body.data do
            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                table.insert(servers, 1, v.id)
            end
        end
    end
    
    if #servers > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
    end
end

local text1 = game.Players.LocalPlayer.PlayerGui.MainGUI.Game.Leaderboard.Container.TradeRequest.ReceivingRequest
text1:GetPropertyChangedSignal("Visible"):Connect(function()
    if text1.Visible == true then
        game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("AcceptRequest"):FireServer()
    end
end)

local text2 = game.Players.LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Accepted

function allowTrade()
    local args = {
    	285646582
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("AcceptTrade"):FireServer(unpack(args))
end

text2:GetPropertyChangedSignal("Visible"):Connect(function()
    if text2.Visible == true then
        allowTrade()  
    end
end)

local chatService = game:GetService("TextChatService")
_G.autochat = true
while _G.autochat do
    for i,v in pairs(list) do
        chatService.TextChannels.RBXGeneral:SendAsync(v)
        task.wait(30)
    end
    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
        if State == Enum.TeleportState.Started then
            queue_on_teleport("https://raw.githubusercontent.com/CodePhoenixLUA/LUAU/refs/heads/main/MM2/beggingpro.lua")
        end
    end)
    serverhop()

end
