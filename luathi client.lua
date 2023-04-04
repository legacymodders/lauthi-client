getgenv().lauthi_url = "YOUR SERVERS IPV4 ADDR"

local params = {
	Url = getgenv().lauthi_url,
	Method = "GET"
}

local req = request(params)

local whitelist
local username = string.split(req.Body, "\"")[2]

if string.find(req.Body, "true") then
	whitelist = true
else
	whitelist = false
end

print("lauthi whitelisted =", whitelist)
if whitelist then
	print("lauthi username =", username)
end
