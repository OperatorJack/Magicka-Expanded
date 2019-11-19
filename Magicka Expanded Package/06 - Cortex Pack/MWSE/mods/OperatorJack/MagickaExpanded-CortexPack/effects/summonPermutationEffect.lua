local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("summonPermutation", 335)

local permutationList = {
    [1] = "scamp",
    [2] = ""
}

local function onSummonPermutationTick(e)
    if (e.caster ~= tes3.player) then
        return
    end
    
    local id = tes3.player.data.OJ_ME_CP.SummonPermutationLevel or 1
    e:triggerSummon(id)
end

local function addSummonPermutationEffect()
	framework.effects.conjuration.createBasicEffect({
		-- Base information.
		id = tes3.effect.summonPermutation,
		name = "Summon Permutation",
		description = "Summons a permutating creature from oblivion that shifts form which each kill it makes.",

		-- Basic dials.
		baseCost = 50.0,

		-- Various flags.
        canCastSelf = true,
        hasNoMagnitude = true,
        nonRecastable = true,
        casterLinked = true,
        appliesOnce = true,

		-- Graphics/sounds.
        lighting = { 0, 0, 0 },

		-- Required callbacks.
		onTick = onSummonPermutationTick,
	})
end