-- Send UDP : Player STATE
local function send_udp_state(pRitnPlayer)
	local packet = string.format(
		"STATE %s %s %.3f %.3f %s",
		settings.global[ritnlib.defines.talk.settings.server_name.name].value,
		pRitnPlayer.name,
		pRitnPlayer.player.position.x,
		pRitnPlayer.player.position.y,
		pRitnPlayer.surface.name
	)
	helpers.send_udp(1717, packet, pRitnPlayer.index)
end

-- Send UDP : Player POSITION
local function send_udp_position(pRitnPlayer)
	local packet = string.format(
		"POS %.3f %.3f",
		pRitnPlayer.position.x,
		pRitnPlayer.position.y
	)
	helpers.send_udp(1717, packet, pRitnPlayer.index)
end


----------------------------------------------------------------
local flib = {}
----------------------------------------------------------------
flib.send_udp_state = send_udp_state
flib.send_udp_position = send_udp_position
----------------------------------------------------------------
return flib
