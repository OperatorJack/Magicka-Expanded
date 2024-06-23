local common = require("OperatorJack.MagickaExpanded.common")
local log = require("OperatorJack.MagickaExpanded.utils.logger")

--- Grimoires module for interacting with grimoire objects.
---@class MagickaExpanded.Distribution
local this = {}

local whitelistClasses = {
    ["Sorcerer"] = true,
    ["Mage"] = true,
    ["Mage Service"] = true,
    ["Battlemage"] = true
}

---@param e referenceActivatedEventData
local function onReferenceActivated(e)
    if (not e.reference.mobile) then return end
    if (e.reference.object.aiConfig.offersSpells ~= true) then return end

    e.reference.data.OJ_ME = e.reference.data.OJ_ME or {}
    e.reference.data.OJ_ME.distribution = e.reference.data.OJ_ME.distribution or {}

    for i = 1, #common.distribution do
        ---@type tes3spell
        local spell = common.distribution[i]

        if (e.reference.data.OJ_ME.distribution[spell.id] == true and
            e.reference.object.spells:contains(spell) == false) then
            e.reference.data.OJ_ME.distribution[spell.id] = nil
            log:debug("Expected spell {0} on {1} but found none, so resetting.", spell.id,
                      e.reference.object.id)
        end

        if (e.reference.data.OJ_ME.distribution[spell.id] == nil) then
            if (math.random(0, 100) < 4) then
                e.reference.data.OJ_ME.distribution[spell.id] = true
                tes3.addSpell({reference = e.reference, spell = spell, updateGUI = false})
                log:debug("Added spell {0} to {1}.", spell.id, e.reference.object.id)

            else
                e.reference.data.OJ_ME.distribution[spell.id] = false
            end

        end
    end
end

--[[
	Registers the grimoire event. On bookGetText, the collection of
		registered grimoires will be iterated through. If the book belongs to the
		collection of registered grimoires, the spells mapped to that grimoire will be
		added to the player, if the player does not already have them.
]]
this.registerEvent =
    function() event.register(tes3.event.referenceActivated, onReferenceActivated) end

return this
