local this = {}

this.info = function (message)
    local prepend = '[Magicka Expanded: INFO] '
    mwse.log(prepend .. message)
end

this.debug = function (message)
    local prepend = '[Magicka Expanded: DEBUG] '
    mwse.log(prepend .. message)
end

this.error = function (message)
    local prepend = '[Magicka Expanded: ERROR] '
    mwse.log(prepend .. message)
end

this.spells = {}
this.potions = {}

this.addSpellToSpellsList = function(spell)
	table.insert(this.spells, spell)
end

this.addTestSpellsToPlayer = function()
    for i = 1,#this.spells do
        local spell = this.spells[i]
		mwscript.addSpell({reference = tes3.player, spell = spell})
	end

	this.debug("Added Test Spells to Player.")
end

this.addPotionToPotionsList = function(potion)
	table.insert(this.potions, potion)
end

this.hasSpell = function(reference, spellId)
    if (reference.object.spells:contains(spellId)) then
        return true
    end
    return false
end

return this