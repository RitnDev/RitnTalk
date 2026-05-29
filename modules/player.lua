local flib = require(ritnlib.defines.talk.functions)

local function send_full_data(e)
    local rPlayer = RitnCoreEvent(e):getPlayer()
    if rPlayer then 
        flib.send_udp_state(rPlayer)
    end
end

local function on_player_changed_position(e) 
    local rPlayer = RitnCoreEvent(e):getPlayer()
    if (rPlayer) then 
        if rPlayer.data[rPlayer.index] == nil then return end 
        local prevValue = rPlayer.data[rPlayer.index].changed_position
        if (not prevValue) then 
            rPlayer.data[rPlayer.index].changed_position = true
            rPlayer:update()
        end
    end
end

------------------------------------------------------------------
local module = { events = {} }
------------------------------------------------------------------
module.events[defines.events.on_player_changed_surface] = send_full_data
module.events[defines.events.on_player_joined_game] = send_full_data
module.events[defines.events.on_player_changed_position] = on_player_changed_position
------------------------------------------------------------------
return module