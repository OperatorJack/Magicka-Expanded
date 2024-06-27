local common = require("OperatorJack.MagickaExpanded.common")
local log = require("OperatorJack.MagickaExpanded.utils.logger")

--- A model describing a distribution setting.
---@class MagickaExpanded.Distribution.DistributionModel
---@field spell tes3spell | string The spell or spell ID that should be distributed.
---@field objectType tes3.objectType The object type to distribute to. Supports `tes3.objectType.race`, `tes3.objectType.class`, `tes3.objectType.npc`, and `tes3.objectType.creature`.
---@field object tes3object | string The object or object ID that should be distributed to.
---@field distributionChance number | nil The chance of distribution occuring. To always distribute, leave nil or enter 100. For 50% chance, enter 50, and so on.
---@field source string The source of the configuration. Your mod name or other identifier. Used for logging purposes.

--- Distribution module for configuring spell distribution mechanics.
---@class MagickaExpanded.Distribution
local this = {}

---@type { [string] : MagickaExpanded.Distribution.DistributionModel }
this.races = {}

---@type { [string] : MagickaExpanded.Distribution.DistributionModel }
this.classes = {}

---@type { [string] : MagickaExpanded.Distribution.DistributionModel }
this.npcs = {}

---@type { [string] : MagickaExpanded.Distribution.DistributionModel }
this.creatures = {}

local whitelistObjectTypeFilters = {
    [tes3.objectType.race] = true,
    [tes3.objectType.class] = true,
    [tes3.objectType.npc] = true,
    [tes3.objectType.creature] = true
}
--[[ Registers one or more distribution configurations to be distributed throughout the game. Configurations are parsed and sorted into supported object type tables, then processed as each reference is loaded in game.]]
---@param items MagickaExpanded.Distribution.DistributionModel[]
this.registerDistribution = function(items)
    for _, config in ipairs(items) do
        if (whitelistObjectTypeFilters[config.objectType]) then

        else
            log:warn("Unexpected object type when registering distribution configuration: {0}",
                     config)
        end
    end
end

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
	Registers the distribution events. Configures events such that spells are distributed based on the provided distribution configurations.
]]
this.registerEvent =
    function() event.register(tes3.event.referenceActivated, onReferenceActivated) end

return this
