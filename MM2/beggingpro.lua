repeat task.wait() until game:IsLoaded()

local list = {
    "does anyone has a free common plz ill be super grateful",
    "please free gray stuff im just starting out",
    "can I get some spare bad stuff I'm new to MM2 trading plz"
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
