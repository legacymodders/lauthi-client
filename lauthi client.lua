getgenv().lauthi_url = "http://35.179.92.115"

local sw
local supported = false

if getexecutorname and type(getexecutorname) == "function" then
    if getexecutorname() == "ScriptWare" then
        sw = true
        supported = true
    end
end

if syn then
   supported = true
end

if KRNL_LOADED then
   supported = true 
end

if not supported then
    game.Players.LocalPlayer:Kick("sorry, but your executor is not supported by lauthi.")
end

local req

if syn then
    req = syn.request({
        Url = getgenv().lauthi_url,
        Method = "GET"
    })
end

if sw or KRNL_LOADED then
	local params = {
		Url = getgenv().lauthi_url,
		Method = "GET"
	}
	
    req = request(params)
end


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
