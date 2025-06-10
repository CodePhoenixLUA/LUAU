--this script is not finished, what this does is get the values and print it, i'm busy rn working on some other things, you can finish up if you want
local HttpService = game:GetService("HttpService")

local urls = {
    "https://supremevaluelist.com/mm2/godlies.html",
    "https://supremevaluelist.com/mm2/uniques.html",
    "https://supremevaluelist.com/mm2/ancients.html",
    "https://supremevaluelist.com/mm2/vintages.html",
    "https://supremevaluelist.com/mm2/chromas.html",
    "https://supremevaluelist.com/mm2/legendaries.html",
    "https://supremevaluelist.com/mm2/rares.html",
    "https://supremevaluelist.com/mm2/uncommons.html",
    "https://supremevaluelist.com/mm2/commons.html",
    "https://supremevaluelist.com/mm2/pets.html",
    "https://supremevaluelist.com/mm2/misc.html"
}


writefile("mm2_values.txt", "")

for _, url in ipairs(urls) do
    local Response = request({
        Url = url,
        Method = "GET"
    })
    
    if Response and Response.Body then
        for name, value in Response.Body:gmatch('<div class="itemhead">(.-)</div>.-<b class="itemvalue">(.-)</b>') do
            name = name:gsub("<.->", ""):gsub("%s+$", "")
            if name ~= "Default Knife" then
                appendfile("mm2_values.txt", name .. " = " .. value .. "\n")
            end
        end
    else
        appendfile("mm2_values.txt", "Failed to fetch data from: " .. url .. "\n")
    end
end

print("Data has been saved to mm2_values.txt")

function parseValuesFile(content)
    local result = {}
    for line in content:gmatch("[^\r\n]+") do
        local name, value = line:match("^%s*(.-)%s*=%s*(.-)%s*$")
        if name and value then
            local cleanValue = value:gsub(",", "")
            local numericValue = tonumber(cleanValue)
            
            if numericValue then
                result[name] = numericValue
            end
        end
    end
    return result
end

if isfile("mm2_values.txt") then
    local fileContent = readfile("mm2_values.txt")
    local valuesTable = parseValuesFile(fileContent)
    
    local jsonData = HttpService:JSONEncode(valuesTable)
    writefile("mm2_values.json", jsonData)
    print("Data has been converted to mm2_values.json")
else
    warn("File mm2_values.txt not found")
    return
end

local filePath = "mm2_values.json"
if isfile(filePath) then
    local fileData = readfile(filePath)
    local valuesTable = HttpService:JSONDecode(fileData)
    
    print("\nDecoded values:")
    for name, value in pairs(valuesTable) do
        print(name, "=", value)
    end
else
    warn("File mm2_values.json not found")
end
