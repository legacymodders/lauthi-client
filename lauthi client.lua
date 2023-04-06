local config = {
	lauthi_url = "http://YOUR SERVERS IPv4 ADDR"
}
table.freeze(config)

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
    warn("sorry, but your executor is not supported by lauthi.")
    return
end

local resp

if syn then
    local params = {
        Url = config.lauthi_url,
        Method = "GET"
    }

    local resp = {
        req = syn.request(params)
    }
    table.freeze(resp)
end

if sw or KRNL_LOADED then
	local params = {
		Url = config.lauthi_url,
		Method = "GET"
	}
	
	resp = {
		req = request(params)
	}
	table.freeze(resp)
end

local user = {
	name = string.split(resp.req.Body, "\"")[2]
}
table.freeze(user)

if string.find(resp.req.Body, "true") then
	status = {
		whitelisted = true
	}
	
	table.freeze(status)
else
	status = {
		whitelisted = false
	}
	table.freeze(status)
end

if status.whitelisted then
	print("whitelisted successfully!")
	print("welcome", user.name)
else
	print("test")
end
