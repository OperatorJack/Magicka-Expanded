local common = require("OperatorJack.MagickaExpanded.common")

local this = {}

this.getGrimoire = function(grimoireId, spellIds)
    local i = 1
    local grimoire = {
        id = grimoireId,
        spellIds = {}
    }
    for _, spellId in ipairs(spellIds) do         
        grimoire.spellIds[i] = spellIds
        i = i + 1
    end  
end

this.registerGrimoire = function(grimoire)
	event.register(
		"bookGetText", 
        function()
            local newSpell = false
            for _, spellId in ipairs(grimoire.spellIds) do         
                if (common.hasSpell(tes3.mobilePlayer, spellId) == false) then			
                    mwscript.addSpell({reference = tes3.player, spell = spellId})
                    newSpell = true
                end
            end
            if (newSpell == false) then
                tes3.messageBox("You attempt to read the grimoire but can learn nothing more.")
            end
		end,
		grimoire.id
	)
end

this.registerGrimoires = function(grimoires)
	for _, grimoire in ipairs(grimoires) do
		this.registerGrimoire(grimoire)
	end
end

return this