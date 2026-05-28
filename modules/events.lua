---------------------------------------------------------------------------------------------
-- EVENTS
---------------------------------------------------------------------------------------------

-- on_init
local function on_init_mod()
    log('RitnCharacters -> on_init !')
    ---------------------------------------------
    remote.call("RitnCoreGame", "add_param_data", "player", "changed_position", false)
    ---------------------------------------------
    log('on_init : RitnTalk -> finish !')
end

-- Envoi de la position
local function on_nth_tick()
    local players = remote.call('RitnCoreGame', 'get_players')
    for index, player in pairs(players) do 
		if player.connected and player.changed_position then 
			local luaPlayer = game.get_player(index) 
			if (luaPlayer) then 
				local packet = string.format(
					"POS %.3f %.3f", 
					luaPlayer.position.x,
					luaPlayer.position.y
				)
				helpers.send_udp(1717, packet, index)
			end
			player.changed_position = false
			players[index] = player
		end
    end
	remote.call('RitnCoreGame', 'set_players', players)
end

-------------------------------------------
script.on_nth_tick(60 / 20, on_nth_tick)
-------------------------------------------
local module = { events = {} }
-------------------------------------------
module.on_init = on_init_mod
-------------------------------------------
return module