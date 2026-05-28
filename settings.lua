require("core.defines")
----------------------------------------------------------------------
data:extend {
	
	{
		-- Nom du salon mumble.
		type = "string-setting",
		name = ritnlib.defines.talk.settings.server_name.name,
		setting_type = "runtime-global",
		default_value = ritnlib.defines.talk.settings.server_name.default_value,
		allow_blank = false,
		auto_trim = true,
		order = ritnlib.defines.talk.settings.server_name.order
	},
	
}