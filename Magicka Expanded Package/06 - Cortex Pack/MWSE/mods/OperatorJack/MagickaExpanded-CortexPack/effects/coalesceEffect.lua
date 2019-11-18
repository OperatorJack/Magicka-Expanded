local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("coalesce", 333)

local function onMobileActivated(e)
    local mobile = e.mobile -- Added cached version here.
    local spellInstance = mobile.spellInstance
    local firingRef = mobile.firingMobile and mobile.firingMobile.reference
    local caster = spellInstance and spellInstance.caster
	mwse.log("Created mobile of '%s' that was fired by '%s' and cast by '%s'", mobile.reference, firingRef, caster)
	
	local isProjectileUsingCoalesce
	local effect
	for i = 0, 6 do
		if (spellInstance.sourceEffects[i].id == tes3.effect.coalesce) then
			isProjectileUsingCoalesce = true
			effect = spellInstance.sourceEffects[i]
		end
	end

	if (isProjectileUsingCoalesce) then
		local spellDuration = effect.duration
		local duration = .01
		local interations = spellDuration / duration
		local projectileTimer = timer.start({
			iterations = iterations
			duration = duration
			callback = function()
				if (mobile) then
					mobile.position = mobile.position + tes3.getPlayerEyeVector() * 250
				else
					projectileTimer:cancel()
				end
			end
		})
	end
end
event.register("mobileActivated", onMobileActivated)

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
		onTick = function() e:trigger() end,
	})
end

event.register("magicEffectsResolved", Coalesce)