local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("iceBarrage", 324)

local function onIceBarrageCollision(e)
    if e.collision then
        -- Verify effect conditions are met.
        local caster = e.sourceInstance.caster
        if (caster.cell.isInterior == true) then
            return
        end

        if (tes3.worldController.weatherController:getWeather() == tes3weather.blizzard) then
            return
        end

        ---@type tes3magicEffect
        local effect = framework.functions.getEffectFromEffectOnEffectEvent(e, tes3.effect.iceBarrage)

        local effectDuration = 2
        local distanceLimit = 350
        local position = e.collision.point:copy()

        local reference = tes3.createReference({
            object = "OJ_ME_IceBarrageObject",
            position = position,
            cell = caster.cell
        })

        -- Add a mechanic to the Ice Barrage mesh.
        timer.start({ 
            duration = 1,
            callback = function()
                local actors = framework.functions.getActorsNearTargetPosition(caster.cell, position, distanceLimit)
                local spell = tes3.getObject("OJ_ME_IceBarrageEffect")

                -- For any actors near the Ice Barrage, remove the light effect if it exists.
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

local function addIceBarrageEffect()
	framework.effects.destruction.createBasicEffect({
		-- Base information.
		id = tes3.effect.iceBarrage,
		name = "Ice Barrage",
		description = "Cast a ice down from above. Requires being outside and being in a blizzard. Ice Barrages will damage and freeze affected targets.",

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
		onCollision = onIceBarrageCollision,
	})
end

event.register("magicEffectsResolved", addIceBarrageEffect)