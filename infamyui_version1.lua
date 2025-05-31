local G2L = {};
G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;

G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Size"] = UDim2.new(0, 555, 0, 75);
G2L["2"]["Position"] = UDim2.new(0.62709, 0, 0.0201, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["BackgroundTransparency"] = 0.6;

G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["Size"] = UDim2.new(0, 531, 0, 36);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Time Elapsed : N/A]];
G2L["3"]["Name"] = [[Time]];
G2L["3"]["Position"] = UDim2.new(0.02162, 0, 0.16, 0);

G2L["4"] = Instance.new("LocalScript", G2L["3"]);

G2L["5"] = Instance.new("TextLabel", G2L["2"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["Size"] = UDim2.new(0, 555, 0, 21);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[This script was made and released for free, and made open source by choice. CodePhoenix]];
G2L["5"]["Name"] = [[codephoenix]];
G2L["5"]["Position"] = UDim2.new(0, 0, 0.72, 0);

G2L["6"] = Instance.new("TextLabel", G2L["2"]);
G2L["6"]["TextWrapped"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextSize"] = 25;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Size"] = UDim2.new(0, 93, 0, 12);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[1.0.0]];
G2L["6"]["Name"] = [[Version]];
G2L["6"]["Position"] = UDim2.new(0, 0, 0.08, 0);

local function C_4()
    local script = G2L["4"];
    local textLabel = script.Parent
    
    local startTime = os.time()
    local function updateTime()
        local currentTime = os.time()
        local elapsed = currentTime - startTime
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = elapsed % 60
        textLabel.Text = string.format("Time Elapsed : %dh %dm %ds", h, m, s)
    end
    
    while true do
        updateTime()
        wait(1)
    end
end
task.spawn(C_4);
return G2L["1"]
