getgenv().lauthi_url = "http://YOUR SERVERS IPV4 ADDR"

local sw

function checkExec()
    if getexecutorname and type(getexecutorname) == "function" then
        if not getexecutorname() == "ScriptWare" then
        	game.Players.LocalPlayer:Kick("sorry, but your executor does not support lauthi!")
    	  end
        if getexecutorname() == "ScriptWare" then
	      sw = true;
	  end
    else
    	game.Players.LocalPlayer:Kick("sorry, but your executor does not support lauthi!")
    end
end

if not syn then
   checkExec() 
end

local req

if syn then
    req = syn.request({
        Url = getgenv().lauthi_url,
        Method = "GET"
    })
end

if sw then
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
