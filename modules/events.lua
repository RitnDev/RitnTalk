---------------------------------------------------------------------------------------------
-- EVENTS
---------------------------------------------------------------------------------------------
local flib = require(ritnlib.defines.talk.functions)
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
local function send_position()
    local players = remote.call('RitnCoreGame', 'get_players')
    for index, player in pairs(players) do 
		if player.connected and player.changed_position then 
			local luaPlayer = game.get_player(index) 
			if (luaPlayer) then 
				flib.send_udp_position(luaPlayer)
			end
			player.changed_position = false
			players[index] = player
		end
    end
	remote.call('RitnCoreGame', 'set_players', players)
end

-- Raffraichissement de l'etat du joueur à intervalle régulier afin de vérifier s'il est toujours actif
local function refresh_state()
	local players = remote.call('RitnCoreGame', 'get_players')
    for _, player in pairs(game.connected_players) do 
		local rPlayer = RitnCorePlayer(game.get_player(player.index))
		if (rPlayer) then 
			flib.send_udp_state(rPlayer)
		end
    end
end

-------------------------------------------
script.on_nth_tick(60 / 20, send_position)
------------------------------------------------------------------
script.on_nth_tick(60 * 4.5, refresh_state)
-------------------------------------------
local module = { events = {} }
-------------------------------------------
module.on_init = on_init_mod
-------------------------------------------
return module