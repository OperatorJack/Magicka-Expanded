local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("permutation", 335)

local permutationList = {
    [10] = "scamp",
    [20] = ""
}

local function onPermutationTick(e)
    if (e.caster ~= tes3.player) then
        return
    end
    
    local value = (e.caster.mobile.willpower.current * .4) + (e.caster.mobile.conjuration.current * .6)
    local id
    for listIndex, listId in pairs(permutationList) do
        if (id == nil) then
            id = listId
        end

        if (listIndex > value) then
            break
        else
            id = listId
        end
    end

    e:triggerSummon(id)
end

local function addPermutationEffect()
	framework.effects.conjuration.createBasicEffect({
		-- Base information.
		id = tes3.effect.permutation,
		name = "Permutation",
		description = "Summons a creature from Oblivion that is increasingly more powerful depending on the caster's conjuration and willpower.",

		-- Basic dials.
		baseCost = 50.0,

		-- Various flags.
		allowEnchanting = true,
        allowSpellmaking = true,
        canCastSelf = true,
        hasNoMagnitude = true,
        nonRecastable = true,
        casterLinked = true,
        appliesOnce = true,

		-- Graphics/sounds.
        lighting = { 0, 0, 0 },

		-- Required callbacks.
		onTick = onPermutationTick,
	})
end

event.register("magicEffectsResolved", addPermutationEffect)