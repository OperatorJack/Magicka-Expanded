local common = require("OperatorJack.MagickaExpanded.common")

local this = {}

this.getTome = function(tomeId, spellId)
    return {
        id = tomeId,
        spellId = spellId
    }
end

this.registerTome = function(tome)
	event.register(
		"bookGetText", 
		function()
			if (common.hasSpell(tes3.mobilePlayer, tome.spellId)) then
                tes3.messageBox("You attempt to read the tome but can learn nothing more.")
			else				
				mwscript.addSpell({reference = tes3.player, spell = tome.spellId})
			end
		end,
		tome.id
	)
end

this.registerTomes = function(tomes)
	for _, tome in ipairs(tomes) do
		this.registerTome(tome)
	end
end

return this