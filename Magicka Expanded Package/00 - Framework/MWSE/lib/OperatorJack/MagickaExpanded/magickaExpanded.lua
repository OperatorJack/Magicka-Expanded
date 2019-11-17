--[[
	Magicka Expanded
	By OperatorJack
]]

local common = require("OperatorJack.MagickaExpanded.common")

-- Initialize any script overrides that are set within the framework.
require("OperatorJack.MagickaExpanded.classes.scriptOverrides")

local this = {}

this.info = function(message)
	common.info(message)
end
this.debug = function(message)
	common.debug(message)
end
this.error = function(message)
	common.error(message)
end

this.getActiveSpells = function()
	return common.spells
end

this.alchemy = require("OperatorJack.MagickaExpanded.classes.alchemy")

this.spells = require("OperatorJack.MagickaExpanded.classes.spells")

this.enchantments = require("OperatorJack.MagickaExpanded.classes.enchantments")

this.effects =  require("OperatorJack.MagickaExpanded.classes.effects")

this.tomes = require("OperatorJack.MagickaExpanded.classes.tomes")

this.grimoires = require("OperatorJack.MagickaExpanded.classes.grimoires")

this.functions =  require("OperatorJack.MagickaExpanded.classes.functions")

--[[
	Description: Registers all magic effects, spells, tomes, and grimoires that
	are created through the Magicka Expanded framework.
]]
local registered = false
local function onLoaded()
	event.trigger("MagickaExpanded:Register")
	
	if (registered == false) then
		this.tomes.registerEvent()
		this.grimoires.registerEvent()
		registered = true
	end

	this.info("Magicka Expanded Framework Initialized")
end

event.register("loaded", onLoaded)

return this