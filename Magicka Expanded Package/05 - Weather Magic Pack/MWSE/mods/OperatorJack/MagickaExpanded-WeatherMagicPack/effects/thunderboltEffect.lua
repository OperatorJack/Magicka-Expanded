local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("thunderbolt", 323)

local function onThunderboltCollision(e)
    if e.collision then
        -- Verify effect conditions are met.
        local caster = e.sourceInstance.caster
        if (caster.cell.isInterior == true) then
            return
        end

        if (tes3.worldController.weatherController:getWeather() == tes3weather.thunderstorm) then
            return
        end

        ---@type tes3magicEffect
        local effect = framework.functions.getEffectFromEffectOnEffectEvent(e, tes3.effect.thunderbolt)

        local caster = e.sourceInstance.caster
        local effectDuration = 2
        local distanceLimit = 350
        local position = e.collision.point:copy()

        local reference = tes3.createReference({
            object = "OJ_ME_ThunderboltObject",
            position = position,
            cell = caster.cell
        })

        -- Add a mechanic to the thunderbolt mesh.
        timer.start({ 
            duration = 1,
            callback = function()
                local actors = framework.functions.getActorsNearTargetPosition(caster.cell, position, distanceLimit)
                local spell = tes3.getObject("OJ_ME_ThunderBoltEffect")

                -- For any actors near the thunderbolt, remove the light effect if it exists.
                for _, actor in pairs(actors) do
                    mwscript.explodeSpell({
                        reference = actor,
                        spell = spell
                    })
                end
            end, 
            iterations = (effectDuration - 1) 
        })

        timer.start(
        {
            duration = effectDuration,
            callback = function()
                --@type tes3reference
                reference:disable()

                timer.delayOneFrame({
                    callback = function()
                        reference.deleted = true
                    end
                })
            end
        })
	end
end

local function addthunderboltEffect()
	framework.effects.destruction.createBasicEffect({
		-- Base information.
		id = tes3.effect.thunderbolt,
		name = "Thunderbolt",
		description = "Cast a thunderbolt down from above. Requires being outside and being in a thunderstorm. Thunderbolts will damage and stun affected targets.",

		-- Basic dials.
		baseCost = 25.0,

		-- Various flags.
		allowEnchanting = true,
        allowSpellmaking = true,
        hasNoMagnitude = true,
        hasNoDuration = true,
		canCastTarget = true,
        canCastTouch = true,

		-- Graphics/sounds.

		-- Required callbacks.
		onCollision = onThunderboltCollision,
	})
end

event.register("magicEffectsResolved", addThunderboltEffect)