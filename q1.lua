-- adding a local variable for clarity and avoid mistakes
local PLAYER_STORAGE_KEY = 1000

local function releaseStorage(player)
    player:setStorageValue(PLAYER_STORAGE_KEY, -1)
end

function onLogout(player)
    if player:getStorageValue(PLAYER_STORAGE_KEY) == 1 then
    	-- assuming addEvent requires a parameter that is a delay, adding a variable for clarity
    	-- if it's suppose to be the key, we shouldn't need it because releaseStorage does not require other parameters
    	local eventDelay = 1000
        addEvent(releaseStorage, eventDelay, player)
    end
    return true
end