--Copyright (c) 2022 Caitex#6714. Please read the "L-License": https://github.com/Caitex212/lua-examples/blob/main/L-License.txt
--Countdown example

local commandPrefix = "/"

local raceallTime
local admin = {"Caitex.212"}


function onInit()
    print("----------Loading Racing Script Done!----------")
    MP.RegisterEvent("onChatMessage","onChatMessageHandler")
	print("Register race command!")
	MP.RegisterEvent("race", "raceCommand")
	MP.CreateEventTimer("raceallTimer",1000)
end

function onChatMessageHandler(player_id, player_name, message)
	print("onChatMessage: " .. player_id .. " | " .. player_name .. " | Message: " .. message)
	message = message:sub(2)
	if message:sub(1,1) == commandPrefix then
		command = string.sub(message,2)
		onCommand(player_id, command)
		return
	end
end

function onCommand(player_id, data)
	
	local command = split(data," ")[1]
	local args
	local s = data:find(' ')
	if s ~= nil then
		args = data:sub(s+1)
	end
	args = args or ""
	
	if command == "race" then
		raceCommand(args, player_id)
	else
		MP.TriggerLocalEvent(command, args)
	end
end

function raceCommand(args, player_id)
	print("|"..args.."|", player_id)

	if args == "" then
		local isAdmin = false
		for key, value in pairs(admin) do
			if MP.GetPlayerName(player_id) == value then
				isAdmin = true
				break
			end
		end
		if isAdmin then
			raceallTime = 11
		else
			MP.SendChatMessage(player_id, "You cannot use that command!")
		end
	end
end


function raceallTimer()
	if raceallTime ~= nil then

		if raceallTime == 11 then
			MP.SendChatMessage(-1, "Race Starting In")
		
		elseif raceallTime == 10 then
			MP.SendChatMessage(-1, "10")	
		
		elseif raceallTime == 9 then
			MP.SendChatMessage(-1, "9")
		
		elseif raceallTime == 8 then
			MP.SendChatMessage(-1, "8")
		
		elseif raceallTime == 7 then
			MP.SendChatMessage(-1, "7")
		
		elseif raceallTime == 6 then
			MP.SendChatMessage(-1, "6")
		
		elseif raceallTime == 5 then
			MP.SendChatMessage(-1, "5")
		
		elseif raceallTime == 4 then
			MP.SendChatMessage(-1, "4") 
		
		elseif raceallTime == 3 then
	        MP.SendChatMessage(-1, "3")
		
		elseif raceallTime == 2 then
	        MP.SendChatMessage(-1, "2")
		
		elseif raceallTime == 1 then
	        MP.SendChatMessage(-1, "1")
		
		elseif raceallTime == 0 then
	        MP.SendChatMessage(-1, "GO")
		end
		
		raceallTime = raceallTime - 1
		if raceallTime == -1 then
			raceallTime = nil
		end
	end
end

function split(s, sep)
	local fields = {}
	local sep = sep or " "
	local pattern = string.format("([^%s]+)", sep)
	string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
	return fields
end
