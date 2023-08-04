local framework = require("OperatorJack.MagickaExpanded")

tes3.claimSpellEffectId("darkness", 263)

local DISTANCE_MULT = 10

local vfxs = {}

---@param e tes3magicEffectCollisionEventData
local function onCollision(e)
    if e.collision then
        if (vfxs[e.sourceInstance.serialNumber]) then return end

        local effect = framework.functions.getEffectFromEffectOnEffectEvent(e,
                                                                            tes3.effect
                                                                                .darkness)

        if (effect == nil) then
            framework.log:error(
                "Unable to find effect in tick event. Logical error?")
            return
        end

        local fogId = "OJ_ME_Darkness" .. e.sourceInstance.serialNumber
        local caster = e.sourceInstance.caster
        local effectDuration = effect.duration
        local distance = framework.functions.getCalculatedMagnitudeFromEffect(
                             effect) * DISTANCE_MULT
        local mistPosition = e.collision.point:copy()

        ---@type fogParams
        local fogParams = {
            color = tes3vector3.new(0, 0, 0),
            center = mistPosition,
            radius = tes3vector3.new(distance, distance, distance),
            density = 100
        }

        vfxs[e.sourceInstance.serialNumber] =
            framework.vfx.shaders.fog.createOrUpdateFog(fogId, fogParams)

        -- Add a mechanic to the darkness mesh.
        timer.start({
            duration = 1,
            callback = function()
                local actors = framework.functions.getActorsNearTargetPosition(
                                   caster.cell, mistPosition, distance)

                -- For any actors near the darkness, remove the light effect if it exists.
                for _, actor in pairs(actors) do
                    tes3.removeEffects({
                        reference = actor,
                        effect = tes3.effect.light
                    })

                    --[[
                    local result = tes3.triggerCrime({
                        criminal = caster,
                        type = tes3.crimeType.attack,
                        victim = actor
                    })
                    ]]

                    actor.mobile:startCombat(caster.mobile)
                end
            end,
            iterations = (effectDuration - 1)
        })

        timer.start({
            duration = effectDuration,
            callback = function()
                framework.vfx.shaders.fog.deleteFog(fogId)
                vfxs[e.sourceInstance.serialNumber] = nil
            end
        })
    end
end

---@param e tes3magicEffectTickEventData
local function onTick(e)

    local target = e.effectInstance.target or e.sourceInstance.target or
                       e.sourceInstance.caster

    if (target) then
        local fogId = "OJ_ME_Darkness" .. e.sourceInstance.serialNumber

        local distance = e.effectInstance.effectiveMagnitude * DISTANCE_MULT

        ---@type fogParams
        local fogParams = {
            color = tes3vector3.new(0, 0, 0),
            center = target.position,
            radius = tes3vector3.new(distance, distance, distance),
            density = 100
        }

        -- Check if the effect is just starting, or if we're reloading a save game and no longer tracking VFX.
        if (e.effectInstance.state == tes3.spellState.working) then

            vfxs[e.sourceInstance.serialNumber] =
                framework.vfx.shaders.fog.createOrUpdateFog(fogId, fogParams)
        end

        if (e.effectInstance.state == tes3.spellState.ending) then
            framework.vfx.shaders.fog.deleteFog(fogId)
            vfxs[e.sourceInstance.serialNumber] = nil
        end
    else
        framework.log:error("Invalid target! Target not found.")
    end

    -- Trigger into the spell system.
    if (not e:trigger()) then return end
end

framework.effects.illusion.createBasicEffect({
    -- Base information.
    id = tes3.effect.darkness,
    name = "Darkness",
    description = "Create a sphere of darkness around the target, negating any light effects within.",

    -- Basic dials.
    baseCost = 3.0,

    -- Various flags.
    allowEnchanting = true,
    allowSpellmaking = true,
    canCastTarget = true,
    canCastTouch = true,
    canCastSelf = true,
    unreflectable = false,
    usesNegativeLighting = true,
    isHarmful = true,
    nonRecastable = false,

    -- Graphics/sounds.
    icon = "RFD\\RFD_lf_darkness.dds",
    lighting = {0, 0, 0},

    -- Required callbacks.
    onTick = onTick,
    onCollision = onCollision
})

