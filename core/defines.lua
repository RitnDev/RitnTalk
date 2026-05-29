-----------------------------------------
--               DEFINES               --
-----------------------------------------
if not ritnlib then require("__RitnBaseGame__.core.defines") end
-----------------------------------------
local name = "RitnTalk"
local dir = "__".. name .."__"
local directory = dir .. "."
-----------------------------------------
local defines = {}

-- Mod ID.
defines.name = name
-- Path to the mod's directory.
defines.directory = dir

-- Prefix
defines.prefix = {
    name = "ritnmods-",
    mod = "talk-",
}

defines.name_prefix = "ritnmods-talk-"
defines.mod_name = "ritntalk"
defines.source = "__RitnTalk__"
defines.modules = "core/modules"
defines.functions = "core/functions"
defines.class = "core/class"

-- Modules
defines.modules = {
    core = dir .. ".core.modules",
    events = dir .. ".modules.events",
    --interfaces = dir .. ".modules.interfaces",
    ----
    player = dir .. ".modules.player",
}

-- setings
local settings_prefix = defines.prefix.name .. defines.prefix.mod
defines.settings = {
    server_name = {
        name = settings_prefix .. "server-name",
        default_value = "Factorio",
        order = settings_prefix .. "00"
    },
}

----------------
ritnlib.defines.talk = defines
log('declare : ritnlib.defines.talk | '.. ritnlib.defines.talk.name ..' -> finish !')