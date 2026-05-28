local dirty_players = {}

local function send_full_data(e)
    local rPlayer = RitnCoreEvent(e):getPlayer()
    if rPlayer then 
        local packet = string.format(
            "STATE %s %s %.3f %.3f %s %s", 
            settings.global[ritnlib.defines.talk.settings.server_name.name].value, 
            rPlayer.name, 
            rPlayer.player.position.x, 
            rPlayer.player.position.y, 
            rPlayer.surface.name,
            rPlayer.connected
        )
        helpers.send_udp(1717, packet, rPlayer.index)
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
module.events[defines.events.on_player_left_game] = send_full_data
module.events[defines.events.on_player_changed_position] = on_player_changed_position
------------------------------------------------------------------
return module