local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("coalesce", 333)

local function onCoalesceTick(e) 
    framework.debug("Ticking...")
    if (e.sourceInstance.projectile) then
        e.sourceInstance.projectile.position = e.sourceInstance.projectile.position + tes3.getPlayerEyeVector() * 250
    end
end

local function Coalesce()
	framework.effects.alteration.createBasicEffect({
		-- Base information.
		id = tes3.effect.coalesce,
		name = "Coalesce",
		description = "When present in a spell, gives the caster control over the spell projectile during projectile flight.",

		-- Basic dials.
		baseCost = 5.0,

		-- Various flags.
        canCastTouch = true,
        canCastTarget = true,
        hasNoMagnitude = true,
        hasNoDuration = true,

		-- Graphics/sounds.
        lighting = { 0, 0, 0 },

		-- Required callbacks.
		onTick = onCoalesceTick,
	})
end

event.register("magicEffectsResolved", Coalesce)